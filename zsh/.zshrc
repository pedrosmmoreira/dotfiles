# ----------------------------------------
# Path
# ----------------------------------------
export PATH="$HOME/.local/bin:$PATH"

# ----------------------------------------
# Build flags for native gem extensions
# ----------------------------------------
export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib -L/opt/homebrew/opt/libpq/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include -I/opt/homebrew/opt/libpq/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig:/opt/homebrew/opt/libpq/lib/pkgconfig"
# ----------------------------------------
# Mise (version manager)
# ----------------------------------------
eval "$(mise activate zsh)"

# ----------------------------------------
# Zoxide (smarter cd)
# ----------------------------------------
eval "$(zoxide init zsh)"

# ----------------------------------------
# Starship prompt
# ----------------------------------------
eval "$(starship init zsh)"

# ----------------------------------------
# Editor
# ----------------------------------------
export EDITOR="nvim"
export VISUAL="nvim"

# ----------------------------------------
# Aliases
# ----------------------------------------

# Navigation
alias ..="cd .."
alias ...="cd ../.."

# Modern replacements
alias cat="bat"
alias ls="eza"
alias ll="eza -la --git --icons"
alias lt="eza -la --tree --level=2 --icons"

# Rails
alias be="bundle exec"
alias rc="bin/rails console"
alias rs="bin/rails server"
alias rr="bin/rails routes"
alias rt="bin/rails test"
alias rdb="bin/rails db:migrate"
alias rdbr="bin/rails db:migrate db:rollback && bin/rails db:migrate db:test:prepare"

# Git — oh-my-zsh / Omarchy style
alias g="git"
alias gs="git status -sb"
alias ga="git add"
alias gaa="git add --all"
alias gc="git commit"
alias gcm="git commit -m"
alias gcam="git commit -am"
alias gca="git commit --amend"
alias gcan="git commit --amend --no-edit"
alias gcb="git checkout -b"
alias gco="git checkout"
alias gd="git diff"
alias gds="git diff --staged"
alias gf="git fetch"
alias gp="git push"
alias gpf="git push --force-with-lease"
alias gl="git pull"
alias glr="git pull --rebase"
alias gb="git branch"
alias gbd="git branch -d"
alias grb="git rebase"
alias grbi="git rebase -i"
alias gm="git merge"
alias glog="git log --oneline --graph --decorate -20"
alias gloga="git log --oneline --graph --decorate --all"
alias gst="git stash"
alias gstp="git stash pop"
alias gcp="git cherry-pick"
alias lg="lazygit"

# Neovim
alias v="nvim"

# Bundler
alias b="bundle"

# ----------------------------------------
# Functions (inspired by thoughtbot/Omarchy)
# ----------------------------------------

# mcd — make directory and cd into it
mcd() {
  mkdir -p "$1" && cd "$1"
}

# g — with no args: git status. With args: acts like git.
# (overrides alias above when used as function)
unalias g 2>/dev/null
g() {
  if [ $# -eq 0 ]; then
    git status -sb
  else
    git "$@"
  fi
}

# n — short nvim, Omarchy-style
n() {
  nvim "${@:-.}"
}

# replace — find and replace in files
# Usage: replace foo bar **/*.rb
replace() {
  if [ $# -lt 3 ]; then
    echo "Usage: replace old new files..."
    return 1
  fi
  local old="$1" new="$2"
  shift 2
  grep -rl "$old" "$@" | xargs sed -i '' "s|$old|$new|g"
}

# migrate — thoughtbot's classic Rails migration safety net
migrate() {
  bin/rails db:migrate db:rollback && bin/rails db:migrate db:test:prepare
}

# ----------------------------------------
# History
# ----------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE

# ----------------------------------------
# Completion
# ----------------------------------------
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ----------------------------------------
# Key bindings
# ----------------------------------------
bindkey -e
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# ----------------------------------------
# FZF
# ----------------------------------------
source <(fzf --zsh)
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export PATH="/opt/homebrew/opt/postgresql@18/bin:$PATH"
