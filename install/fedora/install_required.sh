# ----------------------------------------------------- 
# Installation of required packages
# ----------------------------------------------------- 

# Required packages for the installer on Fedora
installer_packages=(
    "wget"
    "unzip"
    "rsync"
    "figlet"
    "git"
)

echo ":: Installing on $distro"
_installPackages "${installer_packages[@]}";

# Install gum
install/fedora/gum.sh
