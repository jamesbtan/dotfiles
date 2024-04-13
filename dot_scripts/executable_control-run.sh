#!/bin/sh

root=$(dirname "$(realpath "$0")")

plover_send_command quit || true
pkill antimicrox

case $1 in
    0)
        setsid antimicrox --profile "$root"/control-pass.amgp &
        ;;
    1)
        setsid antimicrox --profile "$root"/control-mouse.amgp &
        ;;
    2)
        setsid plover &
        ;;
esac
