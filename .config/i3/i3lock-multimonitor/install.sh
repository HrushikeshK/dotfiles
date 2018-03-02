#!/bin/bash

PATH="$HOME/.dotfiles/.config/i3/i3lock-multimonitor"

sudo ln -s "$PATH/lock" /usr/bin/i3lock-multimonitor

echo "Created symlink: /usr/bin/i3lock-multimonitor"
