#!/bin/sh

mkdir -pv $HOME/.config/alacritty
pushd $HOME/.config/alacritty
git clone https://github.com/alacritty/alacritty-theme.git
mv alacritty-theme themes
popd

