#!/usr/bin/env sh

source sync_fn.sh

mkdir ~/.myconfig
for config in clang-tidy git npm nvim suckless-build-files tcsh tmux wget X11 xmodmap; do
    sync_to_myconfig "${config}"
done

symlink_myconfig

ln -s "~/.config/clang-tidy/clang-tidy" "~/.clang-tidy"

ln -s "~/.config/tcsh/cshrc"  "~/.cshrc"
ln -s "~/.config/tcsh/login"  "~/.login"
ln -s "~/.config/tcsh/logout" "~/.logout"

symlink_bin fastfetch
symlink_bin dwm
symlink_bin dmenu
symlink_bin st

rebuild-dmenu
rebuild-dwm
rebuild-st

