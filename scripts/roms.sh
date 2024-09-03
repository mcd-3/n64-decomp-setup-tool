#!/bin/bash

### Script file that copies and renames ROMs to their respective decompilation projects
###
### ROM files are NOT provided. You will need to obtain your own ROM files LEGALLY!

### TODO: There's a lot of repeated code in this file, maybe modulate it?

echo "Copying ROMs...";

function print_not_supported() {
    echo "Version ${1} is not supported for ${2}. Skipping...";
}

function print_success() {
    echo "${1} successfully copied.";
}

# SM64
sm64_file=$(find roms/ -name sm64.* );
if [ ! -z "$sm64_file" ] && [ "${sm64_file: -4}" == ".z64" ]; then
    if [ -d decomps/sm64/ ]; then
        sm64v=$(cat config.txt | grep "sm64_version=" | sed "s/^sm64_version=//");

        # Supported versions: us, jp, eu, sh, ch
        if [[ $sm64v == "us" ]] || [[ $sm64v == "jp" ]] || [[ $sm64v == "eu" ]] || [[ $sm64v == "sh" ]] || [[ $sm64v == "ch" ]]; then
            cp roms/sm64.z64 decomps/sm64/

            # Needs to be renamed as "baserom.[version].z64"
            mv decomps/sm64/sm64.z64 decomps/sm64/baserom.${sm64v}.z64

            print_success "Super Mario 64";
        else
            print_not_supported $sm64v "Super Mario 64";
        fi
    fi
fi

# OOT
oot_file=$(find roms/ -name oot.* );
if [ ! -z "$oot_file" ]; then
    # OOT decomp supports the most file formats. Need to check all 3 of them.
    if [ "${oot_file: -4}" == ".z64" ] || [ "${oot_file: -4}" == ".n64" ] || [ "${oot_file: -4}" == ".v64" ]; then
        if [ -d decomps/oot/ ]; then
            ootv=$(cat config.txt | grep "oot_version=" | sed "s/^oot_version=//");
            # Supported versions: gc-eu-mq-dbg
            if [[ $ootv == "gc-eu-mq-dbg" ]]; then
                extension="${oot_file: -4}"
                cp roms/oot${extension} decomps/oot/baseroms/${ootv}/

                # Needs to be renamed as "baserom.z64"
                mv decomps/oot/baseroms/${ootv}/oot${extension} decomps/oot/baseroms/${ootv}/baserom${extension}

                print_success "The Legend of Zelda: Ocarina of Time";
            else
                print_not_supported $sm64v "The Legend of Zelda: Ocarina of Time"
            fi
        fi
    else
        echo "File extension not supported. Supported formats: .z64, .n64, .v64"
    fi
fi

# Paper Mario
pm_file=$(find roms/ -name papermario.* );
if [ ! -z "$pm_file" ] && [ "${pm_file: -4}" == ".z64" ]; then
    if [ -d decomps/papermario/ ]; then
        pmv=$(cat config.txt | grep "papermario_version=" | sed "s/^papermario_version=//");

        # Supported versions: us, ique
        if [[ $pmv == "us" ]] || [[ $pmv == "ique" ]]; then
            cp roms/papermario.z64 decomps/papermario/ver/$pmv/

            # Needs to be renamed as "baserom.z64"
            mv decomps/papermario/ver/$pmv/papermario.z64 decomps/papermario/ver/$pmv/baserom.z64

            print_success "Paper Mario";
        else
            print_not_supported $pmv "Paper Mario";
        fi
    fi
fi

# Banjo-Kazooie
bk_file=$(find roms/ -name banjo1.* );
if [ ! -z "$bk_file" ] && [ "${bk_file: -4}" == ".z64" ]; then
    if [ -d decomps/banjo-kazooie/ ]; then
        bkv=$(cat config.txt | grep "banjo1_version=" | sed "s/^banjo1_version=//");

        # Supported versions: us, ique
        if [[ $bkv == "us10" ]]; then
            cp roms/banjo1.z64 decomps/banjo-kazooie/

            # Needs to be renamed as "baserom.us.v10.z64"
            # If other versions are supported in the future, we will need to implement a more complex check here
            mv decomps/banjo-kazooie/banjo1.z64 decomps/banjo-kazooie/baserom.us.v10.z64

            print_success "Banjo-Kazooie";
        else
            print_not_supported $bkv "Banjo-Kazooie";
        fi
    fi
fi
