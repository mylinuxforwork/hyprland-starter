distro=""
installer=""

# Check for distro
if [ -z "$1" ] ;then
    if [ -f /etc/fedora-release ] ;then
        distro="fedora"
        installer="fedora"
    fi
    if [ -f /etc/arch-release ] ;then
        distro="arch"
        installer="arch"
    fi
    if [ -f /etc/nobara-release ] ;then
        distro="nobara"
        installer="fedora"
    fi
else
    if [[ "$1" == "nobara" ]]; then
        distro="nobara"
        installer="fedora"
    fi
    if [[ "$1" == "fedora" ]]; then
        distro="fedora"
        installer="fedora"
    fi
    if [[ "$1" == "arch" ]]; then
        distro="arch"
        installer="arch"
    fi
fi

# Select installer manually
if [ -z $distro ] ;then
    echo "ERROR: Your Linux distribution could not be detected or is not supported."
    echo
    echo "Please select one of the following installation profiles or cancel the installation."
    echo
    version=$(gum choose "arch" "fedora" "cancel")
    if [ "$version" == "arch" ] ;then
        echo ":: Installer for Arch"
        distro="arch"
        installer="arch"
    elif [ "$version" == "rolling-release" ] ;then
        echo ":: Installer for Fedora"
        distro="fedora"
        installer="fedora"    
    elif [ "$version" == "cancel" ] ;then
        echo ":: Setup canceled"
        exit 130    
    else
        echo ":: Setup canceled"
        exit 130
    fi
fi

echo "$distro" > dotfiles/.config/ml4w/settings/distro
