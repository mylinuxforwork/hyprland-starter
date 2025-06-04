#!/usr/bin/env bash

# ----------------------------------------------------------
# Packages
# ----------------------------------------------------------

packages=(
    "wget"
    "unzip"
    "git"
    "hyprland"
    "waybar"
    "rofi-wayland"
    "kitty"
    "dunst"
    "Thunar"
    "xdg-desktop-portal-hyprland"
    "qt5-qtwayland"
    "qt6-qtwayland"
    "hyprpaper"
    "hyprlock"
    "firefox"
    "fontawesome-6-free-fonts"
    "vim"
    "vim-enhanced"
    "python3-pip"
    "fastfetch"
    "mozilla-fira-sans-fonts"
    "fira-code-fonts"
    "wlogout"
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
    check=$(yum list installed | grep $package)
    if [ -z "$check" ]; then
        echo 1
        return #false
    else
        echo 0
        return #true
    fi
}

# ----------------------------------------------------------
# Install packages
# ----------------------------------------------------------

_installPackages() {
    toInstall=()
    for pkg; do
        if [[ $(_isInstalled "${pkg}") == 0 ]]; then
            echo "${pkg} is already installed."
            continue
        fi
        toInstall+=("${pkg}")
    done
    if [[ "${toInstall[@]}" == "" ]]; then
        return
    fi
    printf "Package not installed:\n%s\n" "${toInstall[@]}"
    sudo dnf install --assumeyes "${toInstall[@]}"
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
ML4W Hyprland Starter for Fedora based distros

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

sudo dnf copr enable --assumeyes solopasha/hyprland

# Packages
_installPackages "${packages[@]}"

# Gum
echo '[charm]
name=Charm
baseurl=https://repo.charm.sh/yum/
enabled=1
gpgcheck=1
gpgkey=https://repo.charm.sh/yum/gpg.key' | sudo tee /etc/yum.repos.d/charm.repo
sudo yum install --assumeyes gum

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