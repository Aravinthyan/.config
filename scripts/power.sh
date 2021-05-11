export dmenu_command='dmenu -i -l 10 -nb '#000000' -nf '#ffffff' -sb '#ff8c00' -sf '#ffffff' -bw 3'

power_prompt="1) Reboot\n2) Shutdown"

choice=$(echo -e $power_prompt | $dmenu_command -p "Choose option: ")

if [[ $choice = "1) Reboot" ]]
then
    st -e sudo reboot now
elif [[ $choice = "2) Shutdown" ]]
then
    st -e sudo shutdown now
fi
