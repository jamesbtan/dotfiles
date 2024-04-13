#!/bin/sh
#
root=$(dirname "$(realpath "$0")")

curr=$(cat "$root"/control-mode.dat)
curr=$(echo "$curr 1 + 3 % p" | dc)

"$root"/control-run.sh "$curr"
echo "$curr" > "$root"/control-mode.dat
