#!/usr/bin/env bash

# ----------------------------------------------------------
# Packages
# ----------------------------------------------------------

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source share/packages/opensuse.sh

# ----------------------------------------------------------
# Colors
# ----------------------------------------------------------

GREEN='\033[0;32m'
NONE='\033[0m'

_checkCommandExists() {
    cmd="$1"
    if ! command -v "$cmd" >/dev/null; then
        echo 1
        return
    fi
    echo 0
    return
}

_isInstalled() {
    package="$1"
    package_info=$(zypper se -i "$package" 2>/dev/null | grep "^i" | awk '{print $3}')
    ret=1
    for pkg in $package_info
    do
	if [ "$package" == "$pkg" ]; then
		ret=0
		break
	fi
	done
	echo $ret
}

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
    sudo zypper -n install "${toInstall[@]}"
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
ML4W Hyprland Starter for OpenSuse based distros

EOF
echo -e "${NONE}"
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

# Packages
_installPackages "${packages[@]}"

# Flathub
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

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