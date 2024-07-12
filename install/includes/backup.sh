backup_files=(
    ".config/alacritty"
    ".config/dunst"
    ".config/hypr"
    ".config/ml4w"
    ".config/rofi"
    ".config/waybar"
    ".config/wlogout"
    ".bashrc"
)

echo -e "${GREEN}"
figlet "Backup"
echo -e "${NONE}"
echo "The script can create a backup of you existing configurations in .config and your .bashrc"
if gum confirm "Do you want to create a backup now" ;then

    # Create ml4w folder
    if [ ! -d ~/ml4w ] ;then
        mkdir ~/ml4w
    fi

    # Get current timestamp
    datets=$(date '+%Y%m%d%H%M%S')

    # Create backup folder
    if [ ! -d ~/ml4w/archive ] ;then
        mkdir ~/ml4w/archive
    fi

    # Create backup folder
    if [ ! -d ~/ml4w/backup ] ;then
        mkdir ~/ml4w/backup
    else
        mkdir ~/ml4w/archive/$datets
        cp -r ~/ml4w/backup/. ~/ml4w/archive/$datets/
    fi

    for df in "${backup_files[@]}"
    do
        if [ -d ~/$df ] ;then
            echo ":: Backup of $df"
            mkdir -p ~/ml4w/backup/$df
            cp -r ~/$df ~/ml4w/backup/$df
        fi
        if [ -f ~/$df ] && [ ! -L "${df}" ] ;then
            echo ":: Backup of $df"
            cp ~/$df ~/ml4w/backup/$df
        fi
    done
elif [ $? -eq 130 ]; then
    echo ":: Installation canceled"
    exit 130
else
    echo ":: Backup skipped"
fi