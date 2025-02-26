#!/usr/bin/env sh

sync() {
    rsync -au --delete "$1" "$2"
}

sync_from_config() {
    local src="${HOME}/.config/$1"
    local dst="$1"
    local exclude=$2

    sync "${src}" "${dst}"
}

# sync basic config
for config in bash i3 i3status nvim tmux wget X11 xmodmap zsh; do
    sync_from_config "${config}/"
done

for config in alacritty; do
    sync_from_config "${config}/alacritty.toml"
done


# end of file
