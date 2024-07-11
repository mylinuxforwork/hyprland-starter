#!/bin/bash

# ----------------------------------------------------- 
# Functions
# ----------------------------------------------------- 

# Detect Linux Distribution
_detectDistro() {
    if [ -f /etc/fedora-release ] ;then
        echo "fedora"
    fi
    if [ -f /etc/arch-release ] ;then
        echo "arch"
    fi
}

# Check if package is installed
_isInstalledPacman() {
    package="$1";
    check="$(sudo pacman -Qs --color always "${package}" | grep "local" | grep "${package} ")";
    if [ -n "${check}" ] ; then
        echo 0; #'0' means 'true' in Bash
        return; #true
    fi;
    echo 1; #'1' means 'false' in Bash
    return; #false
}

# Install required packages
_installPackagesPacman() {
    toInstall=();
    for pkg; do
        if [[ $(_isInstalledPacman "${pkg}") == 0 ]]; then
            echo "${pkg} is already installed.";
            continue;
        fi;
        toInstall+=("${pkg}");
    done;
    if [[ "${toInstall[@]}" == "" ]] ; then
        # echo "All pacman packages are already installed.";
        return;
    fi;
    printf "Package not installed:\n%s\n" "${toInstall[@]}";
    sudo pacman --noconfirm -S "${toInstall[@]}";
}


# Check if package is installed
_isInstalledFedora() {
    package="$1";
    check=$(yum list installed | grep $package)
    if [ -z "$check" ]; then
        echo 1; #'1' means 'false' in Bash
        return; #false
    else
        echo 0; #'0' means 'true' in Bash
        return; #true
    fi
}

# Install required packages
_installPackagesFedora() {
    toInstall=();
    for pkg; do
        if [[ $(_isInstalledFedora "${pkg}") == 0 ]]; then
            echo "${pkg} is already installed.";
            continue;
        fi;
        toInstall+=("${pkg}");
    done;
    if [[ "${toInstall[@]}" == "" ]] ; then
        # echo "All pacman packages are already installed.";
        return;
    fi;
    printf "Package not installed:\n%s\n" "${toInstall[@]}";
    sudo dnf install --assumeyes "${toInstall[@]}"
}

# ----------------------------------------------------- 
# Packages
# ----------------------------------------------------- 

# Required packages for the installer on Arch
installer_packages_arch=(
    "figlet"
    "git"
)

# Required packages for the installer on Fedora
installer_packages_fedora=(
    "figlet"
    "git"
)

clear

# Some colors
GREEN='\033[0;32m'
NONE='\033[0m'

# Header
echo -e "${GREEN}"
cat <<"EOF"
 ____       _               
/ ___|  ___| |_ _   _ _ __  
\___ \ / _ \ __| | | | '_ \ 
 ___) |  __/ |_| |_| | |_) |
|____/ \___|\__|\__,_| .__/ 
                     |_|    

EOF
echo "for ML4W Hyprland Starter"
echo
echo -e "${NONE}"

echo "This script will download the ML4W Hyprland Starter and start the installation."
echo
while true; do
    read -p "DO YOU WANT TO START THE INSTALLATION NOW? (Yy/Nn): " yn
    case $yn in
        [Yy]* )
            echo "Installation started."
            echo
        break;;
        [Nn]* ) 
            echo "Installation canceled."
            exit;
        break;;
        * ) echo "Please answer yes or no.";;
    esac
done

# ----------------------------------------------------- 
# Installation for Fedora
# ----------------------------------------------------- 
if [ $(_detectDistro) == "fedora" ] ;then
    echo ":: Installing on Fedora"
    _installPackagesFedora "${installer_packages_fedora[@]}";
fi

# ----------------------------------------------------- 
# Installation for Arch
# ----------------------------------------------------- 
if [ $(_detectDistro) == "arch" ] ;then
    echo ":: Installing on Arch"
    _installPackagesPacman "${installer_packages_arch[@]}";
fi

if [ ! -d ~/Downloads ] ;then
    mkdir ~/Downloads
    echo ":: Downloads folder created"
fi

# Change into Downloads directory
cd ~/Downloads

# Remove existing folder
if [ -d ~/Downloads/hyprland-starter ] ;then
    rm -rf ~/Downloads/hyprland-starter
    echo ":: Existing installation folder removed"
fi

# Clone the packages
git clone --depth 1 https://gitlab.com/stephan-raabe/hyprland-starter.git
echo ":: Installation files cloned into Downloads folder"

# Change into the folder
cd hyprland-starter

# Start the script
# ./install.sh
