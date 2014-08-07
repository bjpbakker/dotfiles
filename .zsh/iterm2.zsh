iterm2_precmd() {
	local title=${PWD##*/}
	_iterm2_update_title $title
}

iterm2_preexec() {
	local title="Running: $1"
	_iterm2_update_title $title
}

iterm2_user_title() {
    add-zsh-hook -d precmd iterm2_precmd
    add-zsh-hook -d preexec iterm2_preexec
	_iterm2_update_title $*
}

_iterm2_update_title() {
	local new_title=$1
	echo -n "\e]1;$new_title\a"
}

add-zsh-hook precmd iterm2_precmd
add-zsh-hook preexec iterm2_preexec

# vim: noet
