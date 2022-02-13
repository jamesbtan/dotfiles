#!/bin/sh
setxkbmap -option ctrl:swapcaps &
sxhkd &

hsetroot -solid "#21222c"
xcompmgr -c &

exec sowm
