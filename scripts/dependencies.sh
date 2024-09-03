#!/bin/bash
set -e

### Script file that downloads all necessary dependencies for the decompilation projects
###
### Currently only Ubuntu is supported

function echo_start() {
    echo "Downloading dependencies for ${1} Decompilation...";
}

function echo_complete() {
    echo "Dependencies for ${1} Decompilation downloaded successfully!";
}

# 1. Download Rustup
has_rustup=$(which rustup)

if [ -z "${has_rustup}" ]; then
    echo "Downloading Rustup...";
    echo "Curl is required for this step. Please download curl if curl is not found.";
    curl https://sh.rustup.rs -sSf | sh
else
    echo "Rustup already isntalled. Skipping installation...";
fi

# 2. Download Dependencies
# SM64
if [ -d decomps/sm64/ ]; then
    echo_start "Super Mario 64";
    sudo apt install -y binutils-mips-linux-gnu build-essential git pkgconf python3
    echo_complete "Super Mario 64"
fi

# OOT
if [ -d decomps/oot/ ]; then
    echo_start "The Legend of Zelda: Ocarina of Time";
    sudo apt-get install git build-essential binutils-mips-linux-gnu python3 python3-pip python3-venv libpng-dev libxml2-dev
    echo_complete "The Legend of Zelda: Ocarina of Time";
fi

# Paper Mario
if [ -d decomps/papermario/ ]; then
    echo_start "Paper Mario"

    cargo install pigment64
    cargo install crunch64-cli

    cd decomps/papermario
    ./install_deps.sh
    ./install_compilers.sh
    cd ../..

    echo_complete "Paper Mario"
fi

# Banjo-Kazooie
if [ -d decomps/banjo-kazooie/ ]; then
    echo_start "Banjo-Kazooie"

    cd decomps/banjo-kazooie
    git submodule update --init --recursive
    sudo apt-get install -y $(cat packages.txt)
    python3 -m pip install -r requirements.txt
    cd ../..

    echo_complete "Banjo-Kazooie"
fi

echo "";
echo "Decompilation projects' dependencies successfully installed.";