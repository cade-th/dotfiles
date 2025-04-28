stow tmux
stow nvim
stow zsh
stow kicad
stow i3
stow xmodmap -t ~

sudo apt update
sudo apt install stow git zsh curl tmux i3

source ~/.zshrc

echo "Setup complete! Logout for shell changes to take effect"
