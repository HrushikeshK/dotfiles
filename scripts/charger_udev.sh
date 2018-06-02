#!/bin/bash

if [[ $1 == 'true' ]]; then
    su hrushi -c 'DISPLAY=:1 /usr/bin/dunstify -u normal "Power Plugged"'
    if [ -f /tmp/btns ]; then
	light -S "$(cat /tmp/btns)"
    else
	light -S 15
    fi
else
    echo "$(light -G)" > /tmp/btns
    su hrushi -c 'DISPLAY=:1 /usr/bin/dunstify -u normal "Power Unplugged"'
    light -S 5
fi
