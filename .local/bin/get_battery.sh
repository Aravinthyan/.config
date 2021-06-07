#!/bin/bash

# get if the AC is plugged in or not
plug=$(upower -i `upower -e | grep 'AC'` | grep "online:" | awk '{print $2}')

[[ $plug = "yes" ]] && plug="Plugged In "

[[ $plug = "no" ]] && plug="Not Plugged In "

# get the state - charging, discharging and fully charged
state=$(upower -i `upower -e | grep 'BAT'` | grep "state:" | awk '{print $2}')

# if state is empty then the device is a desktop
[[ state = "" ]] && echo "Desktop" && exit 0

# get battery percentage
percentage=$(upower -i `upower -e | grep 'BAT'` | grep "percentage:" | awk '{print $2}')

# if fully charged, echo and exit
[[ $state = "fully-charged"  ]] && echo "Fully Charged: 100% - $plug" && exit 0

# if charging print Charging and percentage
[[ $state = "charging" ]] && echo "Charging: $percentage - $plug" && exit 0

# if discharging print Discharging and percentage
[[ $state = "discharging" ]] && echo "Discharging: $percentage - $plug" && exit 0
