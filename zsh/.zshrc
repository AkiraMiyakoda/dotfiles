# Basic behaviors
unsetopt auto_remove_slash

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt extended_history
setopt share_history
setopt hist_ignore_dups
setopt hist_verify
zstyle ':completion:*' history-size $HISTSIZE
zstyle ':completion:*' save-history $SAVEHIST
bindkey '^R' history-incremental-search-backward

# Colors
export TERM=xterm-256color
autoload -U colors; colors
eval "$(dircolors)"

# Default editor
export EDITOR=vim

# Auto completion
autoload -Uz compinit
compinit -C

# Aliases
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l='ls -CFh'
alias la='ls -Ah'
alias ll='ls -alFh'
alias ls='ls --color=auto'

# Add path to ~/.local/bin if exists
[ -d ~/.local/bin ] && PATH=$PATH:~/.local/bin

# Activate Cargo if available
[ -f ~/.cargo/env ] && . ~/.cargo/env

# Activate Go if available
[ -d /usr/local/go/bin ] && PATH=$PATH:/usr/local/go/bin
[ -d ~/go/bin ] && PATH=$PATH:~/go/bin

# Activate Starship if available
command -v starship >/dev/null 2>&1 && eval "$(starship init zsh)"

# Define Docker target platform
command -v docker >/dev/null 2>&1 && export TARGETPLATFORM=$(docker system info --format "{{.OSType}}/{{.Architecture}}")

# Enable GPG to accept passphrase
export GPG_TTY=$(tty)
