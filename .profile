#!/bin/sh
export EDITOR='kak'
export XKB_DEFAULT_LAYOUT='us,us(intl)'
export XKB_DEFAULT_OPTIONS='grp:alt_space_toggle'

export XDG_CONFIG_HOME="$HOME"/.config
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_STATE_HOME="$HOME"/.local/state
export XDG_CACHE_HOME="$HOME"/.cache

export HISTFILE="${XDG_STATE_HOME}"/bash/history
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonrc"
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export TEXMFVAR="$XDG_CACHE_HOME"/texlive/texmf-var
export WINEPREFIX="$XDG_DATA_HOME"/wine

export GOPATH="$HOME"/Documents/prog/go/

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

add_path "$HOME"/.cargo/bin
add_path "$HOME"/.luarocks/bin
add_rpath "$HOME"/.scripts
add_path "$HOME"/.local/bin
export PATH
