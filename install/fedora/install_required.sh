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

echo ":: Installing on Fedora"
_installPackages "${installer_packages[@]}";

# Install gum
if [[ $(_isInstalled "gum") == 1 ]]; then

echo '[charm]
name=Charm
baseurl=https://repo.charm.sh/yum/
enabled=1
gpgcheck=1
gpgkey=https://repo.charm.sh/yum/gpg.key' | sudo tee /etc/yum.repos.d/charm.repo
sudo yum install --assumeyes gum

else
    echo "gum is already installed.";
fi
