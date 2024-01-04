#!/bin/sh

CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"

git clone https://github.com/alacritty/alacritty-theme.git $CONFIG_DIR/alacritty/themes

