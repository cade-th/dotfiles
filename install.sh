stow tmux
stow nvim
stow bash
stow x11

sudo pacman -Syu stow neovim git curl tmux xorg-server xorg-xinit xorg-xrandr xorg-xsetroot kicad upower 

source ./bash/.bashrc

echo "Setup complete! Logout for shell changes to take effect"
