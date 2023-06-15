#!/bin/sh

run() {
    if ! pgrep -f $1 ;
    then
        "$@" &
    fi
}

run "picom" -b --config ~/.config/picom.conf
run "nitrogen" --restore -b
run "flameshot" &

# run ""
