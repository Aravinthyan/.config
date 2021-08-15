# USER

## Installation

**Note: The commands below are to be only executed on a new installation of debian or if you are sure that you are happy with deleting everything in your home directory.**

```
sudo apt install git
cd ~
rm -rf * .* 2>/dev/null
git clone https://github.com/Aravinthyan/USER.git .
sudo ~/.local/bin/setup.sh $USER $HOME
```

Upon completing the above commands ensure to save the desired wallpaper at ```~/Pictures``` as ```wallpaper.jpg```. The path or name of the file can be changed by editing the following file, ```~/.config/dwm/dwm.sh```.

## Program type and Application

**Installed via script**

| Program type | Application  |
| ----------- | -------- |
| Editor      | neovim   |
| Terminal    | st       |
| PDF reader  | zathura  |
| Image viewer | feh     |
| File manager | ranger  |
| LaTex compiler | texlive-full |
| Automated LaTex build system | rubber |
| Video player | vlc |


**Not installed via script**

| Program type | Application  |
| ----------- | -------- |
| Music player | museeks |
| Word        | WPS Office |
| Powerpoint  | WPS Office |
| Excel       | WPS Office |
| Disk Encryption | VeraCrypt |
