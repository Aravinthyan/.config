#!/bin/bash

# $1 - $USER
# $2 - $HOME

####################################
# APT
####################################

# install packages from apt
apt update
apt install -y build-essential xorg-dev feh maim xclip x11-apps gdm3 zathura ranger firefox-esr \
    texlive rubber automake gettext libtool libtool-bin autoconf cmake pkg-config unzip htop dunst \
    fonts-hack sxhkd blueman ntfs-3g libnotify-bin ufw vlc curl nextcloud-desktop mesa-utils libgl1-mesa-glx \
    libgl1-mesa-dri

# install element
apt install -y wget apt-transport-https
wget -O /usr/share/keyrings/riot-im-archive-keyring.gpg https://packages.riot.im/debian/riot-im-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/riot-im-archive-keyring.gpg] https://packages.riot.im/debian/ default main" | tee /etc/apt/sources.list.d/riot-im.list
apt update
apt install element-desktop -y

####################################
# COMPILE AND INSTALL FROM SOURCE
####################################

# install packages from git repos
mkdir $2/tmp && cd $2/tmp

# install neovim
git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=Release
make install

cd $2/
rm -rf tmp

cd $2/.config

####################################
# COMPILE AND INSTALL SUBMODULES
####################################

# install submodules within .config
git submodule init
git submodule update --recursive
# install dwm
cd dwm
git checkout custom
make clean install
ln -s $2/.config/dwm/dwm.desktop /usr/share/xsessions/dwm.desktop
ln -s $2/.config/dwm/dwm.sh /usr/local/bin/dwm.sh
# install dmenu
cd ../dmenu
git checkout custom
make clean install
# install st
cd ../st
git checkout custom
make clean install
# install slock
cd ../slock
git checkout custom
make clean install
# install dwmblocks
cd ../dwmblocks
git checkout custom
make clean install
cd $2

####################################
# GET FONTS
####################################

# make directory to save fonts
mkdir -p $2/.local/share/fonts

wget -P $2/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Bold/complete/Hack%20Bold%20Nerd%20Font%20Complete.ttf
wget -P $2/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/BoldItalic/complete/Hack%20Bold%20Italic%20Nerd%20Font%20Complete.ttf
wget -P $2/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Italic/complete/Hack%20Italic%20Nerd%20Font%20Complete.ttf
wget -P $2/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf

####################################

# update sudoers list so that USER does not need to type password for shutdown and reboot
shutdown_cmd=$(whereis shutdown | awk '{print $2}')
reboot_cmd=$(whereis reboot | awk '{print $2}')
echo $1" ALL=NOPASSWD:"$shutdown_cmd","$reboot_cmd | EDITOR='tee -a' visudo

# create default directories
mkdir Desktop Documents Downloads Pictures

# configure firewall
ufw default deny incoming
ufw default allow outgoing
ufw enable

# ensure USER home directory is owned by USER
chown -R $1:$1 $2
