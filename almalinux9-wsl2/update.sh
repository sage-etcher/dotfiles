#!/usr/bin/env sh

rm -rf fish/
mkdir -p fish
cp -rf ~/.config/fish/{completions,conf.d,functions}    fish/
cp -f ~/.config/fish/{config.fish,fish_variables}       fish/

rm -rf git/
mkdir -p git
cat ~/.gitconfig |sed 's/\(signingkey =\) .*/\1 [REDACTED]/' > git/config

rm -rf nvim/
mkdir -p nvim
cp -rf ~/.config/nvim/lua       nvim/
cp -f ~/.config/nvim/init.lua   nvim/

rm -rf tmux/
mkdir -p tmux
cp -f ~/.config/tmux/tmux.conf tmux/

rm -rf kitty/
mkdir -p kitty
cp -rf ~/.config/kitty/{kitty.conf,theme.conf,themes/} kitty/

# end of file
