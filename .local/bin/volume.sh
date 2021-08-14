#!/bin/bash

get_line_from_multiline_string() {
	local line=$(sed -n ${active_sink}p <<< $1)
	echo $line
}

# get sink list
sink_info=$(pactl list sinks)

# get active sink
active_sink=$(echo "$sink_info" | grep -P "^\tState:" | grep -n RUNNING | cut -d: -f1)

# get all the sink numbers
sinks=$(echo "$sink_info" | grep -P "^Sink #")

# get sink
sink=$(get_line_from_multiline_string "$sinks")
sink=$(echo "$sink" | cut -d# -f2)

# if passed value is 2 then toggle mute
[[ $1 = "2" ]] && pactl set-sink-mute ${sink} toggle && pkill -RTMIN+9 dwmblocks && exit 0

# if passed value is 0 then decrease volume by 5%
[[ $1 = "0" ]] && pactl set-sink-volume ${sink} -5% && pkill -RTMIN+9 dwmblocks && exit 0

# if passed value is not 0, 1 or 2, exit
[[ $1 != "1" ]] && exit 0

# get volume of active sink
volume=$(get_line_from_multiline_string "`echo "$sink_info" | grep -P "^\tVolume:" | awk '{print $5}' | cut -d% -f1`")

# if current volume is 100, exit
[[ "$volume" == "100" ]] && exit 0

# this means that the passed value is 1 and the current volume is less than 100
pactl set-sink-volume ${sink} +5%
pkill -RTMIN+9 dwmblocks
