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

ln -sf ~/myconfigs/picom.conf ~/.config/
ln -sf ~/myconfigs/init.lua ~/.config/nvim/
ln -sf ~/myconfigs/alacritty.yml ~/.config/alacritty/
ln -sf ~/myconfigs/configi3 ~/.config/i3/config
ln -sf ~/myconfigs/configi3status ~/.config/i3status/config
ln -sf ~/myconfigs/config.ini ~/.config/polybar
ln -sf ~/myconfigs/hyprland.conf ~/.config/hypr/
ln -sf ~/myconfigs/hyprpaper.comf ~/.config/hypr/
ln -sf ~/myconfigs/waybar-wttr.py ~/.config/waybar/scripts/
ln -sf ~/myconfigs/config.jsonc ~/.config/waybar/
ln -sf ~/myconfigs/style.css ~/.config/waybar/
ln -sf ~/myconfigs/.zshrc ~/
ln -sf ~/myconfigs/.zshenv ~/
ln -sf ~/myconfigs/.gitconfig ~/
sudo ln -sf ~/myconfigs/mirrorlist /etc/pacman.d/
sudo ln -sf ~/myconfigs/nvidia.hook /etc/pacman.d/hooks/
sudo ln -sf ~/myconfigs/pacman.conf /etc/
sudo ln -sf ~/myconfigs/makepkg.conf /etc/
sudo modprobe v4l2loopback
