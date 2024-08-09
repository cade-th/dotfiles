# Install dependencies
if [ "$(uname)" = "Darwin" ]; then
  # macOS
  brew install stow neovim git curl zsh tmux
elif [ -n "$(command -v apt-get)" ]; then
  # Ubuntu/Debian
  sudo apt-get update
  sudo apt-get install -y stow neovim git curl tmux zsh
elif [ -n "$(command -v pacman)" ]; then
  # Arch Linux
  sudo pacman -Syu stow neovim git curl tmux zsh --noconfirm
fi

# Clone LazyVim starter into nvim directory
git clone https://github.com/LazyVim/starter.git ~/dotfiles/nvim/.config/nvim

cd ~/dotfiles

rm -rf /nvim/.config/nvim/.git

stow tmux
stow zsh
stow nvim

# Set up Neovim
nvim --headless "+Lazy sync" +qa

chsh -s $(which zsh)

echo "Setup complete! Logout for shell changes to take effect"
