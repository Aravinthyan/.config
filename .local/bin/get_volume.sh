#!/bin/bash

get_line_from_multiline_string() {
	local line=$(sed -n ${active_sink}p <<< $1)
	echo $line
}

# get sink list
sink_info=$(pactl list sinks)

# get active sink
active_sink=$(echo "$sink_info" | grep -P "^\tState:" | grep -n RUNNING | cut -d: -f1)

# get device description
device_description=$(get_line_from_multiline_string "`echo "$sink_info" | grep -P "^\t\tdevice.description"`")
device_description=$(grep -oP '"\K.*?(?=")' <<< "$device_description") # strip to get the device only without the field

# get mute info from all the sinks
mute_info=$(echo "$sink_info" | grep -P "^\tMute:")

# get mute for specific sink
mute=$(get_line_from_multiline_string "$mute_info")
mute=$(echo "$mute" | awk '{print $2}')

# if mute, echo and exit
[[ $mute = "yes" ]] && echo "Mute - $device_description" && exit 0

# get volume of active sink
volume=$(get_line_from_multiline_string "`echo "$sink_info" | grep -P "^\tVolume:" | awk '{print $5}'`")

echo "Volume: $volume - $device_description"
