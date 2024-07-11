# Remove existing symlinks
for df in "${backup_files[@]}"
do
    if [ -L "${df}" ]; then
        rm ${df}
        echo ":: Symlink $df removed"
    fi
done

# Copy configuration to dotfiles folder
if [ -f excludes.txt ] ;then
    rsync -avhp -I --exclude-from=~/ml4w-excludes.txt ~/ml4w/$version/ ~/
else
    rsync -avhp -I ~/ml4w/$version/ ~/
fi
echo ":: Dotfiles installed in ~/.config/"
