#!/bin/bash

SHELL_TYPE=$SHELL
OS=$(uname -s)
ARCH=$(uname -m)
MY_VAR=${MY_VAR:-default_value}  # Set a default value if MY_VAR is not set

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

    # Work in project
    touch hello.txt

    popd > /dev/null


}

work_in_project() {
    echo "Performing work in $(pwd)"
    # Add your project-specific work here
}

main() {
    init
    system_info_display "Cade"
    echo $(pwd)
}

main