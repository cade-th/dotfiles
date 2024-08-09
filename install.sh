# Set up symlinks
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/nvim ~/.config/nvim

# Install dependencies
if [ "$(uname)" == "Darwin" ]; then
  # macOS
  brew install neovim
elif [ -n "$(command -v apt-get)" ]; then
  # Ubuntu/Debian
  sudo apt-get update
  sudo apt-get install -y neovim git curl
elif [ -n "$(command -v pacman)" ]; then
  # Arch Linux
  sudo pacman -Syu neovim git curl --noconfirm
fi

# Set up Neovim
nvim --headless "+Lazy sync" +qa

echo "Setup complete! You can now start Neovim with LazyVim configured."
