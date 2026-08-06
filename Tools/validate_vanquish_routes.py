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


def validate_caravan_portal_controller(errors: list[str]) -> None:
    """AutoIt IsFunc() only accepts function references, not Call() name strings."""
    path = ROOT / "Core" / "Caravan_PortalController.au3"
    if not path.exists():
        errors.append(f"{path.relative_to(ROOT)}: missing caravan portal controller")
        return

    for line_no, line in enumerate(path.read_text(encoding="utf-8", errors="replace").splitlines(), 1):
        code = line.split(";", 1)[0]
        match = re.search(r"IsFunc\(\s*\$s\w+\s*\)", code)
        if match:
            errors.append(
                f"{path.relative_to(ROOT)}:{line_no}: {match.group(0)} guards a string name; "
                "Call() string function names must not use IsFunc()"
            )


def validate_maguuma_caravan_expansion(errors: list[str]) -> None:
    """TOA Maguuma Caravan vanquishes each map then portals to the next when possible."""
    bot = ROOT / "Guild Wars Vanquish Bot.au3"
    text = bot.read_text(encoding="utf-8", errors="replace")
    if 'VQSpecialRoute_TempleOfTheAgesMaguumaCaravan' not in text:
        errors.append(f"{bot.relative_to(ROOT)}: Maguuma special route must register VQSpecialRoute_TempleOfTheAgesMaguumaCaravan")
    if "TOA Maguuma Caravan" in text:
        maguuma_block = text.split("TOA Maguuma Caravan", 1)[1].split("EndFunc", 1)[0]
        # Maguuma special entry must not use a real map id or history scan greys it out.
        if "$TalmarkWilderness_Map" in maguuma_block or re.search(
            r"\$g_aMapEntries\[\$iNext \+ 1\]\[4\]\s*=\s*(?!0\b)", maguuma_block
        ):
            errors.append(
                f"{bot.relative_to(ROOT)}: TOA Maguuma Caravan map id must be 0 "
                "so history scan cannot mark it vanquished"
            )
    if "Or _IsSpecialRouteScriptName(" not in text:
        errors.append(
            f"{bot.relative_to(ROOT)}: vanquish history scan must skip special caravan routes"
        )

    special = MAPS_ROOT / "Caravan_Maguuma" / "SpecialRoute_TempleOfTheAgesMaguumaCaravan.au3"
    if not special.exists():
        errors.append(f"{special.relative_to(ROOT)}: missing Maguuma special route runner")
    else:
        body = special.read_text(encoding="utf-8", errors="replace")
        for needle in (
            "Func VQSpecialRoute_TempleOfTheAgesMaguumaCaravan(",
            "_Vanquisher_MaguumaCaravanGoOutToMap",
            "_Vanquisher_MaguumaCaravanRunVanquish",
            "_Vanquisher_MaguumaCaravanIsVanquishedAfterLoad",
            "_Vanquisher_IsAlreadyVanquishedOnEntry",
            "_Vanquisher_MaguumaCaravanAdvanceAfterVanquish",
            "_TempleAscalonCaravanTryCatchUp",
            "_TempleAscalonCaravanCanDirectTransition",
            "_Vanquisher_ReturnToOutpost",
            "already vanquished on entry",
            "Portaling to ",
            "Starting ",
        ):
            if needle not in body:
                errors.append(f"{special.relative_to(ROOT)}: missing {needle}")
        if "Resigning for next map." in body and "Portaling to " not in body:
            errors.append(
                f"{special.relative_to(ROOT)}: Maguuma must portal between maps when a path exists"
            )

    plan = ROOT / "Core" / "Caravan_MaguumaPlan.au3"
    if not plan.exists():
        errors.append(f"{plan.relative_to(ROOT)}: missing Maguuma caravan plan")
    else:
        plan_text = plan.read_text(encoding="utf-8", errors="replace")
        for label in (
            "TalmarkWilderness",
            "MajestysRest",
            "SageLands",
            "MamnoonLagoon",
            "Silverwood",
            "EttinsBack",
            "ReedBog",
            "TheFalls",
            "DryTop",
            "TangleRoot",
        ):
            if label not in plan_text:
                errors.append(f"{plan.relative_to(ROOT)}: plan must include {label}")
        if "MajestysRest -> SageLands" in plan_text and "Resign+TravelTo only when" in plan_text:
            errors.append(
                f"{plan.relative_to(ROOT)}: MajestysRest -> SageLands is a continuous portal, not a resign break"
            )
        if "$SageLands_Transit" not in plan_text:
            errors.append(f"{plan.relative_to(ROOT)}: SageLands stage must use $SageLands_Transit (Majesty's Rest)")
        if "$MamnoonLagoon_Transit2" not in plan_text:
            errors.append(f"{plan.relative_to(ROOT)}: Mamnoon stage must use $MamnoonLagoon_Transit2 (Sage Lands)")

    locations = ROOT / "Maps" / "LocationsIDS.au3"
    loc_text = locations.read_text(encoding="utf-8", errors="replace")
    if "SageLands_Transit" not in loc_text:
        errors.append(f"{locations.relative_to(ROOT)}: missing SageLands_Transit (Majesty's Rest)")
    if "MamnoonLagoon_Transit2" not in loc_text:
        errors.append(f"{locations.relative_to(ROOT)}: missing MamnoonLagoon_Transit2 (Sage Lands)")

    sage = MAPS_ROOT / "Proph_Maguuma" / "SageLands.au3"
    sage_text = sage.read_text(encoding="utf-8", errors="replace")
    if "$SageLands_Transit" not in sage_text or "aSageLandsTransitPath" not in sage_text:
        errors.append(f"{sage.relative_to(ROOT)}: GoOutSageLands must handle Majesty's Rest transit")

    compat = ROOT / "Core" / "Vanquisher_Compat.au3"
    compat_text = compat.read_text(encoding="utf-8", errors="replace")
    if "Func WaitForLoad(" not in compat_text:
        errors.append(
            f"{compat.relative_to(ROOT)}: missing WaitForLoad() — portal GoOut paths call it by default"
        )


def main() -> int:
    errors: list[str] = []
    warnings: list[str] = []

    if not LOCATIONS_FILE.exists():
        print(f"ERROR: missing {LOCATIONS_FILE}")
        return 1

    location_ids = load_location_ids()
    included = parse_included_maps()
    validate_includes(included, errors, warnings)
    validate_caravan_portal_controller(errors)
    validate_maguuma_caravan_expansion(errors)

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
