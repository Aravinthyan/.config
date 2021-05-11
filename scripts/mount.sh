export dmenu_command='dmenu -i -l 10 -nb '#000000' -nf '#ffffff' -sb '#ff8c00' -sf '#ffffff' -bw 3'

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
    choosen_part=$(lsblk -lp | grep "part $" | awk '{print $1, "(" $4 ")"}' | \
        $dmenu_command -p "Choose partition: ")

    [[ $choosen_part = "" ]] && exit 0

    choosen_part=$(echo $choosen_part | awk '{print $1}')

    mount_point=$(echo -e "/mnt/\n/media/" | $dmenu_command -p "Enter mount point: ")

    [[ $mount_point = "" ]] && exit 0

    [[ ! -d $mount_point ]] && st -e sudo mkdir -p $mount_point 2>/dev/null

    password=$(echo "" | $dmenu_command -p "Enter password: ")

    [[ $password = "exit" ]] && exit 0

    keyfile_path=$(echo -e "$HOME/\n/" | $dmenu_command -p "Enter path to keyfiles: ")

    [[ $keyfile_path = "" ]] && exit 0

    protect_hidden=$(echo -e "no\nyes" | $dmenu_command -p "Protect hidden partition: ")

    [[ $protect_hidden = "" ]] && exit 0
    
    pim=$(echo -e "" | $dmenu_command -p "Enter PIM: ")

    [[ $pim = "exit" ]] && exit 0
    
    st -e sudo veracrypt -t $choosen_part $mount_point -p "$password" -k "$keyfile_path" \
        --protect-hidden=$protect_hidden --pim=$pim

    if [[ $? -eq 0 ]]
    then
        notify-send "Mounted $choosen_part at $mount_point"
    else
        notify-send "$choosen_part not mounted at $mount_point"
    fi
fi

