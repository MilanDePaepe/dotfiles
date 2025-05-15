# Dotfiles

## Dependencies

### stow

```zsh
brew install stow
```


## Intallation

### Copy dotfiles

Clone this repo

```git
git clone git@github.com:MilanDP123/dotfiles.git ~/dotfiles
```

### set up dotfiles

Go to the dotfiles dir and create the symlinks.
Make shure there are no clonflicting files/dirs in the root dir
by renaming or deleting the origonal files.

```zsh
cd dotfiles
stow .
```

### keyd
```zsh
git clone https://github.com/rvaiya/keyd
cd keyd
make && sudo make install
sudo systemcli enable --now keyd
```
place config in /etc/keyd/default.conf
```zsh
sudo keyd reload
```

### hyprland
Install hyprland,
requirements: hyprlock hypridle wofi ghostty waybar

### nvim
Build from source
```zsh
 sudo dnf install ninja-build gettext cmake unzip curl
 git clone https://github.com/neovim/neovim.git
 cd neovim
 make CMAKE_BUILD_TYPE=Release
 sudo make install
```


## link to youtube tutorial
[youtube](https://www.youtube.com/watch?v=y6XCebnB9gs&list=WL&index=1)
