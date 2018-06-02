#!/bin/bash

if (! tmux has-session -t "ranger" 2> /dev/null); then
    tmux new-session -d -s "ranger" -n "ranger"
    tmux send-keys -t "ranger:1" "ranger" C-m
    tmux attach-session -t "ranger:1"
else
    if [ ! "$(ps -elf | grep /usr/bin/ranger | grep python)" ]; then
	tmux send-keys -t "ranger:1" "ranger" C-m
    fi
    tmux attach-session -t "ranger:1"
fi

exit

