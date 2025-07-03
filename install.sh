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
	grim \
	slurp \
	make \
	kitty \
	ttf-jetbrains-mono-nerd \
	unzip \
	wget \
	xorg-server \
	xorg-xinit \
	xwallpaper \
	picom \
	sysstat \
	zsh \
	stow \
	clang \
	llvm \
	python3 \
	iwd \
	iwd-runit \
	webkit2gtk \ 
	gcr \ 
	gtk3 \ 
	glib2 \ 
	pkgconf

# Setup network maanger service

# sudo timedatectl set-timezone America/Chicago

source ~/.zshrc

echo "Setup complete! Logout for shell changes to take effect"
