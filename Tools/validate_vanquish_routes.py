#!/usr/bin/env python3
"""Validate vanquish map scripts, route functions, and caravan aliases."""

from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
MAPS_ROOT = ROOT / "Maps"
LOCATIONS_FILE = MAPS_ROOT / "LocationsIDS.au3"
ROUTES_FILE = ROOT / "Core" / "Vanquish_Routes.au3"

CARAVAN_PREFIXES = ("CaravanAscalon_", "CaravanMaguuma_")
SKIP_FILES = {"LocationsIDS.au3"}
SKIP_DIRS = {"_Templates"}


def load_location_ids() -> dict[str, str]:
    ids: dict[str, str] = {}
    text = LOCATIONS_FILE.read_text(encoding="utf-8", errors="replace")
    for match in re.finditer(r"Global\s+\$([A-Za-z0-9_]+)\s*=\s*([^;\r\n]+)", text):
        ids[match.group(1)] = match.group(2).strip()
    return ids


def normalize_map_name(script_name: str) -> str:
    for prefix in CARAVAN_PREFIXES:
        if script_name.startswith(prefix):
            return script_name[len(prefix):]
    return script_name


def expected_route_function(script_name: str) -> str:
    normalized = normalize_map_name(script_name)
    if normalized == "IceDome":
        return "VQIcedome"
    if script_name.startswith("CaravanAscalon_"):
        return "VQCaravanAscalon_" + script_name[len("CaravanAscalon_"):]
    if script_name.startswith("CaravanMaguuma_"):
        return "VQCaravanMaguuma_" + script_name[len("CaravanMaguuma_"):]
    if script_name.startswith("SpecialRoute_"):
        return "VQ" + script_name
    return "VQ" + script_name


def parse_included_maps() -> list[Path]:
    included: list[Path] = []
    text = ROUTES_FILE.read_text(encoding="utf-8", errors="replace")
    for match in re.finditer(r'#include\s+"\.\.\\Maps\\(.+?\.au3)"', text):
        included.append(MAPS_ROOT / match.group(1).replace("\\", "/"))
    return included


def validate_map_file(path: Path, location_ids: dict[str, str], errors: list[str], warnings: list[str]) -> None:
    rel = path.relative_to(ROOT)
    text = path.read_text(encoding="utf-8", errors="replace")
    script_name = path.stem
    normalized = normalize_map_name(script_name)

    map_var = f"{normalized}_Map"
    if script_name == "IceDome":
        map_var = "Icedome_Map"
    if map_var not in location_ids and not script_name.startswith("SpecialRoute_"):
        errors.append(f"{rel}: missing location id ${map_var}")

    route_func = expected_route_function(script_name)
    if not re.search(rf"Func\s+{re.escape(route_func)}\s*\(", text):
        errors.append(f"{rel}: missing route function {route_func}()")

    route01_match = re.search(r"\$a\w+Route01", text)
    route02_match = re.search(r"\$a\w+Route02", text)
    is_caravan = script_name.startswith("Caravan")
    is_special = script_name.startswith("SpecialRoute_")
    uses_old_ascalon = script_name == "OldAscalon" or script_name == "CaravanAscalon_OldAscalon"

    if uses_old_ascalon:
        if script_name == "OldAscalon" and "$oldAscalon" not in text:
            errors.append(f"{rel}: expected $oldAscalon waypoint array")
        if script_name == "CaravanAscalon_OldAscalon" and "Global $aCaravan" not in text:
            warnings.append(f"{rel}: caravan OldAscalon still uses local waypoint data")
        return

    if is_special:
        return

    if is_caravan:
        refs = re.findall(r"\$a\w+Route0[12]", text)
        if not refs:
            errors.append(f"{rel}: caravan script does not reference shared route arrays")
            return
        for ref in refs:
            source_name = ref[2:]
            if normalized not in source_name:
                warnings.append(f"{rel}: caravan route reference {ref} may not match map {normalized}")
        if re.search(r"Global \$aCaravan", text):
            errors.append(f"{rel}: still defines duplicate caravan route arrays")
        return

    if not route01_match:
        if "MoveandAggroVQ" not in text and "_Vanquisher_RunVanquishRoute" not in text and "AggroMoveTo" not in text:
            warnings.append(f"{rel}: no Route01 array or known route runner found")
    elif route01_match.group(0) != f"$a{path.parent.name}_{script_name}Route01".replace("Proph_", "Proph_").replace("NF_", "NF_"):
        pass

    arrays = re.findall(r"Global (\$a\w+Route0[12])\[\d+\]\[2\]", text)
    for array_name in arrays:
        coords = re.findall(r"\[\s*(-?\d+)\s*,\s*(-?\d+)\s*\]", text[text.find(array_name):text.find("]", text.find(array_name)) + 1])
        if len(coords) >= 2 and coords[0] == coords[1]:
            warnings.append(f"{rel}: {array_name} has duplicate consecutive waypoint {coords[0]}")


def validate_includes(included: list[Path], errors: list[str], warnings: list[str]) -> None:
    discovered: list[Path] = []
    for folder in sorted(MAPS_ROOT.iterdir()):
        if not folder.is_dir() or folder.name in SKIP_DIRS:
            continue
        for path in sorted(folder.glob("*.au3")):
            if path.name in SKIP_FILES:
                continue
            discovered.append(path)

    included_set = {p.resolve() for p in included}
    discovered_set = {p.resolve() for p in discovered}

    missing_from_bundle = sorted(discovered_set - included_set)
    extra_in_bundle = sorted(included_set - discovered_set)

    for path in missing_from_bundle:
        warnings.append(f"{path.relative_to(ROOT)}: map exists on disk but is not included in Vanquish_Routes.au3")
    for path in extra_in_bundle:
        errors.append(f"{path.relative_to(ROOT)}: included in Vanquish_Routes.au3 but file is missing")


def main() -> int:
    errors: list[str] = []
    warnings: list[str] = []

    if not LOCATIONS_FILE.exists():
        print(f"ERROR: missing {LOCATIONS_FILE}")
        return 1

    location_ids = load_location_ids()
    included = parse_included_maps()
    validate_includes(included, errors, warnings)

    for path in included:
        if path.exists():
            validate_map_file(path, location_ids, errors, warnings)

    for warning in warnings:
        print(f"WARNING: {warning}")
    for error in errors:
        print(f"ERROR: {error}")

    print(f"Validated {len(included)} included map scripts.")
    print(f"Warnings: {len(warnings)} | Errors: {len(errors)}")
    return 1 if errors else 0


if __name__ == "__main__":
    sys.exit(main())
