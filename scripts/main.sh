export dmenu_command='dmenu -i -l 10 -nb '#000000' -nf '#ffffff' -sb '#ff8c00' -sf '#ffffff' -bw 3'

main_prompt="1) Run application\n2) Mount partition\n3) Umount partition"

choice=$(echo -e $main_prompt | $dmenu_command -p "Choose option: ")

if [[ $choice = '1) Run application' ]]
then
    dmenu_run
elif [[ $choice = "2) Mount partition" ]]
then
    mount_prompt="1) Non-encrypted\n2) Encrypted"

    choice=$(echo -e $mount_prompt | $dmenu_command -p "Choose Non-encrypted or Encrypted: ")

    if [[ $choice = "1) Non-encrypted" ]]
    then
        choosen_part=$(lsblk -lp | grep "part $" | awk '{print $1, "(" $4 ")"}' | \
            $dmenu_command -p "Choose partition: ")
        
        [[ $choosen_part = "" ]] && exit 0
        
        choosen_part=$(echo $choosen_part | awk '{print $1}')

        mount_point=$(echo -e "/mnt/\n/media/" | $dmenu_command -p "Enter mount point: ")
        
        [[ $mount_point = "" ]] && exit 0

        [[ ! -d $mount_point ]] && st -e sudo mkdir -p $mount_point 2>/dev/null
        	
        st -e sudo mount $choosen_part $mount_point 2>/dev/null

        if [[ $? -eq 0 ]]
        then
            notify-send "Mounted $choosen_part at $mount_point"
        else
            notify-send "$choosen_part not mounted at $mount_point"
        fi
    elif [[ $choice = "2) Encrypted" ]]
    then
        echo "2)"
    fi
elif [[ $choice = "3) Umount partition" ]]
then
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
fi

