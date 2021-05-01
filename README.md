## .config

# neovim

Install the latest release of neovim by following the instructions [here](https://github.com/neovim/neovim#install-from-source).

Install all plugins as follows:

```
:PackerCompile
:PackerInstall
```

## Language servers

Install ccls and svls via snap as follows:

```
sudo snap install ccls svls
```

# Packages to install

Node.js v12.x

```
curl -fsSL https://deb.nodesource.com/setup_12.x | sudo bash -
sudo apt install -y nodejs
```

Hack Nerd Font

Save the .ttf files for [Hack Nerd fonts](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack) at ```~/.local/share/fonts```. Run ```fc-cache``` after saving the .ttf files.

