#/bin/bash

LAPTOP="eDP-1"
HDMI="HDMI-1"

if [ $# -ne 1 ]; then
    echo "Usage: $0 [laptop, hdmi]"
    exit 0
fi

if [ $1 == 'laptop' ]; then
    xrandr --output $LAPTOP --primary --auto
elif [ $1 == 'hdmi' ]; then
    if (xrandr | grep "$LAPTOP connected" && xrandr | grep "$HDMI connected"); then
	xrandr --output $HDMI --primary --auto
    fi
else
    echo "Invalid Input"
    
fi
