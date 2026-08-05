#!/usr/bin/env python3
"""Merge missing PyQuishAI map coordinates into matching AU3 route arrays."""

from __future__ import annotations

import argparse
import ast
import re
import sys
from dataclasses import dataclass
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
AU3_ROOT = ROOT / "Maps"
DEFAULT_PY_ROOT = Path(
    "/tmp/pyquish/Py4GW_Reforged/Sources/aC_Scripts/PyQuishAI_maps"
)

ROUTE_HEAD_RE = re.compile(
    r"Global\s+(\$a\w+Route(\d+))\s*\[(\d+)\]\s*\[2\]\s*=\s*\[",
)
OLD_ASCALON_HEAD_RE = re.compile(
    r"Global\s+\$oldAscalon\s*\[(\d+)\]\s*\[3\]\s*=\s*\[",
)
COORD2_RE = re.compile(r"\[\s*(-?\d+(?:\.\d+)?)\s*,\s*(-?\d+(?:\.\d+)?)\s*\]")
COORD3_RE = re.compile(
    r"\[\s*(-?\d+(?:\.\d+)?)\s*,\s*(-?\d+(?:\.\d+)?)\s*,\s*([^\]]+)\]"
)


@dataclass
class ArrayBlock:
    name: str
    route_n: int | None
    declared: int
    dims: int
    head_start: int
    open_bracket: int
    close_bracket: int  # index of closing ]
    coords2: list[tuple[int, int]]
    coords3: list[tuple[int, int, str]]


def norm_name(name: str) -> str:
    return re.sub(r"[^a-z0-9]", "", name.lower())


def find_matching_bracket(text: str, open_idx: int) -> int:
    depth = 0
    for idx in range(open_idx, len(text)):
        ch = text[idx]
        if ch == "[":
            depth += 1
        elif ch == "]":
            depth -= 1
            if depth == 0:
                return idx
    raise ValueError(f"Unbalanced brackets at {open_idx}")


def extract_py_coords(text: str) -> list[tuple[int, int]]:
    coords: list[tuple[int, int]] = []
    for match in re.finditer(r"^([A-Za-z_][A-Za-z0-9_]*)\s*=\s*\[", text, re.M):
        name = match.group(1)
        if name.endswith(("_ids", "_outpost_path")):
            continue
        start = match.end() - 1
        try:
            end = find_matching_bracket(text, start) + 1
        except ValueError:
            continue
        snippet = text[start:end]

        def walk(obj: object) -> None:
            if isinstance(obj, dict):
                if "path" in obj:
                    walk(obj["path"])
                return
            if isinstance(obj, (list, tuple)):
                if len(obj) == 2 and all(isinstance(n, (int, float)) for n in obj):
                    coords.append((round(float(obj[0])), round(float(obj[1]))))
                else:
                    for item in obj:
                        walk(item)

        try:
            walk(ast.literal_eval(snippet))
        except Exception:
            for x, y in re.findall(
                r"\(\s*(-?\d+(?:\.\d+)?)\s*,\s*(-?\d+(?:\.\d+)?)\s*\)", snippet
            ):
                coords.append((round(float(x)), round(float(y))))
    return coords


def find_near(
    coord: tuple[int, int], points: list[tuple[int, int]], tol: int
) -> int | None:
    x, y = coord
    for idx, (ax, ay) in enumerate(points):
        if abs(ax - x) <= tol and abs(ay - y) <= tol:
            return idx
    return None


def merge_missing(
    au3_coords: list[tuple[int, int]],
    py_coords: list[tuple[int, int]],
    tol: int,
) -> tuple[list[tuple[int, int]], list[tuple[int, int]]]:
    result = list(au3_coords)
    inserted: list[tuple[int, int]] = []
    for i, pc in enumerate(py_coords):
        if find_near(pc, result, tol) is not None:
            continue
        pos = len(result)
        for j in range(i - 1, -1, -1):
            idx = find_near(py_coords[j], result, tol)
            if idx is not None:
                pos = idx + 1
                break
        else:
            for j in range(i + 1, len(py_coords)):
                idx = find_near(py_coords[j], result, tol)
                if idx is not None:
                    pos = idx
                    break
        result.insert(pos, pc)
        inserted.append(pc)
    return result, inserted


def format_route_body(coords: list[tuple[int, int]], indent: str = "        ") -> str:
    if not coords:
        return ""
    # AutoIt requires "_" line continuation through the closing "]" of the array.
    lines = [f"{indent}[{x}, {y}], _" for x, y in coords]
    lines[-1] = f"{indent}[{coords[-1][0]}, {coords[-1][1]}] _"
    return "\n".join(lines)


