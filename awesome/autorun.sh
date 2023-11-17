#!/bin/sh

run() {
    if ! pgrep -f $1 ;
    then
        "$@" &
    fi
}

picom --config ~/.config/picom/picom.conf &
mywal -R &
kmonad ~/myconfigs/kmonad/a.kbd &
run "flameshot"
run "conky"
run "discord"

# run ""
