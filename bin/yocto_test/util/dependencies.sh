#!/bin/bash

# -----------------------------------------------------------------------------
# This is a function for checking for dependencies on a debian system via grepping
# though dpkg -l

# -----------------------------------------------------------------------------
dependencies_check() {
    local packages=("git" "curl")  # Add any other necessary packages here

    # Loop through the list of packages
    for pkg in "${packages[@]}"; do
        # Check if the package is installed on the Debian system
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
            echo "Package $pkg is already installed."
        fi
    done
}

dependencies_check
