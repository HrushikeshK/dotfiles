#!/bin/bash

# You can call this script like this:
# $./volume.sh up
# $./volume.sh down
# $./volume.sh mute

function get_volume {
    amixer get Master | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1
}

function is_mute {
    amixer get Master | grep '%' | grep -oE '[^ ]+$' | grep off > /dev/null
}

function send_notification {
    volume=`get_volume`
    # Make the bar with the special character ─ (it's not dash -)
    # https://en.wikipedia.org/wiki/Box-drawing_character
    bar=$(seq -s "━" $(($volume / 5)) | sed 's/[0-9]//g')
    # Send the notification
    if [ $(amixer -c 0 cget numid=2,iface=CARD | awk -F"=" 'NR == 3 {print $2;}' | cut -d',' -f1) == 'on' ]; then
      dunstify -t 800 -r 2593 -u low " $(get_volume)  $bar"
    elif [ $(get_volume) == '0' ]; then
      dunstify -t 800 -r 2593 -u low " $(get_volume)  $bar"
    else
      dunstify -t 800 -r 2593 -u low " $(get_volume)  $bar"
    fi
}

case $1 in
    up)
	# Set the volume on (if it was muted)
	amixer -D pulse set Master on > /dev/null
	# Up the volume (+ 5%)
	amixer -D pulse sset Master 5%+ > /dev/null
	send_notification
	;;
    down)
	amixer -D pulse set Master on > /dev/null
	amixer -D pulse sset Master 5%- > /dev/null
	send_notification
	;;
    mute)
    	# Toggle mute
	amixer -D pulse set Master 1+ toggle > /dev/null
	if is_mute ; then
	    dunstify -t 800 -r 2593 -u low " Mute"
	else
	    send_notification
	fi
	;;
esac


if [ $(amixer -c 0 cget numid=2,iface=CARD | awk -F"=" 'NR == 3 {print $2;}' | cut -d',' -f1) == 'on' ]; then
  echo -n " "
else
    if is_mute ; then
      echo -n " MUTE"
      exit
    elif [ $(get_volume) == "0" ]; then 
      echo -n " "
  else
    echo -n " "
  fi
fi

echo "$(get_volume)%"
