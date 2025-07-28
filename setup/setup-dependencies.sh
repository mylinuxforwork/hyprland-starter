#!/usr/bin/env bash

# ----------------------------------------------------------
# Colors
# ----------------------------------------------------------

GREEN='\033[0;32m'
NONE='\033[0m'

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
ML4W Hyprland Starter for Arch based distros

EOF
echo -e "${NONE}"

echo "Your distribution isn't directly supported by this setup script."
echo
echo "But you can install the dependencies manually and continue the installation with the Dotfiles Installer."
echo 
echo "You can find the list of dependencies here:"
echo "https://github.com/mylinuxforwork/hyprland-starter?tab=readme-ov-file#dependencies"
