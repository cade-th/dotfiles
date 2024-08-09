#!/bin/bash

# Uninstall stowed files (removes symlinks)
cd ~/dotfiles

stow -D tmux
stow -D zsh
stow -D nvim

chsh -s $(which bash)

# Remove LazyVim starter from the nvim directory
rm -rf ~/dotfiles/nvim/.config/nvim

# Remove installed dependencies if desired (uncomment the lines for your platform)
if [ "$(uname)" == "Darwin" ]; then
  # macOS
  # Uncomment the following line if you want to uninstall the packages
  brew uninstall neovim git curl zsh tmux stow
  echo "Uninstallation on macOS: Uncomment the brew uninstall line if desired."
elif [ -n "$(command -v apt-get)" ]; then
  # Ubuntu/Debian
  # Uncomment the following line if you want to uninstall the packages
  sudo apt-get remove --purge -y neovim git curl tmux zsh stow
  echo "Uninstallation on Ubuntu/Debian: Uncomment the apt-get remove line if desired."
elif [ -n "$(command -v pacman)" ]; then
  # Arch Linux
  # Uncomment the following line if you want to uninstall the packages
  sudo pacman -Rns neovim git curl tmux zsh stow --noconfirm
  echo "Uninstallation on Arch Linux: Uncomment the pacman remove line if desired."
fi

echo "Uninstall complete! Symlinks removed and LazyVim starter deleted."
