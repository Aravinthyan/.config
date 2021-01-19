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