# ----------------------------------------------------- 
# Installation of required packages
# ----------------------------------------------------- 

installer_packages=(
    "wget"
    "unzip"
    "gum"
    "rsync"
    "figlet"
    "git"
)

echo ":: Installing on $distro"

# Synchronizing package databases
sudo pacman -Sy
echo

# Install required packages
echo ":: Checking that required packages are installed..."
_installPackages "${installer_packages[@]}";

# Double check rsync
if ! command -v rsync &> /dev/null; then
    echo ":: Force rsync installation"
    sudo pacman -S rsync --noconfirm
else
    echo ":: rsync double checked"
fi
echo

# Install Yay
_installYay
