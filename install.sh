stow tmux
stow kicad
stow zsh
stow nvim
stow hyprland
stow waybar
stow kitty

sudo pacman -S xdg-desktop-portal-hyprland \
	wl-clipboard \
	waybar \
	rofi-wayland \
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
    networkmanager \
    network-manager-applet \

# Setup network maanger service

# sudo timedatectl set-timezone America/Chicago

source ~/.zshrc

echo "Setup complete! Logout for shell changes to take effect"
