HISTFILE=$ZSH/log/.zhistory

HISTSIZE=1000

SAVEHIST=1000

setopt hist_ignore_all_dups

setopt COMBINING_CHARS

setopt hist_reduce_blanks

setopt share_history

setopt append_history

setopt hist_ignore_dups

setopt hist_ignore_space

setopt hist_no_store

bindkey '^P' history-beginning-search-backward
bindkey '^R' history-incremental-pattern-search-backward

bindkey '^N' history-beginning-search-forward
bindkey '^S' history-incremental-pattern-search-forward

function chpwd() { ls }

# To disable highlighting of globbing expressions
#ZSH_HIGHLIGHT_STYLES[globbing]='none'
