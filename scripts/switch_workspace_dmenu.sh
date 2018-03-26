#!/bin/bash

ws=$(python ~/.dotfiles/scripts/getWorkspaces.py | rofi -dmenu)

if [ ! -z "$ws" ]; then
    i3-msg "workspace $ws"
fi
