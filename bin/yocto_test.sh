#!/bin/bash

SHELL_TYPE=$SHELL
OS=$(uname -s)
ARCH=$(uname -m)
MY_VAR=${MY_VAR:-default_value}  # This is for checking for enviorment variables somehow

system_info_display() {
    
    # Example function parameter cuz I'm learning
    local name=$1
    echo "Hello $1"

    echo "Shell: $SHELL_TYPE"
    echo "OS: $OS"
    echo "Arch: $ARCH"
}

init() {
    if [ ! -d "./project" ]; then
        mkdir project
    fi

    pushd project > /dev/null

}

kernel_make() {
    
    mkdir linux-imx
    pushd linux-imx > /dev/null # do this to temporarily go to a different directory

    git clone https://github.com/varigit/linux-imx.git .
    git checkout lf-6.1.y_var02

    popd > /dev/null # do this to return to the top level directory from init()

    mkdir stuff2
    pushd stuff2 > /dev/null
    touch hello.txt

    popd > /dev/null 
}



# where everything happens
main() {
    
    system_info_display "Cade"
    init
    kernel_make
    echo "Ending in $(pwd)"
}

main