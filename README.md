# ML4W Hyprland Starter 2.0

> [!IMPORTANT]
> These dotfiles are currently being revised and updated. This can lead to side effects during the installation or update.

![hyprland-starter20](https://github.com/user-attachments/assets/71e387ff-68a6-4c4d-a98c-6d6a86fb900e)

The ML4W Hyprland Starter package is the perfect starting point for your Hyprland customization experiments. The Hyprland Starter configuration works on all Linux distributions that support the dynamic tiling window manager Hyprland.

You can find configurations here: https://github.com/mylinuxforwork/hyprland-starter/tree/main/dotfiles

## Installation

You can install the ML4W Hyprland Starter easily with the Dotfiles Installer from an existing Window Manager or Desktop Environment.

<a href="https://mylinuxforwork.github.io/dotfiles-installer/" target="_blank"><img src="https://mylinuxforwork.github.io/dotfiles-installer/dotfiles-installer-badge.png" style="border:0;margin-bottom:10px"></a>

More information about the installation of the Dotfiles Installer here: https://github.com/mylinuxforwork/dotfiles-installer/wiki/01-Installation

Copy the following url into the Dotfiles Installer.

```
https://raw.githubusercontent.com/mylinuxforwork/hyprland-starter/main/hyprland-starter.dotinst
```
Please run the setup script offered by the Dotfiles Installer to install all dependencies. If your distribution is not supported, please install the following dependencies manually:

- hyprland
- waybar
- rofi-wayland
- kitty
- dunst
- thunar
- xdg-desktop-portal-hyprland
- qt5-wayland
- qt6-wayland
- hyprpaper
- hyprlock
- firefox
- ttf-font-awesome
- vim
- fastfetch
- ttf-fira-sans
- ttf-fira-code
- ttf-firacode-nerd
- jq
- brightnessctl
- networkmanager
- wireplumber

> Hyprland does not officially support NVIDIA hardware. But many users have reported a successful installation. Please read: https://wiki.hyprland.org/Nvidia/

## Documentation (Wiki)

You can find the complete documentation of the ML4W Starter in the Wiki. <b>[Open the Wiki here](https://github.com/mylinuxforwork/hyprland-starter/wiki)</b>

## Dependencies

The script will install the following packages and the corresponding configurations:

- Window Manager: hyprland 
- Status Bar: waybar 
- Launcher: rofi-wayland 
- Browser: Firefox
- Terminal: kitty
- Notification Service: dunst 
- File Manager: Thunar
- xdg-desktop-portal-hyprland 
- qt5-wayland 
- qt6-wayland 
- Lock screen: hyprlock

## Key Bindings

The following custom key bindings are enabled (can be customized in ~/.config/hypr/hyprland.conf)

- <kbd>SUPER</kbd> + <kbd>RETURN</kbd> to start terminal
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