def format_old_ascalon_body(
    coords: list[tuple[int, int, str]], per_line: int = 33
) -> str:
    chunks: list[str] = []
    for i in range(0, len(coords), per_line):
        part = coords[i : i + per_line]
        items = ",".join(f"[{x},{y},{tag}]" for x, y, tag in part)
        chunks.append(f"    {items}, _")
    # Keep "_" on the final packed line so the closing "]" remains in the statement.
    if chunks:
        chunks[-1] = chunks[-1].removesuffix(", _") + " _"
    return "\n".join(chunks)


def parse_route_arrays(text: str) -> list[ArrayBlock]:
    routes: list[ArrayBlock] = []
    for match in ROUTE_HEAD_RE.finditer(text):
        open_bracket = match.end() - 1
        close_bracket = find_matching_bracket(text, open_bracket)
        body = text[open_bracket + 1 : close_bracket]
        coords = [(int(float(x)), int(float(y))) for x, y in COORD2_RE.findall(body)]
        routes.append(
            ArrayBlock(
                name=match.group(1),
                route_n=int(match.group(2)),
                declared=int(match.group(3)),
                dims=2,
                head_start=match.start(),
                open_bracket=open_bracket,
                close_bracket=close_bracket,
                coords2=coords,
                coords3=[],
            )
        )
    routes.sort(key=lambda r: r.route_n or 0)
    return routes


def parse_old_ascalon(text: str) -> ArrayBlock | None:
    match = OLD_ASCALON_HEAD_RE.search(text)
    if not match:
        return None
    open_bracket = match.end() - 1
    close_bracket = find_matching_bracket(text, open_bracket)
    body = text[open_bracket + 1 : close_bracket]
    coords3 = [
        (int(float(x)), int(float(y)), tag.strip())
        for x, y, tag in COORD3_RE.findall(body)
    ]
    return ArrayBlock(
        name="$oldAscalon",
        route_n=None,
        declared=int(match.group(1)),
        dims=3,
        head_start=match.start(),
        open_bracket=open_bracket,
        close_bracket=close_bracket,
        coords2=[(x, y) for x, y, _ in coords3],
        coords3=coords3,
    )


def is_reverse_pair(routes: list[ArrayBlock]) -> bool:
    if len(routes) != 2:
        return False
    r1, r2 = routes[0].coords2, routes[1].coords2
    return bool(r1) and r1 == list(reversed(r2))


def collect_existing_coords(text: str) -> list[tuple[int, int]]:
    coords = [(int(float(x)), int(float(y))) for x, y in COORD2_RE.findall(text)]
    coords.extend((int(float(x)), int(float(y))) for x, y, _ in COORD3_RE.findall(text))
    return coords


def replace_array_block(
    text: str,
    block: ArrayBlock,
    declared: int,
    body: str,
    dims: int,
) -> str:
    # Keep leading "Global $name[" then rewrite count/body through closing ].
    name = block.name
    prefix = f"Global {name}["
    head_prefix_end = block.head_start + len(prefix)
    # Preserve any continuation marker style after opening bracket ( " _" / " _\n" ).
    # AutoIt array continuations use "[ _" then newline before the first element.
    marker = " _\n"
    if body:
        new_inner = f"{marker}{body}\n"
    else:
        new_inner = f"{marker}"
    replacement = f"{prefix}{declared}][{dims}] = [{new_inner}]"
    return text[: block.head_start] + replacement + text[block.close_bracket + 1 :]


def sync_old_ascalon(text: str, py_coords: list[tuple[int, int]], tol: int) -> tuple[str, int]:
    block = parse_old_ascalon(text)
    if not block:
        return text, 0
    xy = block.coords2
    missing = [c for c in py_coords if find_near(c, collect_existing_coords(text), tol) is None]
    merged_xy, inserted = merge_missing(xy, missing, tol)
    if not inserted:
        return text, 0
    tag_map = {(x, y): tag for x, y, tag in block.coords3}
    rebuilt: list[tuple[int, int, str]] = []
    for c in merged_xy:
        near_idx = find_near(c, xy, tol)
        if near_idx is not None:
            ox, oy, tag = block.coords3[near_idx]
            rebuilt.append((ox, oy, tag))
        else:
            rebuilt.append((c[0], c[1], '""'))
    body = format_old_ascalon_body(rebuilt)
    return replace_array_block(text, block, len(rebuilt), body, 3), len(inserted)


