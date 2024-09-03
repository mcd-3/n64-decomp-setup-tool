#!/bin/bash

### Script file to perform a full setup for all currently completed N64 decompilation projects.
###
### Currently only Ubuntu is supported

echo "==========================================="
echo "|| N64 Decompilation Projects Setup Tool ||"
echo "==========================================="

echo ""
echo "Please wait while this script sets up the projects."
echo "This may take up to 30 minutes."
echo ""

sleep 5s

# Prerequisite: Check for ROM files
sm64_file=$(find roms/ -name sm64.* );
oot_file=$(find roms/ -name oot.* );
pm_file=$(find roms/ -name papermario.* );
bk_file=$(find roms/ -name banjo1.* );

roms_valid=true;

if [ -z "$sm64_file" ]; then
    echo "Super Mario 64 ROM file not found."
    roms_valid=false;
fi

if [ -z "$oot_file" ]; then
    echo "The Legend of Zelda: Ocarina of Time ROM file not found."
    roms_valid=false;
fi

if [ -z "$pm_file" ]; then
    echo "Paper Mario ROM file not found."
    roms_valid=false;
fi

if [ -z "$bk_file" ]; then
    echo "Banjo-Kazooie ROM file not found."
    roms_valid=false;
fi

if [ "$roms_valid" = false ] ; then
    echo "One or more ROM files are missing. Please add them and make sure they are named correctly.";
    echo "Exiting...";
    exit 1;
fi


# Step 1. Clone the repositories
./scripts/clone.sh

# Step 2. Get all the required dependencies
./scripts/dependencies.sh

# Step 3. Copy all the ROMs over to their respective projects
./scripts/roms.sh

# Step 4. Build the projects
./scripts/build.sh

# Step 5. Complete process
echo ""
echo ""
echo ""
echo "Decompilation projects all set up! Happy Decompiling!";