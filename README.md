# .config

## neovim

Install the latest release of neovim by following the instructions [here](https://github.com/neovim/neovim#install-from-source).

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

Save the [Hack Nerd font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack) (.ttf files) at ```~/.local/share/fonts```. Run ```fc-cache``` after saving the .ttf files.

**San Francisco Font**

Save the [SFProDisplay font](https://github.com/blaisck/sfwin) (.ttf files)  at ```~/.local/share/fonts```. Run ```fc-cache``` after saving the .ttf files.

