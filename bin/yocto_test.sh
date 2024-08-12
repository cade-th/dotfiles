#!/bin/bash

echo Hello first script!
if [ $? -ne 0 ]; then
    echo "Error: command failed."
    exit 1
fi
