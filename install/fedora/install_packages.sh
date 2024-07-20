installer_packages=(
    "hyprland"
    "waybar"
    "rofi-wayland"
    "alacritty"
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
    "python3-gobject" 
    "gtk4"
)

# PLEASE NOTE: Add more packages at the end of the following command
_installPackages "${installer_packages[@]}";
