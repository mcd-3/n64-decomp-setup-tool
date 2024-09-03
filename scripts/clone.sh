#!/bin/bash
set -e

### Script file that clones all fully decompiled N64 decompilation projects.
###
### You will need git installed on your machine for this script to work.

# 1. Check if Git is installed
has_git=$(which git)

if [ -z "${has_git}" ]; then
    echo "Cannot clone repositories. Git is not installed. Please install Git.";
    exit 1;
fi

# 2. Clone repositories
# Repositories are listed in the repositories.txt file
function clone_repository() {
    echo "Cloning: ${2} Decompilation";
    repo=$(cat ../repositories.txt | grep "${1}=" | sed "s/^${1}=//");
    git clone $repo;
    echo "${2} Decompilation cloned successfully!";
}

mkdir decomps
cd decomps

# SM64
clone_repository "sm64" "Super Mario 64";

# OOT
clone_repository "oot" "The Legend of Zelda: Ocarina of Time";

# Paper Mario
clone_repository "papermario" "Paper Mario";

# Banjo-Kazooie
clone_repository "banjo1" "Banjo-Kazooie";

echo "";
echo "Decompilation projects successfully cloned.";
