#!/bin/zsh
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle :compinstall filename '/home/james/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob
unsetopt beep
# End of lines configured by zsh-newuser-install
set -o vi
bindkey "^R" history-incremental-pattern-search-backward
[ -d "$HOME"/.sh/ ] && for file in $(ls "$HOME"/.sh/) ; do
	. "$HOME"/.sh/"$file"
done
PS1='%1~ %f%# '
