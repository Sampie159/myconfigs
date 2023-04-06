#!/bin/bash

set -eu -o pipefail

sudo cat 

echo installing EvErYtHiNg
while read -r p ; do sudo pacman -S --needed --noconfirm $p ; done < <(cat << "EOF"
  github-cli
  zip
  unzip
  wget
  v4l2loopback
  curl
  perl
  npm
  nodejs
  polybar
  i3
  neovim
  nitrogen
  opendoas
  alacritty
EOF
)

git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si
cd ..
rm -rf yay-git

while read -r p ; do yay -S $p ; done < <(cat << "EOF"
    hyprland-nvidia
    waybar-hyprland
    hyprpaper-git
EOF
)

echo installing everything
echo you have 5 seconds to quit
echo hit C-c
echo or wait for the installation
sleep 6

sudo echo "permit :wheel" /etc/doas.conf

mkdir -p ~/.config ~/.config/alacritty ~/.config/nvim ~/.config/hypr \
    ~/.config/polybar ~/.config/i3 ~/.config/i3status ~/.config/waybar/scripts

sudo mkdir -p /etc/pacman.d/hooks/

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

ln -sf .config/picom.conf ~/.config/
ln -sf .config/nvim/init.lua ~/.config/nvim/
ln -sf .config/alacritty/alacritty.yml ~/.config/alacritty/
ln -sf .config/i3/config ~/.config/i3/
ln -sf .config/i3status/config ~/.config/i3status/
ln -sf .config/polybar/config.ini ~/.config/polybar
ln -sf .config/hypr/hyprland.conf ~/.config/hypr/
ln -sf .config/hypr/hyprpaper.comf ~/.config/hypr/
ln -sf .config/waybar/scripts/waybar-wttr.py ~/.config/waybar/scripts/
ln -sf .config/waybar/config.jsonc ~/.config/waybar/
ln -sf .config/waybar/style.css ~/.config/waybar/
ln -sf .zshrc ~/
ln -sf .zshenv ~/
ln -sf .gitconfig ~/
sudo ln -sf mirrorlist /etc/pacman.d/
sudo ln -sf nvidia.hook /etc/pacman.d/hooks/
sudo ln -sf pacman.conf /etc/
sudo ln -sf makepkg.conf /etc/
sudo modprobe v4l2loopback
