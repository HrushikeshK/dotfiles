#!/bin/bash

op=$1

function get_brightness() {
	printf "%.0f\n" "$(light -G)"
}

function send_notification {
	brightness=`get_brightness`
	# Make the bar with the special character ─ (it's not dash -)
	# https://en.wikipedia.org/wiki/Box-drawing_character
	bar=$(seq -s "━" $(($brightness / 5)) | sed 's/[0-9]//g')
	# Send the notification
	dunstify -t 800 -r 2593 -u low " $(get_brightness)  $bar"
}

case $op in
	# scroll up
	up) 
	light -A 5 
	send_notification
	;;

	# Scroll down
	# Decrease Brightness
	down) 
	if [ ! $(( $(get_brightness) - 5 )) -le 0 ]; then
		light -U 5
	fi
	send_notification
	;;
esac

get_brightness
