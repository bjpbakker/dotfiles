# If not running interactively, don't do anything
[[ $- != *i* ]] && return

. ~/bin/bash_colors.sh
export PATH="~/bin:$PATH"

export TERM='xterm-256color'
alias ls='ls -G'
alias ll='ls -lG'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"

export HISTCONTROL=erasedups
export HISTIGNORE="fg:bg:genpw"
export HISTSIZE=10000
shopt -s histappend

source /usr/share/git-core/git-prompt.sh

function git_minutes_since_last_commit() {
  local now=`date +%s`
  local last_commit=`git log --pretty=format:'%at' -1`
  local seconds_since_last_commit=$((now-last_commit))
  local minutes_since_last_commit=$((seconds_since_last_commit/60))
  echo $minutes_since_last_commit
}
function git_color() {
  local g="$(__gitdir)"
  if [ -n "$g" ]; then
    local minutes_since_last_commit=`git_minutes_since_last_commit`
    if [ "$minutes_since_last_commit" -gt 30 ]; then
      local color=${RED}
    elif [ "$minutes_since_last_commit" -gt 10 ]; then
      local color=${YELLOW}
    else
      local color=${GREEN}
    fi
    echo -e "$color"
  fi
}
function git_prompt() {
  local g="$(__gitdir)"
  if [ -n "$g" ]; then
    local since_last_commit_prompt="$(git_minutes_since_last_commit)m"
    local git_prompt=`__git_ps1 " {%s|$since_last_commit_prompt}"`
    echo "${git_prompt}"
  fi
}
PS1="\[$WHITE\]\h:\W\[\$(git_color)\]\$(git_prompt)\[$NORMAL\] \u\$ "

alias rbgrep="grep --include='*.rb' $*"
alias jgrep="grep --include='*.java' $*"
alias ls-files="find . -type f"

export MAVEN_OPTS='-Xms128m -Xmx1024m -XX:PermSize=256m -XX:MaxPermSize=512m'
mvn() { /usr/local/bin/mvn $* | tee /tmp/last-mvn ; }

source `brew --prefix`/etc/bash_completion

export PATH="$PATH:$HOME/.rvm/bin"
[[ -s ~/.rvm/scripts/rvm ]] && source ~/.rvm/scripts/rvm
[[ -r ~/.rvm/scripts/completion ]] && source ~/.rvm/scripts/completion

alias npm-exec='PATH=$(npm bin):$PATH'

