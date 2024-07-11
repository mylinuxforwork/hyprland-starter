# ML4W Hyprland Starter 1.0 

To make your start with Hyprland easy, you can find here a basic installation and configuration script.
The default configuration files are already available in the corresponding folder.
The ML4W Hyprland Starter package is the perfect starting point for your Hyprland customization experiments.

## Requirements

Ths script supports the following distributions:
* Arch Linux
* Fedora Linux
* more to come

Hyprland does not officially support NVIDIA hardware. But many users have reported a successful installation. Please read: https://wiki.hyprland.org/Nvidia/

## Installation

You can install the Hyprland Starter on real hardware (bare metal) or test it first in a Virtual Machine based on QEMU/KVM with activated 3D acceleration.

Just copy/enter the following command into your terminal.

```
bash <(curl -s https://github.com/mylinuxforwork/hyprland-starter/-/raw/main/setup.sh)
```

Or you clone the repository and start the installation with these commands:

```
# git is required
sudo pacman -S git

# Change into your Downloads directory
cd ~/Downloads

# Clone the packages
git clone --depth 1 https://gitlab.com/stephan-raabe/hyprland-starter.git

# You can also download the files and unzip it into your home folder

# Change into the folder
cd hyprland-starter

# Start the script
./install.sh
```

## Packages

The script will install the following packages:

- Window Manager: hyprland 
- Status Bar: waybar 
- Launcher: rofi-wayland 
- Browser: Firefox
- Terminal: alacritty 
- Notification Service: dunst 
- File Manager: Thunar
- xdg-desktop-portal-hyprland 
- qt5-wayland 
- qt6-wayland 
- Lock screen: hyprlock

Optionally, you can activate the installation of yay to get access to the AUR.

## Key Bindings

The following custom key bindings are enabled (can be customized in ~/.config/hypr/hyprland.conf)

- <kbd>SUPER</kbd> + <kbd>RETURN</kbd> to start terminal alacritty
- <kbd>SUPER</kbd> + <kbd>Q</kbd> to quit an application
- <kbd>SUPER</kbd> + <kbd>B</kbd> to start browser
- <kbd>SUPER</kbd> + <kbd>M</kbd> to exit Hyprland
- <kbd>SUPER</kbd> + <kbd>E</kbd> to start filemanager
- <kbd>SUPER</kbd></kbd> + <kbd>CTRL</kbd> + <kbd>RETURN</kbd> to start launcher rofi
- <kbd>SUPER</kbd> + <kbd>T</kbd> to toggle floating
- <kbd>SUPER</kbd> + <kbd>F</kbd> to toggle fullscreen
- <kbd>SUPER</kbd> + <kbd>1-9</kbd> to switch workspaces
- more key bindings in ~/.config/hypr/conf/binds.conf

or after the installation with right mouse click on Apps in the status bar.