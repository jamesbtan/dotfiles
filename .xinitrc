#!/bin/sh
setxkbmap -option ctrl:swapcaps &
sxhkd &
xrdb -merge "$HOME"/.Xresources &
xsetroot -cursor_name "left_ptr" &
rta
# xwallpaper --zoom "$HOME/Pictures/wallpaper/chomusuke.png"
xsetroot -solid black

while : ; do
	xsetroot -name "$(genstatus)"
	sleep 30
done &

exec dwm
