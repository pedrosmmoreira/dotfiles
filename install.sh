#!/bin/bash
set -e

DOTFILES_DIR="$HOME/.dotfiles"

echo "==> Starting macOS dev setup..."

# ----------------------------------------
# Xcode Command Line Tools
# ----------------------------------------
if ! xcode-select -p &> /dev/null; then
  echo "==> Installing Xcode Command Line Tools..."
  xcode-select --install
  echo "    Press any key once the installation is complete."
  read -n 1 -s
fi

# ----------------------------------------
# Homebrew
# ----------------------------------------
if ! command -v brew &> /dev/null; then
  echo "==> Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  if [[ $(uname -m) == "arm64" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
fi

echo "==> Installing packages from Brewfile..."
brew bundle --file="$DOTFILES_DIR/Brewfile"

# ----------------------------------------
# Stow dotfiles
# ----------------------------------------
echo "==> Linking dotfiles with Stow..."
cd "$DOTFILES_DIR"

backup_if_exists() {
  local file="$HOME/$1"
  if [ -f "$file" ] && [ ! -L "$file" ]; then
    echo "    Backing up $1 → $1.bak"
    mv "$file" "$file.bak"
  fi
}

backup_if_exists ".zshrc"
backup_if_exists ".gitconfig"
backup_if_exists ".gitignore_global"

for dir in ghostty git mise nvim starship zsh; do
  echo "    Stowing $dir..."
  stow "$dir"
done

# ----------------------------------------
# Mise: install runtimes
# ----------------------------------------
echo "==> Installing Ruby and Node via mise..."
eval "$(mise activate bash)"
mise install

# ----------------------------------------
# Neovim: install plugins
# ----------------------------------------
echo "==> Installing Neovim plugins..."
nvim --headless "+Lazy! sync" +qa

# ----------------------------------------
# Done
# ----------------------------------------
echo ""
echo "==> Setup complete!"
echo ""
echo "    Next steps:"
echo "    1. Restart your terminal"
echo "    2. Update git config with your name/email:"
echo "       nvim ~/.dotfiles/git/.gitconfig"
echo "    3. Authenticate GitHub CLI:"
echo "       gh auth login"
echo ""
