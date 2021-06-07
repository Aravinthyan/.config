#!/bin/bash

check_connection=$(curl --connect-timeout 1 -I www.google.com | grep "200 OK")

if [[ $check_connection != *"200 OK"* ]]
then
    notify-send "Network: Disconnected"
else
    notify-send "Network: Connected"
fi
