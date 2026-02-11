# Dotfiles

My macOS development environment for Ruby/Rails and TypeScript, managed
with [GNU Stow](https://www.gnu.org/software/stow/).

## Fresh Machine Setup
```bash
# 1. Install Xcode Command Line Tools
xcode-select --install

# 2. Clone this repo
git clone git@github.com:<your-username>/dotfiles.git ~/.dotfiles

# 3. Run the bootstrap script
cd ~/.dotfiles
./install.sh
```

## What's Included

### Tools
- **Neovim** — editor with LSP, Treesitter, fzf-lua, vim-test
- **Ghostty** — terminal (rose-pine-moon theme)
- **Zsh** — shell with Starship prompt
- **Mise** — Ruby + Node version management
- **Git** — config with useful aliases
- **Lazygit** — Git TUI

### CLI Replacements
- `bat` → cat with syntax highlighting
- `eza` → ls with icons and git status
- `zoxide` → smarter cd
- `ripgrep` → faster grep
- `fd` → faster find
- `fzf` → fuzzy finder

## Structure
```
~/.dotfiles/
├── ghostty/.config/ghostty/config
├── git/.gitconfig
├── git/.gitignore_global
├── mise/.config/mise/config.toml
├── nvim/.config/nvim/init.lua
├── starship/.config/starship.toml
├── zsh/.zshrc
├── Brewfile
├── install.sh
└── README.md
```

## Managing Dotfiles
```bash
cd ~/.dotfiles

# Link a single package
stow ghostty

# Link all packages
stow */

# Unlink a package
stow -D ghostty

# Re-link after changes
stow -R ghostty
```

## Adding New Configs

1. Create a directory matching the tool name
2. Mirror the path from `$HOME` inside it
3. Run `stow <package>`

## Updating
```bash
cd ~/.dotfiles
brew bundle                  # install any new Homebrew packages
stow */                      # re-link all dotfiles
nvim --headless "+Lazy! sync" +qa  # update Neovim plugins
```
