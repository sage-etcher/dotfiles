#!/usr/bin/env sh

mkdir -p fish
cp -rf ~/.config/fish/{completions,conf.d,functions}    fish/
cp -f ~/.config/fish/{config.fish,fish_variables}       fish/

mkdir -p git
cat ~/.gitconfig |sed 's/\(signingkey =\) .*/\1 [REDACTED]/' > git/config

mkdir -p nvim
cp -rf ~/.config/nvim/lua       nvim/
cp -f ~/.config/nvim/init.lua   nvim/

mkdir -p tmux
cp -rf ~/.config/tmux/tmux.conf tmux/

# end of file
