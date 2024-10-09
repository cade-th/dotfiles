sudo pacman -Syu stow neovim git curl tmux xorg-server xorg-xinit xorg-xrandr xorg-xsetroot

cd ~

mkdir -p suckless dotfiles

cd ~/dotfiles

stow tmux
stow nvim
stow bash

echo "Setup complete! Logout for shell changes to take effect"
