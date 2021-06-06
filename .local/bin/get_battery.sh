#!/bin/bash

# get the state - charging, discharging and fully charged
state=$(upower -i `upower -e | grep 'BAT'` | grep "state:" | awk '{print $2}')

# if state is empty then the device is a desktop
[[ state = "" ]] && echo "desktop" && exit 0

# get battery percentage
percentage=$(upower -i `upower -e | grep 'BAT'` | grep "percentage:" | awk '{print $2}')

# if fully charged, echo and exit
[[ $state = "fully-charged"  ]] && echo "Fully Charged: 100%" && exit 0

# if charging print Charging and percentage
[[ $state = "charging" ]] && echo "Charging: $percentage" && exit 0

# if discharging print Discharging and percentage
[[ $state = "discharging" ]] && echo "Discharging: $percentage" && exit 0
