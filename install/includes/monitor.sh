if [ ! -f ~/.config/hypr/conf/monitor.conf ] ;then
    # Set initial screen resolution
    echo -e "${GREEN}"
    figlet "Monitor"
    echo -e "${NONE}"
    echo "Please select your initial screen resolution. Can be changed later in ~/.config/hypr/hyprland.conf"
    echo
    screenres=$(gum choose --height 15 "1024x768" "1280x720" "1280x800" "1440x900" "1280x1024" "1680x1050" "1280x1440" "1600x1200" "1920x1080" "1920x1200" "2560x1440" "2560x1600")
    SEARCH="monitor=,preferred,auto,auto"
    REPLACE="monitor=,$screenres,auto,1"
    sed -i -e "s/$SEARCH/$REPLACE/g" ~/ml4w/$version/.config/hypr/conf/monitor.conf    
    echo ":: Initial screen resolution set to $screenres"
else
    rm ~/ml4w/$version/.config/hypr/conf/monitor.conf
fi