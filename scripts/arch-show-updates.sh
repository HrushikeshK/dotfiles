#!/bin/bash

update_val="$(checkupdates)"

if echo $update_val | head -n 1 | grep "ERROR"; then 
    continue 
else 
    echo "$update_val" 
    read x
fi

