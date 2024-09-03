#!/bin/bash

### Script file to build all fully decompiled N64 decompilation projects
###
### Currently only Ubuntu is supported

# Super Mario 64
if [ -d decomps/sm64/ ]; then
    sm64v=$(cat config.txt | grep "sm64_version=" | sed "s/^sm64_version=//");
    cd decomps/sm64
    make VERSION=$sm64v

    cd ../..
    echo "Super Mario 64 decompilation project built successfully!";
fi

# OOT
if [ -d decomps/oot/ ]; then
    cd decomps/oot
    make setup
    make

    cd ../..
    echo "The Legend of Zelda: Ocarina of Time decompilation project built successfully!";
fi

# Paper Mario
if [ -d decomps/papermario/ ]; then
    cd decomps/papermario
    ./configure
    ninja

    cd ../..
    echo "Paper Mario decompilation project built successfully!";
fi

# Banjo-Kazooie
if [ -d decomps/banjo-kazooie/ ]; then
    cd decomps/banjo-kazooie
    make VERSION=us.v10
    
    cd ../..
    echo "Banjo-Kazooie decompilation project built successfully!";
fi
