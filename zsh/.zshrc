# ----------------------------------------
# Path
# ----------------------------------------
# Homebrew is already in PATH via .zprofile
# Add any extra paths here
export PATH="$HOME/.local/bin:$PATH"

# ----------------------------------------
# Mise (version manager)
# ----------------------------------------
eval "$(mise activate zsh)"

# ----------------------------------------
# Aliases
# ----------------------------------------
alias ll="ls -la"
alias ..="cd .."
alias ...="cd ../.."

# Rails shortcuts
alias be="bundle exec"
alias rc="bin/rails console"
alias rs="bin/rails server"
alias rr="bin/rails routes"
alias rt="bin/rails test"
alias rdb="bin/rails db:migrate"

# Git (supplement .gitconfig aliases)
alias gs="git status"
alias gd="git diff"
alias gp="git push"
alias gl="git pull"
alias gc="git commit"
alias gco="git checkout"
alias gb="git branch"
alias glog="git log --oneline --graph --decorate -20"

# ----------------------------------------
# Editor
# ----------------------------------------
export EDITOR="nvim"
export VISUAL="nvim"

# ----------------------------------------
# History
# ----------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY          # Share history across all sessions
setopt HIST_IGNORE_ALL_DUPS   # Remove older duplicate entries
setopt HIST_REDUCE_BLANKS     # Remove blank lines from history
setopt HIST_IGNORE_SPACE      # Don't record commands starting with space

# ----------------------------------------
# Completion
# ----------------------------------------
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'  # Case-insensitive tab completion

# ----------------------------------------
# Key bindings
# ----------------------------------------
bindkey -e                          # Emacs-style bindings (default macOS feel)
bindkey '^[[A' history-search-backward   # Up arrow searches history
bindkey '^[[B' history-search-forward    # Down arrow searches history
