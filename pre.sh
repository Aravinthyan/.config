#!/bin/bash

echo ""
echo "##################################################"
echo "Performing updates ..."
echo "##################################################"
echo ""
sudo apt update

echo ""
echo "##################################################"
echo "Installing the following:"
echo "- nodejs"
echo "- npm"
echo "- snapd"
echo "- ripgrep"
echo "- fd-find"
echo "##################################################"
echo ""
sudo apt install nodejs npm snapd ripgrep fd-find

echo ""
echo "##################################################"
echo "Installing ccls via snapd"
echo "##################################################"
echo ""
sudo snap install ccls --classic

echo ""
echo "##################################################"
echo "Python2 pynvim"
echo "##################################################"
echo ""
python2 -m pip install --user --upgrade pynvim

echo ""
echo "##################################################"
echo "Python3 pynvim"
echo "##################################################"
echo ""
python3 -m pip install --user --upgrade pynvim

echo ""
echo "##################################################"
echo "Install from source the following"
echo "- Ranger"
echo "- Hack NERDFonts"
echo "##################################################"
echo ""
