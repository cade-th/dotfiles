stow tmux
stow nvim
stow bash

sudo pacman -Syu stow neovim git curl tmux xorg-server xorg-xinit xorg-xrandr xorg-xsetroot kicad upower 

source ./bash/.bashrc

pushd suckless

	pushd dwm > /dev/null

		sudo make clean install

	popd

	pushd dmenu > /dev/null

		sudo make clean install

	popd > /dev/null

	pushd st > /dev/null

		sudo make clean install

	popd > /dev/null

popd



echo "Setup complete! Logout for shell changes to take effect"
