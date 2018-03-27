#!/bin/bash

# ASCII CODES for foreground colours and text attributes
readonly NONE="$(tput sgr 0)"               # Reset
readonly RED="$(tput setaf 1)"				# Red
readonly PINK="$(tput setaf 1)"				# Pink
readonly GREEN="$(tput setaf 2)"   			# Yellow
readonly YELLOW="$(tput setaf 3)"			# Green
readonly PURPLE="$(tput setaf 5)"			# Magenta
readonly CYAN="$(tput setaf 6)"				# Cyan
readonly LIGHT_CYAN="$(tput setaf 4)"       # Blue 
readonly WHITE="$(tput setaf 7)"			# White
readonly BOLD="$(tput bold)"				# Bold
readonly UNDERLINE="$(tput smul)"			# Underline


fs-mount() {
    lsblk

    echo ""
    echo -n "${BOLD}${CYAN}Enter the Partition to mount (without /dev/):${NONE} "
    read fs

    if [ -z "$fs" ]; then
	echo "${RED}Invalid input.${NONE}"
	exit 0
    elif [ "$(df | grep "$fs")" ]; then
	echo "${BOLD}${RED}/dev/$fs is already mounted${NONE}"
	echo ""
    else
	udisksctl mount -b "/dev/$fs"
	echo "${BOLD}${GREEN}/dev/$fs mounted...${NONE}"
	echo ""
    fi

    lsblk

    read x
}

fs-unmount() {
    lsblk

    echo ""
    echo -n "${BOLD}${CYAN}Enter the partition to unmount (without /dev/):${NONE} "
    read fs

    if [ -z "$fs" ];then
	echo "${RED}Invalid input.${NONE}"
	exit 0
    elif [ "$(df | grep "$fs")" ]; then 
	udisksctl unmount -b "/dev/$fs"
	echo "${BOLD}${GREEN}/dev/$fs unmounted...${NONE}"
	echo ""
    else
	echo "${BOLD}${RED}/dev/$fs is not mounted${NONE}"
	echo ""
    fi

    lsblk

    read x

}


if [ -z "$1" ]; then
    exit 0
elif [ "$1" == 'mount' ]; then
    fs-mount
elif [ "$1" == 'unmount' ]; then
    fs-unmount
else
    echo "Invalid command: Enter to exit"
    read x
    exit 0
fi


