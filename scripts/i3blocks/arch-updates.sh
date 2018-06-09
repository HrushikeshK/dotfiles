#!/bin/bash

update_val="$(checkupdates 2> /dev/null)"

UPDATES=$(echo "$update_val" | wc -l)	

if [ ! $UPDATES == '1' ]; then
	echo " ${UPDATES}"
fi

exit 0
