# Setup Aliases
alias vim=nvim
alias sudo='sudo '
alias ls='ls --color'

# Setup nvim as sudo editor
export SUDO_EDITOR='nvim'

# Load shell prompt
eval "$(starship init zsh)"

# Source Antidote (plugin manager)
source  ~/.antidote/antidote.zsh

# Initialize plugins
antidote load

# Shell integrations
eval "$(fzf --zsh)"
export PATH=$PATH:~/.local/bin
eval "$(zoxide init --cmd cd zsh)"

# Completion styling
zstyle ':fzf-tab:*' use-fzf-default-opts yes
zstyle ':fzf-tab:complete:*' fzf-preview 'if [ -d $realpath ]; then ls --color $realpath; else bat --color=always $realpath; fi'
zstyle ':plugin:ez-compinit' 'compstyle' 'gremlin'
zstyle ':fzf-tab:*' fzf-bindings 'tab:accept'

# Keybindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# History configuration
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_find_no_dups
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=false
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=false

# FZF configuration
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--color=border:#313244,label:#cdd6f4 \
--bind=ctrl-f:accept \
--bind=tab:accept"

export _ZO_FZF_OPTS="${FZF_DEFAULT_OPTS} --preview='ls --color $realpath'"

