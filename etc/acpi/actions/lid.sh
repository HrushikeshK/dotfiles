#/bin/bash

LAPTOP="eDP-1"
HDMI="HDMI-1"
export DISPLAY=:1

if [ $3 == close ]; then
	if (su hrushi -c "xrandr" | grep "$HDMI disconnected" && su hrushi -c "xrandr" | grep "$LAPTOP connected"); then
		su hrushi -c "i3lock-multimonitor"	
	elif (su hrushi -c "xrandr" | grep "$LAPTOP connected" && su hrushi -c "xrandr" | grep "$HDMI connected"); then
		su hrushi -c "xrandr --output $HDMI --primary --auto && xrandr --output $LAPTOP --off"
	fi
elif [ $3 == open ]; then
	su hrushi -c "xrandr --output $LAPTOP --primary --auto && xrandr --output $HDMI --auto --right-of $LAPTOP"
fi
