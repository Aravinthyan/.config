read -sp "Enter Password: " password

echo $password | sudo -kS true

[[ $? != 0 ]] && echo "Incorrect password"; exit 1

####################################
# APT
####################################

# install packages from apt
echo $password | sudo -kS apt update
echo $password | sudo -kS apt install -y build-essential xorg-dev feh maim xclip x11-apps gdm3 \
    zathura ranger firefox-esr texlive rubber automake gettext libtool libtool-bin autoconf cmake \
    pkg-config unzip htop dunst fonts-hack sxhkd blueman ntfs-3g libnotify-bin ufw

# install element
echo $password | sudo -kS apt install -y wget apt-transport-https
echo $password | sudo -kS wget -O /usr/share/keyrings/riot-im-archive-keyring.gpg https://packages.riot.im/debian/riot-im-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/riot-im-archive-keyring.gpg] https://packages.riot.im/debian/ default main" | sudo tee /etc/apt/sources.list.d/riot-im.list
echo $password | sudo -kS apt update
echo $password | sudo -kS apt install element-desktop -y

####################################
# COMPILE AND INSTALL FROM SOURCE
####################################

# install packages from git repos
mkdir $2/tmp && cd $2/tmp

# install neovim
git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=Release
echo $password | sudo -kS make install

cd $2/.config
rm -rf tmp

####################################
# COMPILE AND INSTALL SUBMODULES
####################################

# install submodules within .config
git submodule init
git submodule update --recursive
# install dwm
cd dwm
echo $password | sudo -kS make clean install
echo $password | sudo -kS ln -s $2/.config/dwm/dwm.desktop /usr/share/xsessions/dwm.desktop
echo $password | sudo -kS ln -s $2/.config/dwm/dwm.sh /usr/local/bin/dwm.sh
# install dmenu
cd ../dmenu
echo $password | sudo -kS make clean install
# install st
cd ../st
echo $password | sudo -kS make clean install
# install slock
cd ../slock
echo $password | sudo -kS make clean install
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
echo $1" ALL=NOPASSWD:"$shutdown_cmd","$reboot_cmd | sudo EDITOR='tee -a' visudo

# create default directories
mkdir Desktop Documents Downloads Pictures

# configure firewall
echo $password | sudo -kS ufw default deny incoming
echo $password | sudo -kS ufw default allow outgoing

