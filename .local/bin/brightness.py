#!/usr/bin/python3

import os
import argparse

parser = argparse.ArgumentParser()
# add an arguement up_or_down - this indicates wheather to increase or decrease the current brightness value
parser.add_argument('up_or_down')
# parse the arguements
args = parser.parse_args()

try:
    # get current brightness value from file
    with open(os.environ["HOME"] + '/.config/brightness/brightnessrc', 'r') as reader:
        brightness_val = float(reader.read())
except FileNotFoundError as e:
    os.system('mkdir ' + os.environ["HOME"] + '/.config/brightness')
    # if the file does not exist, let the current brightness_val equal to 1.0
    brightness_val = 1.0

# this is the command that needs to be executed to set the brightness at a specific value for a specfic device
command = "xrandr --output `xrandr -q | grep ' connected' | head -n 1 | cut -d ' ' -f1` --brightness "

# calculate the new brightness value
brightness_val = round(brightness_val - 0.01 + (args.up_or_down == '1') * 0.02, 2)

# if the calculated brightness value is less than 0 or more than 1 then do not update
if brightness_val >= 0 and brightness_val <= 1:
    brightness_val = str(brightness_val)
    os.system(command + brightness_val) # run command to update brightness
    with open(os.environ["HOME"] + '/.config/brightness/brightnessrc', 'w') as writer:
        # write the new brightness value to file
        writer.write(brightness_val)
    # send update signal to dwmblocks
    os.system('pkill -RTMIN+10 dwmblocks')
