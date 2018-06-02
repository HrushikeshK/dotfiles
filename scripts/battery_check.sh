#!/bin/bash

BATTINFO=`acpi -b`
if [[ `echo $BATTINFO | grep Discharging` && `echo $BATTINFO | cut -d' ' -f4 | cut -d',' -f1 | cut -d'%' -f1` -le 7 ]]; then
    DISPLAY=:1 /usr/bin/dunstify -u critical "Machine Hibernating" "$BATTINFO"
    /usr/bin/i3exit suspend
elif [[ `echo $BATTINFO | grep Discharging` && `echo $BATTINFO | cut -d' ' -f4 | cut -d',' -f1 | cut -d'%' -f1` -le 30 ]] ; then
    DISPLAY=:1 /usr/bin/dunstify -u critical "Low Battery" "$BATTINFO"
fi

echo "Checked at $(date)"
