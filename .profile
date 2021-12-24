#!/bin/sh
export EDITOR=vi

[ -d "$HOME"/.sh/ ] && for file in "$HOME"/.sh/* ; do
	. $file
done
