#!/bin/bash

export dmenu_command='dmenu -i -l 10 -bw 3'

power_prompt="1) Reboot\n2) Shutdown"

choice=$(echo -e $power_prompt | $dmenu_command -p "Choose option: ")

if [[ $choice = "1) Reboot" ]]
then
    sudo reboot now
elif [[ $choice = "2) Shutdown" ]]
then
    sudo shutdown now
fi
