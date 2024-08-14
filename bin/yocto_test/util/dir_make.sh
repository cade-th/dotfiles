#!/bin/bash

# -----------------------------------------------------------------------------
# This is an example function to make a directory

# -----------------------------------------------------------------------------

example_mkdir() {
    if [ ! -d "./output/stuff2" ]; then
        mkdir ./output/stuff2
        pushd ./output/stuff2 > /dev/null
        touch hello.txt
        popd > /dev/null
    else
        echo "Stuff2 directory already exists"
    fi
}

example_mkdir