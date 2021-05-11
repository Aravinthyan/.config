export dmenu_command='dmenu -i -l 10 -nb '#000000' -nf '#ffffff' -sb '#ff8c00' -sf '#ffffff' -bw 3'

main_prompt="1) Run application\n2) Mount partition\n3) Umount partition"

choice=$(echo -e $main_prompt | $dmenu_command -p "Choose option: ")

if [[ $choice = '1) Run application' ]]
then
    dmenu_run
elif [[ $choice = "2) Mount partition" ]]
then
	./mount.sh
elif [[ $choice = "3) Umount partition" ]]
then
    ./unmount.sh
fi

