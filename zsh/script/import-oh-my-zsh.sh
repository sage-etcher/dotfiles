#!/bin/sh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" $XDG_CONFIG_HOME/oh-my-zsh/

git clone https://github.com/b4b4r07/zsh-vimode-visual $XDG_CONFIG_HOME/oh-my-zsh/custom/plugins/zsh-vimode-visual
#git clone https://github.com/nyquase/vi-mode $XDG_CONFIG_HOME/oh-my-zsh-custom/plugins/vi-mode
git clone https://github.com/sage-etcher/vi-mode $XDG_CONFIG_HOME/oh-my-zsh-custom/plugins/vi-mode
