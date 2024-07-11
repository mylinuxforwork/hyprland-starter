if [ -d ~/.config/ml4w/settings ] ;then
    echo -e "${GREEN}"
    figlet "Restore Settings"
    echo -e "${NONE}"
    echo ":: The script has detected an existing settings folder."
    if gum confirm "Do you want to restore the settings?" ;then
        cp -r ~/.config/ml4w/settings/. ~/ml4w/$version/.config/ml4w/settings/
    elif [ $? -eq 130 ]; then
        echo ":: Installation canceled"
        exit
    else
        echo ":: Restore skipped"
    fi
fi