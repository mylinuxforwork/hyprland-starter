echo -e "${GREEN}"
if [ -d ~/.config/ml4w ] ;then
    figlet "Update"
else
    figlet "Installation"
fi
echo -e "${NONE}"
echo "This script will install the ML4W Hyprland Starter configuration."
echo "NVIDIA GPUs aren't officially supported by Hyprland. But you can give it a try..."
echo
if gum confirm "DO YOU WANT TO START NOW?" ;then
    echo
    echo ":: Installing Hyprland and required packages"
    echo
elif [ $? -eq 130 ]; then
    echo ":: Installation canceled"
    exit 130
else
    echo
    echo ":: Installation canceled"
    exit;
fi
