#!/usr/bin/env bash
set -euo pipefail

cd ~

packages=(
  ttf-jetbrains-mono-nerd
  wl-clipboard
  nodejs
  npm
  tailscale
  tmux
  fzf
  fd
  lazygit
  yazi
  ripgrep
  waybar
  neovim
  fastfetch
  zsh-syntax-highlighting
  zsh-autosuggestions
)

read -p "Set zsh as default? (y/n): " answer
if [[ "$answer" == "y" ]]; then
  chsh -s "$(which zsh)"
fi

for package in "${packages[@]}"; do
  read -p "Install $package? (y/n): " answer
  if [[ "$answer" == "y" ]]; then
    sudo pacman -S --needed "$package"
  fi
done

read -p "Would you like to install yay? (y/n): " answer
if [[ "$answer" == "y" ]]; then
  if [[ ! -d "$HOME/yay" ]]; then
    git clone https://aur.archlinux.org/yay.git ~/yay
  fi
  cd ~/yay
  makepkg -si --noconfirm
  cd ~

  read -p "Install Zen Browser? (y/n): " answer
  if [[ "$answer" == "y" ]]; then
    yay -S --needed zen-browser-bin
  fi
fi

read -p "Install keyd? (y/n): " answer
if [[ "$answer" == "y" ]]; then
  if [[ ! -d "$HOME/keyd" ]]; then
    git clone https://github.com/rvaiya/keyd
  fi
  cd keyd
  make
  sudo make install
  sudo systemctl enable --now keyd

  sudo tee /etc/keyd/default.conf >/dev/null <<'EOF'
[ids]
*
[main]
capslock = overload(control, esc)
EOF

  sudo keyd reload
  cd ~
fi

read -p "Softlink configs? (y/n): " answer
if [[ "$answer" == "y" ]]; then
  mkdir -p ~/.config

  read -p "Link hypr? (y/n): " answer
  if [[ "$answer" == "y" ]]; then
    rm -rf ~/.config/hypr
    ln -s ~/dotfiles/.config/hypr ~/.config/hypr
  fi

  read -p "Link wofi? (y/n): " answer
  if [[ "$answer" == "y" ]]; then
    rm -rf ~/.config/wofi
    ln -s ~/dotfiles/.config/wofi ~/.config/wofi
  fi

  read -p "Link waybar? (y/n): " answer
  if [[ "$answer" == "y" ]]; then
    rm -rf ~/.config/waybar
    ln -s ~/dotfiles/.config/waybar ~/.config/waybar
  fi

  read -p "Link nvim? (y/n): " answer
  if [[ "$answer" == "y" ]]; then
    rm -rf ~/.config/nvim
    ln -s ~/dotfiles/.config/nvim ~/.config/nvim
  fi

  read -p "Link zshrc? (y/n): " answer
  if [[ "$answer" == "y" ]]; then
    rm -f ~/.zshrc
    ln -s ~/dotfiles/.zshrc ~/.zshrc
  fi
fi

echo "Add apple_dcp.show_notch=1 to GRUB_CMDLINE_LINUX_DEFAULT in /etc/default/grub then sudo update-grub to fix the nothch on asahi"
echo "✅ Install complete"
