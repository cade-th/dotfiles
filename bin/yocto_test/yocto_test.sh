#!/bin/bash

# System information global variables
# These get initialized in system_check.sh
SHELL_TYPE=""
OS=""
ARCH=""
MY_VAR=""

PACKAGES=("git" "curl")  # Add any other necessary packages here

init() {

    source ./util/system_check.sh
    source ./util/dependencies.sh

    if [ ! -d "./output" ]; then
        mkdir output
    else
        echo "output folder already exists"
    fi

    pushd output > /dev/null
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