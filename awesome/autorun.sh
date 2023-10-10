#!/bin/sh

run() {
    if ! pgrep -f $1 ;
    then
        "$@" &
    fi
}

run "nitrogen" --restore -b
run "flameshot" &
run "discord"
run "conky" &

# run ""
