#!/bin/sh

run() {
    if ! pgrep -f $1 ;
    then
        "$@" &
    fi
}

picom --config ~/.config/picom/picom.conf &
mywal -R &
run "nitrogen" --restore -b
run "flameshot"
run "conky"
discord

# run ""
