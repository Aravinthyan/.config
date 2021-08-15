#!/bin/bash

dmenu_command='dmenu -i -l 10 -bw 3'

get_line_from_multiline_string() {
	local line=$(sed -n ${audio_output_index}p <<< $1)
	echo $line
}

# get sink list
sink_info=$(pactl list sinks)

# get device description
device_description=$(echo "$sink_info" | grep -P "^\t\tdevice.description")
device_description=$(grep -oP '"\K.*?(?=")' <<< "$device_description") # strip to get the device only without the field

audio_output=$(echo "$device_description" | $dmenu_command -p "Choose audio output: ")

[[ $audio_output = "" ]] && exit 0

audio_output_index=$(echo "$device_description" | grep -nP "$audio_output" | cut -d: -f1)

# get correct sink number
sink=$(get_line_from_multiline_string "`echo "$sink_info" | grep -P "^Sink #" | cut -d# -f2`")

pactl set-default-sink ${sink}
