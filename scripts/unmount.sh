export dmenu_command='dmenu -i -l 10 -nb '#000000' -nf '#ffffff' -sb '#ff8c00' -sf '#ffffff' -bw 3'

umount_prompt="1) Non-encrypted\n2) Encrypted"

choice=$(echo -e $umount_prompt | $dmenu_command -p "Choose Non-encrypted or Encrypted: ")

if [[ $choice = "1) Non-encrypted" ]]
then
    choosen_part=$(lsblk -lp | grep "part /" | awk '{print $1, "(" $4 ")"}' | \
        $dmenu_command -p "Choose partition: ")

    if [[ $choosen_part != "" ]]
    then
        choosen_part=$(echo $choosen_part | awk '{print $1}')

        st -e sudo umount $choosen_part 2>/dev/null

        if [[ $? -eq 0 ]]
        then
            notify-send "Unmounted $choosen_part"
        else
            notify-send "$choosen_part not unmounted"
        fi
    fi
elif [[ $choice = "2) Encrypted" ]]
then
    echo "2)"
fi

