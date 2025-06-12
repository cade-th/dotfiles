stow tmux
stow kicad
stow zsh
stow nvim
stow hyprland
stow waybar
stow kitty
stow x11
stow picom

sudo pacman -S \
	xdg-desktop-portal-hyprland \
	wl-clipboard \
	waybar \
	rofi-wayland \
	hyprland \
	swaylock \
	swayidle \
	grim \
	slurp \
	make \
	kitty \
	ttf-jetbrains-mono-nerd \
	swww \
	unzip \
	wget \
	xorg-server \
	xorg-xinit \
	xwallpaper \
	picom \

# Setup network maanger service

# sudo timedatectl set-timezone America/Chicago

source ~/.zshrc

echo "Setup complete! Logout for shell changes to take effect"
