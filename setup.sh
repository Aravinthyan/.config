####################################
# APT
####################################

# install packages from apt
sudo apt update
sudo apt install -y build-essential xorg-dev feh maim xclip x11-apps gdm3 zathura ranger \
    firefox-esr texlive rubber automake gettext libtool libtool-bin autoconf cmake pkg-config \
    unzip htop dunst fonts-hack sxhkd blueman ntfs-3g libnotify-bin ufw

# install element
sudo apt install -y wget apt-transport-https
sudo wget -O /usr/share/keyrings/riot-im-archive-keyring.gpg https://packages.riot.im/debian/riot-im-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/riot-im-archive-keyring.gpg] https://packages.riot.im/debian/ default main" | sudo tee /etc/apt/sources.list.d/riot-im.list
sudo apt update
sudo apt install element-desktop -y

####################################
# COMPILE AND INSTALL FROM SOURCE
####################################

# install packages from git repos
mkdir $2/tmp && cd $2/tmp

# install neovim
git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=Release
sudo make install

cd $2/.config

####################################
# COMPILE AND INSTALL SUBMODULES
####################################

# install submodules within .config
git submodule init
git submodule update --recursive
# install dwm
cd dwm
sudo make clean install
sudo ln -s $2/.config/dwm/dwm.desktop /usr/share/xsessions/dwm.desktop
sudo ln -s $2/.config/dwm/dwm.sh /usr/local/bin/dwm.sh
# install dmenu
cd ../dmenu
sudo make clean install
# install st
cd ../st
sudo make clean install
# install slock
cd ../slock
sudo make clean install
cd $2

####################################
# GET FONTS
####################################

# make directory to save fonts
mkdir -p $2/.local/share/fonts

wget -P /home/$1/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Bold/complete/Hack%20Bold%20Nerd%20Font%20Complete.ttf
wget -P /home/$1/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/BoldItalic/complete/Hack%20Bold%20Italic%20Nerd%20Font%20Complete.ttf
wget -P /home/$1/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Italic/complete/Hack%20Italic%20Nerd%20Font%20Complete.ttf
wget -P /home/$1/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf

####################################

# update sudoers list so that USER does not need to type password for shutdown and reboot
shutdown_cmd=$(whereis shutdown | awk '{print $2}')
reboot_cmd=$(whereis reboot | awk '{print $2}')
echo $1" ALL=NOPASSWD:"$shutdown_cmd","$reboot_cmd | sudo EDITOR='tee -a' visudo

# create default directories
mkdir Desktop Documents Downloads Pictures

# configure firewall
sudo ufw default deny incoming
sudo ufw default allow outgoing

