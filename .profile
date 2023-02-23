#!/bin/sh
export EDITOR='kak'
export XDG_CONFIG_HOME="$HOME"/.config
export XKB_DEFAULT_LAYOUT='us,us(intl)'
export XKB_DEFAULT_OPTIONS='grp:alt_space_toggle'

add_path() {
	! [ -d "$1" ] && return
	case ":${PATH}:" in
		*:"$1":*)
			;;
		*)
			# Prepending path in case a system-installed rustc needs to be overridden
			export PATH="$1:$PATH"
			;;
	esac
}

add_rpath() {
	! [ -d "$1" ] && return
	add_path "$1"
	find -L "$1" -mindepth 1 -type d | while read -r dir ; do
		add_path "$dir"
	done
}

add_rpath "$HOME"/.scripts
add_path "$HOME"/.local/bin
add_path "$HOME"/.cargo/bin
export PATH
