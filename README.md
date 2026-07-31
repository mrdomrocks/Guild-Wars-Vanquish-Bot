# Guild Wars Vanquish Bot

GUI-based Guild Wars vanquishing bot built on top of **GwAu3**.

This is the active vanquish workflow in this repo. The bot detects a logged-in Guild Wars client, connects to one character, scans completed vanquishes from live game memory, builds a checked-map queue from the GUI, and runs each route with automatic team setup and shared caravan logic.

## Files

- `GW Vanquish Bot.au3`: launcher entry point
- `Guild Wars Vanquish Bot.au3`: main GUI, queue builder, and runtime controller
- `vanquish_config.ini`: saved hero selections
- `Core/Vanquish_Routes.au3`: shared include list for all route scripts
- `Core/Caravan_Controller.au3`: compatibility entry for caravan flow
- `Core/Caravan_RouteController.au3`: route-profile and caravan readiness checks
- `Core/Caravan_VanquishManager.au3`: delayed completion logic for caravan maps
- `Core/Caravan_PortalController.au3`: dynamic portal routing and caravan transitions
- `GUi/`: tabbed interface and assets
- `Maps/`: vanquish scripts, caravan route scripts, and templates

## Features

- automatic detection of a single logged-in Guild Wars character
- guarded connect flow that refuses to auto-attach when multiple clients are logged in
- campaign tabs for `EOTN`, `Prophecies`, `Caravan Routes`, `Factions`, and `Nightfall`
- per-campaign checked-map queue building from the GUI
- live vanquish history scan that marks completed zones and prevents re-checking them
- hero team configuration for `Team4`, `Team6`, and `Team8`, with automatic team setup based on the first queued map
- queue logging, run timer, death counter, and vanquish streak tracking
- automatic consumable use on farm-map entry before movement starts
- smart casting integrated into the fight routine for automated combat skill usage
- deferred map-state refresh and GUI reload handling for better runtime stability

## Caravan Routing

The caravan system has been refactored into dedicated controllers and now supports shared routing behavior instead of per-map hardcoded portal arrays.

- caravan map scripts are exposed in the `Caravan Routes` tab
- special Temple of the Ages entries expand into full caravan queues
- current special routes:
  - `TOA Ascalon Caravan`
  - `TOA Maguuma Caravan`
- dynamic portal travel uses `Map_GetPathWithPortalCoords()` and `_Vanquisher_RunDynamicCaravanGoOut()`
- caravan maps continue their full coordinate list even after the vanquish flag flips
- direct explorable-to-next-map caravan catch-up is supported when a valid shared portal path exists
- portal progression only advances after the map actually changes, which avoids transit-zone loop issues

## Requirements

- Guild Wars running and already logged into one character
- AutoIt3 `3.3.16.1` or newer, 32-bit
- GwAu3 API available in the repository `API/` folder
- administrator privileges if Guild Wars is running elevated

## Quick Start

1. Launch Guild Wars and log into one character.
2. Open `Scripts/Guild Wars Vanquish Bot/`.
3. Run `GW Vanquish Bot.au3`.
4. Wait for the bot to detect the logged-in character.
5. Click `Connect To Client`.
6. Click `Scan Vanquish Maps` to load completed-zone status from the live character.
7. Set heroes for `Team4`, `Team6`, and `Team8`, then click `Save Config` if you want to persist them.
8. Check the maps you want to run from the campaign tabs.
9. Return to an outpost if needed, then click `Start Checked Maps`.

## Queue Behavior

- the bot only starts from an outpost
- already-vanquished maps are greyed out, unchecked, and skipped from queue building
- special caravan entries expand into their full ordered route automatically
- the first queued map decides which hero-team size must be available
- when the queue advances, the bot reuses the shared caravan transition logic where possible instead of always returning to an outpost

## Configuration

Hero selections are stored in:

```ini
vanquish_config.ini
```

Current sections:

- `[Team4]`
- `[Team6]`
- `[Team8]`

Example:

```ini
[Team4]
Hero1=Norgu
Hero2=Gwen
Hero3=Olias

[Team8]
Hero1=Gwen
Hero2=Olias
Hero3=Norgu
Hero4=Razah
Hero5=Xandra
Hero6=Livia
Hero7=Master of Whispers
```

## Running Notes

- run the script from this folder because it relies on relative paths for config, GUI assets, and map loading
- `GW Vanquish Bot.au3` simply includes `Guild Wars Vanquish Bot.au3`
- the script uses `#RequireAdmin`
- connection is intended for one detected logged-in Guild Wars client
- combat handling includes smart casting during the fight routine, while some healing logic stays separate
- in pre-searing, these skills are still excluded from smart casting due to known compatibility issues:
  - `Glyph of Lesser Energy`
  - `Ignite Arrows`
  - `Read the Wind`
  - `Frenzy`

## Linux / Wine Notes

This bot is used under Linux with Wine as well as Windows.

- a 32-bit Wine prefix is recommended
- GwAu3 auto-update flags are disabled at startup to avoid Wine hangs
- some GUI refresh work is intentionally deferred because aggressive list rebuilds can blank or stall the interface under Wine
- memory-heavy reads should be done only after the client is fully in game

## Map Coverage

The `Maps/` folder contains campaign-specific vanquish scripts, caravan route scripts, and reusable templates in `Maps/_Templates/`.

Campaign groups currently exposed by the GUI:

- `EOTN`
- `Prophecies`
- `Caravan Routes`
- `Factions`
- `Nightfall`

## Safety

Use at your own risk. This bot automates gameplay and interacts with Guild Wars process memory, which can violate game terms of service.
