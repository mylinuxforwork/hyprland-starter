distro=""
if [ -z "$1" ] ;then
    if [ -f /etc/fedora-release ] ;then
        distro="fedora"
    fi
    if [ -f /etc/arch-release ] ;then
        distro="arch"
    fi
else
    if [[ "$1" == "fedora" ]]; then
        distro="fedora"
    fi
    if [[ "$1" == "arch" ]]; then
        distro="arch"
    fi
fi

if [ -z $distro ] ;then
    echo "ERROR: Your Linux distribution is not supported."
    exit
fi

echo "$distro" > dotfiles/.config/ml4w/settings/distro
