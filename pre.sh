#!/bin/bash

echo ""
echo "##################################################"
echo "Checking for updates ..."
echo "##################################################"
echo ""
sudo apt update

echo ""
echo "##################################################"
echo "Installing nodejs and npm"
echo "##################################################\n"
echo ""
sudo apt install nodejs npm

echo ""
echo "##################################################"
echo "Installing snapd"
echo "##################################################\n"
echo ""
sudo apt install snapd

echo ""
echo "##################################################"
echo "Installing ccls"
echo "##################################################\n"
echo ""
sudo snap install ccls --classic

echo ""
echo "##################################################"
echo "Python2 pynvim"
echo "##################################################\n"
echo ""
python2 -m pip install --user --upgrade pynvim

echo ""
echo "##################################################"
echo "Python3 pynvim"
echo "##################################################\n"
echo ""
python3 -m pip install --user --upgrade pynvim

echo ""
echo "##################################################"
echo "Install fonts for the arrows and stuff for airline "
echo "##################################################\n"
echo ""
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

