#!/bin/bash

export dmenu_command='dmenu -i -l 10 -bw 3'

choosen_part=$(lsblk -lp | grep "part /" | awk '{print $1, "(" $4 ")"}' | $dmenu_command -p "Choose partition: ")

[[ $choosen_part = "" ]] && exit 0

choosen_part=$(echo $choosen_part | awk '{print $1}')

st -e sudo umount $choosen_part 2>/dev/null

if [[ $? -eq 0 ]]
then
    notify-send "Unmounted $choosen_part"
else
    notify-send "$choosen_part not unmounted"
fi
