# CHDMAN-Batch-Tools

Simple Windows batch scripts for converting CD and DVD images to and from CHD format using CHDMAN.

These scripts focus on simplicity. You can drag-and-drop files, run them from the command line, or let them scan folders recursively. There are no dependencies beyond CHDMAN itself.

These tools help with compressing disc-based game images into CHD, or restoring them for use with software that needs `.cue`/`.bin` or `.iso` formats. Common use cases include:

- Game preservation and archival
- Use with emulators (e.g. RetroArch, DuckStation, PCSX2)
- Reducing storage size

## Scripts

| Script               | Converts                  | For Disc Type              |
|----------------------|---------------------------|----------------------------|
| `cd_chd_create.bat`   | `.cue` → `.chd`          | CD (e.g. PS1, Sega Saturn) |
| `cd_chd_extract.bat`  | `.chd` → `.cue` + `.bin` | CD                         |
| `dvd_chd_create.bat`  | `.iso` → `.chd`          | DVD (e.g. PS2, Wii)        |
| `dvd_chd_extract.bat` | `.chd` → `.iso`          | DVD                        |

> **Note:** Use the CD scripts for older systems like PlayStation 1, Sega Saturn, TurboGrafx-CD, etc.  
> Use the DVD scripts for PlayStation 2, GameCube, Wii, and other DVD-based consoles.

## Requirements

- Windows Operating System
- CHDMAN executable (`chdman.exe`) from the official MAME project

## Installation

To use these scripts:

1. Download this repository as a ZIP:  
   [Download ZIP](https://github.com/darklinkpower/CHDMAN-Batch-Tools/archive/refs/heads/main.zip)

2. Extract the `scripts` folder to any folder on your system.

3. Inside the extracted `scripts` folder, place a copy of `chdman.exe` (see below).

4. Use the `.bat` files from that folder via drag-and-drop, double-click, or command line.

### Getting CHDMAN

For safety and security reasons, this repository does **not** include the `chdman.exe` executable. Since you cannot always trust third-party binaries and repositories, it is best to download it yourself directly from the official source. This also ensures you get the most recent and compatible version.

1. Go to the [official MAME tools download page](https://www.mamedev.org/release.html), download and install MAME.
2. Go to the MAME install location and copy the `chdman.exe` executable to the same folder as these `.bat` scripts.

## Usage

### Option 1: Folder Scan (No Arguments)

If you run a script without arguments (e.g. double-click it), it will recursively scan the current folder for supported files and convert all that don't already have matching output files.

### Option 2: Drag and Drop

Drag supported files (e.g. `.cue`, `.chd`, `.iso`) onto the appropriate `.bat` script.

### Option 3: Command Line

```cmd
cd_chd_create.bat "C:\Games\My PS1 Game.cue"
cd_chd_extract.bat "D:\Rips\Some Movie.chd"
```

## Behavior

- Output files are saved in the same folder as the input files
- If the output file already exists, the script skips it
- CHDMAN errors (e.g. invalid input) are shown in the console window

## Credits

[MAME Project](https://www.mamedev.org/) – creators of CHDMAN
