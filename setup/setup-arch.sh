#!/usr/bin/env bash

# ----------------------------------------------------------
# Packages
# ----------------------------------------------------------

packages=(
    "wget"
    "unzip"
    "git"
    "gum"    
    "hyprland"
    "waybar"
    "rofi-wayland"
    "kitty"
    "dunst"
    "thunar"
    "xdg-desktop-portal-hyprland"
    "qt5-wayland"
    "qt6-wayland"
    "hyprpaper"
    "hyprlock"
    "firefox"
    "ttf-font-awesome"
    "vim"
    "fastfetch"
    "ttf-fira-sans" 
    "ttf-fira-code" 
    "ttf-firacode-nerd"
    "jq"
    "brightnessctl"
    "networkmanager"
    "wireplumber"
    "wlogout"
    "flatpak"
)

# ----------------------------------------------------------
# Colors
# ----------------------------------------------------------

GREEN='\033[0;32m'
NONE='\033[0m'

# ----------------------------------------------------------
# Check if command exists
# ----------------------------------------------------------

_checkCommandExists() {
    cmd="$1"
    if ! command -v "$cmd" >/dev/null; then
        echo 1
        return
    fi
    echo 0
    return
}

# ----------------------------------------------------------
# Check if package is already installed
# ----------------------------------------------------------

_isInstalled() {
    package="$1"
    check="$(sudo pacman -Qs --color always "${package}" | grep "local" | grep "${package} ")"
    if [ -n "${check}" ]; then
        echo 0
        return #true
    fi
    echo 1
    return #false
}

# ----------------------------------------------------------
# Install yay
# ----------------------------------------------------------

_installYay() {
    _installPackages "base-devel"
    SCRIPT=$(realpath "$0")
    temp_path=$(dirname "$SCRIPT")
    git clone https://aur.archlinux.org/yay.git $download_folder/yay
    cd $download_folder/yay
    makepkg -si
    cd $temp_path
    echo ":: yay has been installed successfully."
}

# ----------------------------------------------------------
# Install packages
# ----------------------------------------------------------

_installPackages() {
    toInstall=()
    for pkg; do
        if [[ $(_isInstalled "${pkg}") == 0 ]]; then
            echo ":: ${pkg} is already installed."
            continue
        fi
        echo "Package not installed: ${pkg}"
        yay --noconfirm -S "${pkg}"
    done
}

# ----------------------------------------------------------
# Header
# ----------------------------------------------------------

clear
echo -e "${GREEN}"
cat <<"EOF"
   ____    __          
  / __/__ / /___ _____ 
 _\ \/ -_) __/ // / _ \
/___/\__/\__/\_,_/ .__/
                /_/    
ML4W Hyprland Starter for Arch based distros

EOF
echo -e "${NONE}"

# ----------------------------------------------------------
# Content
# ----------------------------------------------------------

while true; do
    read -p "DO YOU WANT TO START THE PACKAGE INSTALLATION NOW? (Yy/Nn): " yn
    case $yn in
        [Yy]*)
            echo ":: Installation started."
            echo
            break
            ;;
        [Nn]*)
            echo ":: Installation canceled"
            exit
            break
            ;;
        *)
            echo ":: Please answer yes or no."
            ;;
    esac
done

# Install yay if needed
if [[ $(_checkCommandExists "yay") == 0 ]]; then
    echo ":: yay is already installed"
else
    echo ":: The installer requires yay. yay will be installed now"
    _installYay
fi

# Packages
_installPackages "${packages[@]}"

# Flatpaks

# Hyprland Settings App
ml4w_app="com.ml4w.hyprlandsettings"
ml4w_app_repo="hyprland-settings"
echo ":: Installing $ml4w_app"
bash -c "$(curl -s https://raw.githubusercontent.com/mylinuxforwork/$ml4w_app_repo/master/setup.sh)"

# ----------------------------------------------------------
# Completed
# ----------------------------------------------------------

echo ":: Installation complete."
echo ":: Ready to install the dotfiles with the Dotfiles Installer."