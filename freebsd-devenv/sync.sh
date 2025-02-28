#!/usr/bin/env sh

source sync_fn.sh

# sync basic config
for config in clang-tidy git npm nvim suckless-build-files tcsh tmux wget X11 xmodmap; do
    sync_from_config "${config}/"
done

# sync suckless software
for config in dmenu dwm st; do
    sync_from_config "${config}/Makefile"
    sync_from_config "${config}/config.mk"
    sync_from_config "${config}/patch/"
    sync_from_config "${config}/bin/"
done

# sync only bins
for config in fastfetch; do
    sync_from_config "${config}/bin/"
done