def sync_route_file(text: str, py_coords: list[tuple[int, int]], tol: int) -> tuple[str, int]:
    if "$oldAscalon" in text:
        return sync_old_ascalon(text, py_coords, tol)

    routes = parse_route_arrays(text)
    if not routes:
        return text, 0

    existing_all = collect_existing_coords(text)
    missing_candidates = [
        c for c in py_coords if find_near(c, existing_all, tol) is None
    ]
    if not missing_candidates:
        return text, 0

    if is_reverse_pair(routes):
        merged, inserted = merge_missing(routes[0].coords2, missing_candidates, tol)
        if not inserted:
            return text, 0
        rev = list(reversed(merged))
        # Replace later span first.
        text = replace_array_block(
            text, routes[1], len(rev), format_route_body(rev), 2
        )
        # Re-parse Route01 (still earlier in file; content unchanged before its close).
        routes = parse_route_arrays(text)
        text = replace_array_block(
            text, routes[0], len(merged), format_route_body(merged), 2
        )
        return text, len(inserted)

    flat: list[tuple[int, int]] = []
    owners: list[int] = []
    for route in routes:
        for coord in route.coords2:
            flat.append(coord)
            owners.append(route.route_n or 0)

    merged, inserted = merge_missing(flat, missing_candidates, tol)
    if not inserted:
        return text, 0

    new_owners: list[int] = []
    old_i = 0
    for coord in merged:
        if old_i < len(flat) and coord == flat[old_i]:
            new_owners.append(owners[old_i])
            old_i += 1
        else:
            if new_owners:
                new_owners.append(new_owners[-1])
            elif old_i < len(owners):
                new_owners.append(owners[old_i])
            else:
                new_owners.append(routes[-1].route_n or 0)

    by_n: dict[int, list[tuple[int, int]]] = {r.route_n or 0: [] for r in routes}
    for coord, owner in zip(merged, new_owners):
        by_n.setdefault(owner, []).append(coord)

    for route_n in sorted(by_n.keys(), reverse=True):
        routes = parse_route_arrays(text)
        block = next(r for r in routes if r.route_n == route_n)
        coords = by_n[route_n]
        text = replace_array_block(
            text, block, len(coords), format_route_body(coords), 2
        )

    return text, len(inserted)


def index_au3_files() -> dict[str, Path]:
    files: dict[str, Path] = {}
    for path in AU3_ROOT.rglob("*.au3"):
        if "Caravan" in path.parts or path.name == "LocationsIDS.au3":
            continue
        if "_Templates" in path.parts:
            continue
        files[norm_name(path.stem)] = path
    return files


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--py-root", type=Path, default=DEFAULT_PY_ROOT)
    parser.add_argument("--tol", type=int, default=50)
    parser.add_argument("--dry-run", action="store_true")
    args = parser.parse_args()

    py_root: Path = args.py_root
    if not py_root.is_dir():
        print(f"PyQuishAI maps not found: {py_root}", file=sys.stderr)
        return 1

    au3_files = index_au3_files()
    summary: list[tuple[str, int]] = []
    unmatched: list[str] = []

    for py_path in sorted(py_root.rglob("*.py")):
        if "Unlock" in py_path.parts:
            continue
        key = norm_name(py_path.stem)
        au3_path = au3_files.get(key)
        if au3_path is None:
            unmatched.append(str(py_path.relative_to(py_root)))
            continue

        py_coords = extract_py_coords(
            py_path.read_text(encoding="utf-8", errors="replace")
        )
        if not py_coords:
            continue

        raw = au3_path.read_bytes()
        newline = "\r\n" if b"\r\n" in raw else "\n"
        original = raw.decode("utf-8", errors="replace")
        updated, inserted = sync_route_file(original, py_coords, args.tol)
        if inserted:
            rel = str(au3_path.relative_to(ROOT))
            summary.append((rel, inserted))
            if not args.dry_run:
                out = updated
                if newline == "\r\n":
                    out = out.replace("\r\n", "\n").replace("\n", "\r\n")
                au3_path.write_bytes(out.encode("utf-8"))

    print(f"Updated {len(summary)} map file(s); unmatched python maps: {len(unmatched)}")
    for rel, count in sorted(summary, key=lambda x: (-x[1], x[0])):
        print(f"  +{count:4d}  {rel}")
    if unmatched:
        print("Unmatched:")
        for item in unmatched:
            print(f"  {item}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
