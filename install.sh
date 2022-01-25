#!/bin/sh

link() {
	src=$1
	dest=$2
	if [ -d "$dest" ] || [ -f "$dest" ]; then
		printf "%s already exists\n" "$dest"
	else
		printf "%s -> %s\n" "$src" "$dest"
		ln -s "$src" "$dest"
	fi
}

link_dots() {
	home="$(find . -mindepth 1 -maxdepth 1 \
		\( -path ./.git -o -path ./.config \) -prune \
		-o ! -name "install.sh" -print)"
	conf="$(find .config -mindepth 1 -maxdepth 1)"
	printf "%s\n%s\n" "$home" "$conf" | \
	while read -r file ; do
		base="${file#./}"
		link "$(pwd)/$base" "$HOME/$base"
	done
}

# make links unless file already exists
link_dots
