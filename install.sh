stow tmux
stow nvim
stow bash
stow x11
stow kicad

sudo pacman -Syu stow neovim git curl tmux xorg-server xorg-xinit xorg-xrandr xorg-xsetroot kicad upower base-devel llvm clang cmake make gcc
 

source ./bash/.bashrc

echo "Setup complete! Logout for shell changes to take effect"
