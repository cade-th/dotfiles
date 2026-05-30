stow tmux
stow kicad
stow zsh
stow nvim
stow hyprland
stow waybar
stow kitty
stow x11
stow picom
stow rofi

# Update system
sudo pacman -Syu

# Install all necessary packages for this dotfiles environment
sudo pacman -S --needed --noconfirm \
    hyprland waybar rofi-wayland swaybg \
    kitty thunar network-manager-applet \
    ttf-font-awesome ttf-nerd-fonts-symbols \
    wireplumber playerctl brightnessctl pavucontrol \
    stow neovim tmux zsh picom

# Set system timezone to Pacific Time
sudo timedatectl set-timezone America/Los_Angeles

source ~/.zshrc

echo "Setup complete! Logout for shell changes to take effect"
