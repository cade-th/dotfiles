#!/bin/bash

# -----------------------------------------------------------------------------
# This is a function for checking for dependencies on a debian system via grepping
# though dpkg -l

# -----------------------------------------------------------------------------

dependencies_check() {

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
        # but I tried to use them to fix the current build error I'm gettin with gtk
        "libglib2.0-dev" "libcairo2-dev" "libpango1.0-dev" "libatk1.0-dev"
        "libgdk-pixbuf2.0-dev" "libepoxy-dev" "libx11-dev" "libxi-dev" "libxext-dev"
        "libxrender-dev" "libxrandr-dev" "libxcomposite-dev" "libxcursor-dev"
        "libxdamage-dev" "libxfixes-dev" "libxinerama-dev" "libxft-dev"
        "libxtst-dev" "mesa-common-dev" "wayland-protocols" "libxkbcommon-dev"
        "pkg-config" "meson" "ninja-build" "libjpeg-dev" "libpng-dev"
        "libtiff-dev" "libwebp-dev" "cups"
    )

    for pkg in "${PACKAGES[@]}"; do
        if ! dpkg -l | grep -qw "$pkg"; then
            echo "Package $pkg is not installed. Trying to install..."
            sudo apt-get update
            sudo apt-get install -y "$pkg"
            if dpkg -l | grep -qw "$pkg"; then
                echo "Package $pkg successfully installed."
            else
                echo "Failed to install package $pkg."
                exit 1 
            fi # <- Add this fi to close the inner if statement
        else
            echo "Package $pkg is already installed."
        fi
    done
}
dependencies_check
