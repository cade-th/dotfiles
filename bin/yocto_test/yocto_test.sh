#!/bin/bash

# ---------------------------------------------------

# Wrapper script for building yocto 
# Author: Cade Thornton

# ---------------------------------------------------

# System information global variables
# These get initialized in system_check.sh and dependencies.sh so you don't need to change them

SHELL_TYPE=""
OS=""
ARCH=""
MY_VAR=""
PACKAGES=""

# Directory names
YOCTO_DIR="var-fsl-yocto"
GOOGLE_REPO="$HOME/bin/repo"

init() {

    source ./util/system_check.sh
    source ./util/dependencies.sh

    if [ ! -d "./output" ]; then
        mkdir output
    else
        echo "output folder already exists"
    fi

    # This is just for testing and is not needed
    source ./util/dir_make.sh

    # Make the output directory the working directory
    pushd output > /dev/null
    sudo apt-get update && sudo apt-get dist-upgrade
}

# This is coming from the building yocto from source tutorial
yocto_make() {

    # Make google repo tool which is needed to create the imx-yocto directory
    mkdir -p ~/bin
    curl https://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
    chmod a+x ~/bin/repo
    export PATH=~/bin:$PATH
    echo "made Google repo"

    # Make build directory if its not already there
    # if [ ! -d "./$YOCTO_DIR" ]; then

        echo "Creating yocto directory and changing into it..."
        mkdir $YOCTO_DIR
        pushd $YOCTO_DIR > /dev/null
        
        repo init -u https://github.com/varigit/variscite-bsp-platform.git -b kirkstone -m kirkstone-5.15.71-2.2.0.xml
        repo sync -j$(nproc)

        export MACHINE="imx8mp-var-dart"
        export DISTRO="fslc-xwayland"
        export PARALLEL_MAKE="-j $(nproc)"
        export BB_NUMBER_THREADS="$(nproc)"
        . var-setup-release.sh build_xwayland

        # Hopefully getting this point means we can make something
        echo " READY TO BITBAKE yay"

        bitbake -c populate_sdk fsl-image-gui

        popd > /dev/null
    # else 
        # echo "yocto directory already exists, skipping..."
    # fi
}

# Main function where everything happens
main() {
    
    init
    yocto_make
    
    popd > /dev/null  # Go back to the original directory
}

main