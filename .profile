#!/bin/sh
export EDITOR='vis'
export XDG_CONFIG_HOME="$HOME"/.config
export ZDOTDIR="$XDG_CONFIG_HOME"/zsh

[ -d "$HOME"/.sh/ ] && for file in "$HOME"/.sh/*; do
	. "$file"
done
