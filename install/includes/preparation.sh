if [ ! -d ~/ml4w ] ;then
    mkdir ~/ml4w
fi
if [ -d ~/ml4w/$version ] ;then
    rm -rf ~/ml4w/$version
fi
cp -r dotfiles ~/ml4w/$version
echo ":: ML4W Hyprland Starter configuration prepared in ~/ml4w/$version"