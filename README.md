# Guild Wars Vanquish Bot

GUI-based Guild Wars vanquishing bot built on top of **GwAu3**.

This script is the current vanquish-focused workflow in this workspace. It scans for a logged-in Guild Wars client, connects to a single detected character, lets you choose maps by campaign, and starts a queued vanquish route from the GUI.

## Files

- `GW Vanquish Bot.au3`: small launcher file
- `Guild Wars Vanquish Bot.au3`: main script and controller
- `vanquish_config.ini`: saved character and hero team configuration
- `Core/`: globals, addons, and shared vanquish helpers
- `GUi/`: GUI layout and assets
- `Maps/`: campaign map scripts and templates
- `Moving/`: movement helpers

## Features

- automatic detection of the logged-in Guild Wars character
- guarded single-client connect flow
- campaign tabs for `EOTN`, `Prophecies`, `Factions`, and `Nightfall`
- bulk visible-map selection per campaign
- hero team configuration for `Team4`, `Team6`, and `Team8`
- vanquish history scan from the connected character
- deferred map-state refresh behavior to keep the GUI stable

## Requirements

- Guild Wars running and already logged into a character
- AutoIt3 `3.3.16.1` or newer, 32-bit
- GwAu3 API available in the repository `API/` folder
- Administrator privileges if Guild Wars is running elevated

## Quick Start

1. Launch Guild Wars and log into one character.
2. Open this folder: `Scripts/Guild Wars Vanquish Bot/`
3. Run `GW Vanquish Bot.au3`.
4. Wait for the bot to detect the logged-in character.
5. Click `Connect`.
6. Click `Scan Vanquish History` if you want the status column updated from the live character.
7. Set your heroes for `Team4`, `Team6`, and `Team8`.
8. Choose maps from `EOTN`, `Prophecies`, `Factions`, or `Nightfall`.
9. Click `Start Bot`.

## Configuration

Hero team selections and the last character name are stored in:

```ini
vanquish_config.ini
```

Current sections:

- `[Team4]`
- `[Team6]`
- `[Team8]`
- `[General]`

Example:

```ini
[Team4]
Hero1=Norgu
Hero2=Gwen
Hero3=Olias

[General]
Character=Insert Character Name Here
```

## Running Notes

- Run the script from this folder. It uses relative paths for the config file, GUI image, and map script loading.
- The launcher `GW Vanquish Bot.au3` simply includes `Guild Wars Vanquish Bot.au3`.
- The script uses `#RequireAdmin`.
- Connection is intended for a single detected logged-in Guild Wars client. If multiple characters are detected, the bot will not auto-attach.

## Linux / Wine Notes

This bot is being used under Linux with Wine as well as Windows.

- A 32-bit Wine prefix is recommended.
- The script disables GwAu3 auto-update flags at startup to avoid hangs under Wine.
- Some GUI refresh operations are intentionally deferred because heavy immediate list rebuilds can blank or stall the interface under Wine.
- Live memory-heavy reads should only be used after the client is fully in game.

## Map Coverage

The `Maps/` folder contains campaign-specific vanquish scripts, along with reusable templates in `Maps/_Templates/`.

Campaign groups currently exposed by the GUI:

- `EOTN`
- `Prophecies`
- `Factions`
- `Nightfall`

## Safety

Use at your own risk. This bot automates gameplay and interacts with Guild Wars process memory, which can violate game terms of service.
