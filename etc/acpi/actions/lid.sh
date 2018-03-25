#/bin/bash

LAPTOP="eDP-1"
HDMI="HDMI-1"
export DISPLAY=:1
user="hrushi" 		# change this to your username

if [ $3 == close ]; then
	if (su $user -c "xrandr" | grep "$HDMI disconnected" && su $user -c "xrandr" | grep "$LAPTOP connected"); then
		su $user -c "i3lock-multimonitor"	
	elif (su $user -c "xrandr" | grep "$LAPTOP connected" && su $user -c "xrandr" | grep "$HDMI connected"); then
		su $user -c "xrandr --output $HDMI --primary --auto && xrandr --output $LAPTOP --off"
	fi
elif [ $3 == open ]; then
	su $user -c "xrandr --output $LAPTOP --primary --auto && xrandr --output $HDMI --auto --right-of $LAPTOP"
fi

# Launch polybar
su $user -c "~/.dotfiles/.config/polybar/launch_polybar.sh"
