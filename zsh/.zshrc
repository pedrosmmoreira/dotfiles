# ----------------------------------------
# Path
# ----------------------------------------
export PATH="$HOME/.local/bin:$PATH"

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

# Git (supplement .gitconfig aliases)
alias gs="git status"
alias gd="git diff"
alias gp="git push"
alias gl="git pull"
alias gc="git commit"
alias gco="git checkout"
alias gb="git branch"
alias glog="git log --oneline --graph --decorate -20"
alias lg="lazygit"

# Neovim
alias v="nvim"

# Bundler
alias b="bundle"

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
