#!/bin/sh
export EDITOR='kak'
export XDG_CONFIG_HOME="$HOME"/.config

[ -d "$HOME"/.sh/ ] && for file in "$HOME"/.sh/*; do
	. "$file"
done
