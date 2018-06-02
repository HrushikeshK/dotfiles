#!/bin/bash

synclient TouchpadOff=$(synclient -l | grep -c 'TouchpadOff.*=.*0')

if [ "$(synclient -l | grep -c 'TouchpadOff.*=.*0')" == "1" ]; then
    dunstify -u normal "Touchpad Enabled" "Press Mod+Grave to disable"
else
    dunstify -u normal "Touchpad Disabled" "Press Mod+Grave to enable"
fi
