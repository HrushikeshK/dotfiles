#!/bin/bash

LAPTOP="eDP-1"
HDMI="HDMI-1"

MODE=$1

if [ $# -ne 1 ]; then
    echo "Usage: $0 [laptop, dual, clone]"
    exit 0
fi

if [ $1 == 'laptop' ]; then
    xrandr --output $HDMI --off
    xrandr --output $LAPTOP --primary --auto
elif [ $1 == 'dual' ]; then
    if (xrandr | grep "$LAPTOP connected" && xrandr | grep "$HDMI connected"); then
	xrandr --output $LAPTOP --primary --auto
	xrandr --output $HDMI --auto --right-of $LAPTOP
	# Force work monitor into 1920x1080 mode
	if (xrandr | grep "$HDMI connected 1440x900+1920+0"); then
	    xrandr --output $HDMI --mode 1920x1080
	fi
    else
	echo "No dual monitor detected. Exiting"
	exit 0
    fi
elif [ $1 == 'clone' ]; then
    if (xrandr | grep "$LAPTOP connected" && xrandr | grep "$HDMI connected"); then
	xrandr --output $LAPTOP --auto --output $HDMI --auto --same-as $LAPTOP
    else
	echo "No dual monitor detected. Exiting"
	exit 0
    fi
elif [ $1 == 'hdmi' ]; then
    if (xrandr | grep "$LAPTOP connected" && xrandr | grep "$HDMI connected"); then
	xrandr --output $HDMI --primary --auto
	xrandr --output $LAPTOP --off
    fi
else
    echo 'Invalid Input'
fi
