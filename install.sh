#!/usr/bin/env bash

programs=(tmux
    screenkey
    flameshot
    redshift
    pipewire
    pipewire-alse
    pipewire-jack
    pipewire-pulse
    alsa-firmware
    alacritty
    awesome
    git
    python-pywal
    linux-headers
    picom
    firefox
    steam
    lutris
    mpv
    discord
    dmenu
    rofi
)

for program in "${programs[@]}"; do
    if ! command -v $program &> /dev/null; then
        echo "Installing $program"
        sudo pacman -S $program --noconfirm
    fi
done

directories=(.config .local/bin)

for dir in "${directories[@]}"; do
    if [ ! -d "${dir}" ]; then
	mkdir ~/"${dir}"
    fi
done

if [ ! -d ~/.config ]; then
    mkdir ~/.config
fi

if [ ! -d ~/.local/bin ]; then
    mkdir ~/.local/bin
fi

git clone https://aur.archlinux.org/yay-git.git && cd yay-git
makepkg -si
cd .. && rm -rf yay-git

programs_aur=(python-pywalfox)

for program in "${programs_aur[@]}"; do
    if ! command -v $program &> /dev/null; then
        echo "Installing $program"
        yay -S $program --noconfirm
    fi
done

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
ln -sf ~/myconfigs/.zshrc ~/.zshrc
ln -sf ~/myconfigs/.p10k.zsh ~/.p10k.zsh
ln -sf ~/myconfigs/.zshenv ~/.zshenv
ln -sf ~/myconfigs/tmux ~/.config/
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -sf ~/myconfigs/conky ~/.config/
ln -sf ~/myconfigs/.gitconfig ~/
ln -sf ~/myconfigs/alacritty ~/.config/
ln -sf ~/myconfigs/awesome ~/.config/
ln -sf ~/myconfigs/hypr ~/.config/
ln -sf ~/myconfigs/waybar ~/.config/
ln -sf ~/myconfigs/nvim ~/.config/
ln -sf ~/myconfigs/picom ~/.config/
ln -sf ~/myconfigs/bin/* ~/.local/bin/
ln -sf ~/myconfigs/rofi ~/.config/
ln -sf ~/myconfigs/templates/* ~/.config/wal/templates
ln -sf ~/myconfigs/Wallpapers ~/
sudo echo "options nvidia-drm modeset=1" >> /etc/modprobe.d/nvidia.conf
