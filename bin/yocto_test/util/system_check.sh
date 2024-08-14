#!/bin/bash

# -----------------------------------------------------------------------------
# This is a function for displaying system information determined in the top level script

# -----------------------------------------------------------------------------

system_info_set() {

    SHELL_TYPE=$SHELL
    OS=$(uname -s)
    ARCH=$(uname -m)
    MY_VAR=${MY_VAR:-default_value}  # This is for checking for environment variables somehow

    local name=$1
    echo "Hello $name"
    echo "Shell: $SHELL_TYPE"
    echo "OS: $OS"
    echo "Arch: $ARCH"
}

system_info_set 