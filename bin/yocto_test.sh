#!/bin/bash

# System information
SHELL_TYPE=$SHELL
OS=$(uname -s)
ARCH=$(uname -m)
MY_VAR=${MY_VAR:-default_value}  # This is for checking for environment variables somehow

PACKAGES=("git" "curl")  # Add any other necessary packages here

# Display system information
system_info_display() {
    local name=$1 # ig this is how you pass an argument to a function in bash which is so weird
    echo "Hello $name"
    echo "Shell: $SHELL_TYPE"
    echo "OS: $OS"
    echo "Arch: $ARCH"
}

dependencies_check() {
    # Loop through the list of packages
    for pkg in "${PACKAGES[@]}"; do
        # Check if the package is installed on the debian system
        if ! dpkg -l | grep -qw "$pkg"; then
            echo "Package $pkg is not installed. Trying to install..."
            sudo apt-get update
            sudo apt-get install -y "$pkg"

            # Check if the installation was successful
            if dpkg -l | grep -qw "$pkg"; then
                echo "Package $pkg successfully installed."
            else
                echo "Failed to install package $pkg."
                exit 1  # Exit the script if installation fails
            fi
        else
            echo "Package $pkg is installed."
        fi
    done
}

init() {

    system_info_display "cade"
    dependencies_check

    if [ ! -d "./project" ]; then
        mkdir project
    else
        echo "Project folder already exists"
    fi

    pushd project > /dev/null
}

kernel_make() {
    if [ ! -d "./linux-imx" ]; then
        echo "Getting imx kernel repo..."
        mkdir linux-imx
        pushd linux-imx > /dev/null
        
        git clone https://github.com/varigit/linux-imx.git .
        git checkout lf-6.1.y_var02
        popd > /dev/null
    else 
        echo "Kernel directory already exists, skipping clone"
    fi

    if [ ! -d "./stuff2" ]; then
        mkdir stuff2
        pushd stuff2 > /dev/null
        touch hello.txt
        popd > /dev/null
    else
        echo "Stuff2 directory already exists"
    fi
}

# Main function where everything happens
main() {
    init
    kernel_make
    popd > /dev/null  # Go back to the original directory
    echo "Ending in $(pwd)"
}

main
