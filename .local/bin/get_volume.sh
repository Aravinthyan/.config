#!/bin/bash

# get active port
active_port=$(pactl list sinks | grep "Active Port:" | awk '{print $3}')

# set the appropriate name for active_port
[[ $active_port = "analog-output-speaker" ]] && active_port="Speaker"
[[ $active_port = "analog-output-headphones" ]] && active_port="Headphones"

# check if audio is mute or not
mute=$(pactl list sinks | grep "Mute:" | awk '{print $2}')

# if mute, echo and exit
[[ $mute = "yes" ]] && echo "Mute - $active_port" && exit 0

# get volume
volume=$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | \
	tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')

echo "Volume: $volume% - $active_port"
