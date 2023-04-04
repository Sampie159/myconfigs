#!/bin/bash

set -eu -o pipefail

sudo -n true
test $? -eq 0 || exit 1 "You should have sudo privilege to run this script"

echo installing EvErYtHiNg
while read -r p ; do sudo pacman -S --needed --noconfirm $p ; done < <(cat << "EOF")
  github-cli
  zip
  unzip
  wget
  curl
  perl
  npm
  nodejs
  polybar
  i3
  neovim
  nitrogen
  alacritty
EOF
)

echo installing everything
echo you have 5 seconds to quit
echo hit C-c
echo or wait for the installation
sleep 6

mkdir -p ~/.config ~/.config/alacritty ~/.config/nvim ~/.config/hypr \
    ~/.config/polybar ~/.config/i3 ~/.config/i3status ~/.config/waybar/scripts

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

rm ~/.zshrc

ln -s .config/alacritty/alacritty.yml ~/.config/alacritty/
ln -s .config/hypr/hyprland.conf ~/.config/hypr/
ln -s .config/hypr/hyprpaper.conf ~/.config/hypr/
ln -s .config/i3/config ~/.config/i3/
ln -s .config/i3status/config ~/.config/i3status/
ln -s .config/nvim/init.lua ~/.config/nvim/
ln -s .config/polybar/config.ini ~/.config/polybar/
ln -s .config/waybar/style.css ~/.config/waybar/
ln -s .config/waybar/config.jsonc ~/.config/waybar/
ln -s .config/waybar/scripts/waybar-wttr.py ~/.config/waybar/scripts
ln -s .config/picom.conf ~/.config/
ln -s .zshrc ~/
ln -s .zshenv ~/
ln -s .gitconfig ~/
