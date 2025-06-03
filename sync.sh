#!/bin/bash
# FOR DEVELOPMENT ONLY
rsync -avhp --exclude={'monitor.conf','input.conf','.gitignore','.git'} -I dotfiles/ ~/.mydotfiles/com.ml4w.hyprlandstarter/
