# USER

## Installation

```
sudo apt install git
cd ~
git clone https://github.com/Aravinthyan/USER.git .
rm -rf .*
./setup.sh $USER $HOME
```

## neovim

Install all plugins as follows:

```
:PackerCompile
:PackerInstall
```

### Language servers

Install ccls and svls via snap as follows:

```
sudo snap install ccls svls
```

## To install

**Node.js v12.x**

```
curl -fsSL https://deb.nodesource.com/setup_12.x | sudo bash -
sudo apt install -y nodejs
```

**Hack Nerd Font**

Save the [Hack Nerd font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack) (.ttf files) at ```~/.local/share/fonts```. Run ```fc-cache -f -v``` after saving the .ttf files.

**San Francisco Font**

Save the [SFProDisplay font](https://github.com/blaisck/sfwin) (.ttf files)  at ```~/.local/share/fonts```. Run ```fc-cache -f -v``` after saving the .ttf files.

## Application and package

| Application | Package  |
| ----------- | -------- |
| editor      | neovim   |
| terminal    | st       |
| word        | wps      |
| powerpoint  | wps      |
| excel       | wps      |
| PDF reader  | zathura  |
| image viewer | feh     |
| file manager | ranger  |
| latex compiler | texlive-full |
| automated LaTex build system | rubber |
