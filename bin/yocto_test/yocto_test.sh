#!/bin/bash

# ---------------------------------------------------

# Wrapper script for building yocto 
# Author: Cade Thornton

# ---------------------------------------------------

# System information global variables
# These get initialized in system_check.sh so you don't need to change them
SHELL_TYPE=""
OS=""
ARCH=""
MY_VAR=""

# Directory names
YOCTO_DIR="var-fsl-yocto"
GOOGLE_REPO="$HOME/bin/repo"

# An ongodly amount of packages needed to build the imx-yocto from source
PACKAGES=(
  # General build dependencies
  "git" "curl" "gawk" "wget" "diffstat" "unzip" "texinfo" "gcc-multilib"
  "build-essential" "chrpath" "socat" "cpio" "python3" "python3-pip"
  "python3-pexpect" "xz-utils" "debianutils" "iputils-ping" "libsdl1.2-dev"
  "xterm" "libyaml-dev" "libssl-dev" "autoconf" "libtool" "libglib2.0-dev"
  "libarchive-dev" "sed" "cvs" "subversion" "coreutils" "texi2html"
  "docbook-utils" "help2man" "make" "gcc" "g++" "desktop-file-utils"
  "libgl1-mesa-dev" "libglu1-mesa-dev" "mercurial" "automake" "groff"
  "lzop" "asciidoc" "u-boot-tools" "dos2unix" "mtd-utils" "pv"
  "libncurses5" "libncurses5-dev" "libncursesw5-dev" "libelf-dev"
  "zlib1g-dev" "bc" "rename" "zstd" "libgnutls28-dev" "python3-git"
  "liblz4-tool" "python3-jinja2" "python3-subunit" "locales" "libacl1"
  "python-is-python3"

  # Added dependencies for GTK+3 on Ubuntu (not sure if these are necessary yet)
  "libglib2.0-dev" "libcairo2-dev" "libpango1.0-dev" "libatk1.0-dev"
  "libgdk-pixbuf2.0-dev" "libepoxy-dev" "libx11-dev" "libxi-dev" "libxext-dev"
  "libxrender-dev" "libxrandr-dev" "libxcomposite-dev" "libxcursor-dev"
  "libxdamage-dev" "libxfixes-dev" "libxinerama-dev" "libxft-dev"
  "libxtst-dev" "mesa-common-dev" "wayland-protocols" "libxkbcommon-dev"
  "pkg-config" "meson" "ninja-build" "libjpeg-dev" "libpng-dev"
  "libtiff-dev" "libwebp-dev" "cups"
)




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

    # Make google repo tool
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