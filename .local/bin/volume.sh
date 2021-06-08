#!/bin/bash

# if passed value is 2 then toggle mute
[[ $1 = "2" ]] && pactl set-sink-mute 0 toggle && pkill -RTMIN+9 dwmblocks && exit 0

# if passed value is 0 then decrease volume by 5%
[[ $1 = "0" ]] && pactl set-sink-volume 0 -5% && pkill -RTMIN+9 dwmblocks && exit 0

# if passed value is not 0, 1 or 2, exit
[[ $1 != "1" ]] && exit 0

# if current volume is 100, exit
[[ `pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,'` = "100" ]] && exit 0

# this means that the passed value is 1 and the current volume is less than 100
pactl set-sink-volume 0 +5%
pkill -RTMIN+9 dwmblocks
