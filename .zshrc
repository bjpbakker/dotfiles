setopt PROMPT_SUBST
autoload -U promptinit; promptinit
prompt suse
export PS1="%~/ > "

# Colorize
alias ls='ls -G'
alias ll='ls -lG'
export LSCOLORS='ExGxBxDxCxEgEdxbxgxcxd'
export GREP_OPTIONS='--color'

# Nicer history
export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups
setopt hist_ignore_space
alias fg=' fg'

# Use vim as editor
export EDITOR=vi
# EDITOR=vi implies set -o vi so force it back.
set -o emacs

# Bind C-x C-e to edit current command line in EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# Fix delete key on OS X
bindkey '\e[3~' delete-char

# Highlight matches in ack
export ACK_COLOR_MATCH='red'

# Livin' on the edge
alias yolo=sudo
alias please=sudo

export ZSH=$HOME/.zsh

typeset -U config_files
config_files=($ZSH/*.zsh $HOME/.private/*.zsh(N))

for init in $config_files; do
    source $init
done

unset config_files

# Initialize completion
autoload -U compinit; compinit

