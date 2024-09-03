# N64 Decompilation Project Setup Tool

A tool to download, set up, and build various completed N64 decompilation projects.

The aim of this project is to have an all-in-one place for completed N64 decompilation projects for game preservation purposes.

Note: Completed **recompilation** projects will not be added here. This is purely for tracking completed **decompilation** projects.

Currently supported decompilation projects:

- [Super Mario 64](https://github.com/n64decomp/sm64.git)
- [The Legend of Zelda: Ocarina of Time](https://github.com/zeldaret/oot.git)
- [Paper Mario](https://github.com/pmret/papermario.git)
- [Banjo-Kazooie](https://gitlab.com/banjo.decomp/banjo-kazooie.git)

## Setup
The only currently supported platform is Ubuntu due to dependencies requiring `apt`. You may get this to work on other platforms that have `apt` but I've not tested them. You will also need an original copy of a ROM file of each game you wish to decompile.

1. Copy your original ROM file to the `roms/` directory. You will need to label them as such:
    - Super Mario 64 -> `sm64`
    - The Legend of Zelda: Ocarina of Time -> `oot`
    - Paper Mario -> `papermario`
    - Banjo-Kazooie -> `banjo1`
2. Run the `setup.sh` script. Follow the instruction provided by the script when they appear and wait for it to complete.

## Legal
**__We do not provide any ROM files or proprietary assets! ROM files and their respective assets MUST be obtained LEGALLY!__**



