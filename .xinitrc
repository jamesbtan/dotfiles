#!/bin/sh
setxkbmap -option ctrl:swapcaps
sxhkd &

xsetroot -solid white
#xcompmgr -c &

while : ; do
	xsetroot -name "$(genstatus)"
	sleep 30
done &

exec dwm
