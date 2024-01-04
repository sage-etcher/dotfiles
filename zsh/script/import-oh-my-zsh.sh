#!/bin/sh

CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" $CONFIG_DIR/oh-my-zsh/

git clone https://github.com/b4b4r07/zsh-vimode-visual $CONFIG_DIR/oh-my-zsh/custom/plugins/zsh-vimode-visual
#git clone https://github.com/nyquase/vi-mode $CONFIG_DIR/oh-my-zsh-custom/plugins/vi-mode
git clone https://github.com/sage-etcher/vi-mode $CONFIG_DIR/oh-my-zsh-custom/plugins/vi-mode
