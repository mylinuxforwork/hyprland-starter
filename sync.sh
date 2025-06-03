#!/bin/bash
rsync -avhp --exclude={'monitor.conf','input.conf'} -I dotfiles/ ~/.mydotfiles/com.ml4w.hyprlandstarter/
