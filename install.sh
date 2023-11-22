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
makepkg -si --noconfirm
cd .. && rm -rf yay-git

programs_aur=(
    python-pywalfox
    pywal-16-colors
    hyprland-nvidia-git
    swww
    xdg-desktop-portal-hyprland
    waybar wl-clipboard
    kmonad-bin
    rar
)

for program in "${programs_aur[@]}"; do
    if ! command -v $program &> /dev/null; then
        echo "Installing $program"
        yay -S $program --noconfirm
    fi
done

configs=(
    tmux
    conky
    alacritty
    awesome
    hypr
    waybar
    nvim
    picom
    rofi
)

for config in "${configs[@]}"; do
    if [ ! -d ~/.config/"${config}" ]; then
        ln -sf ~/myconfigs/"${config}" ~/.config/
    fi
done

home_configs=(
    .gitconfig
    Wallpapers
)

for home_config in "${home_configs[@]}"; do
    if [ ! -d ~/"${home_config}" ]; then
        ln -sf ~/myconfigs/"${home_config}" ~/
    fi
done

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
ln -sf ~/myconfigs/.zshrc ~/.zshrc
ln -sf ~/myconfigs/.p10k.zsh ~/.p10k.zsh
ln -sf ~/myconfigs/.zshenv ~/.zshenv
ln -sf ~/myconfigs/discord-flags.conf ~/.config/discord-flags.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -sf ~/myconfigs/bin/* ~/.local/bin/
ln -sf ~/myconfigs/templates/* ~/.config/wal/templates
