[ -f ~/.env ] && source ~/.env

export TERM="xterm-256color"
export PS1="\W λ "

HISTCONTROL=ignoredups
HISTSIZE=10000

alias please='sudo $(history -p !!)'
