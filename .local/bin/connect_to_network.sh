#!/bin/bash

mkdir ~/.config/connect_to_network 2>/dev/null
touch ~/.config/connect_to_network/current_status

while true
do
    check_connection=$(curl --connect-timeout 1 -I www.google.com | grep "200 OK")
    
    if [[ $check_connection != *"200 OK"* ]]
    then
        echo "Network: Disconnected" > ~/.config/connect_to_network/current_status
    else
        echo "Network: Connected" > ~/.config/connect_to_network/current_status
    fi

    pkill -RTMIN+8 dwmblocks

    sleep 10
done
