#!/usr/bin/env sh

sync() {
    rsync -avu --delete "$1" "$2"
}

sync_from_config() {
    local src="${HOME}/.config/$1"
    local dst="$1"
    local exclude=$2

    sync "${src}" "${dst}"
}

# sync basic config
for config in X11 git nvim tmux npm xmodmap; do
    sync_from_config "${config}/"
done

# sync dwm
for config in dwm dmenu st; do
    sync_from_config "${config}/patches/"
    sync_from_config "${config}/rebuild.sh"
    sync "${HOME}/.config/${config}/src/config.h" "${config}/"
done

# sync tcsh (has to be from home directory)
sync "${HOME}/.cshrc" "./tcsh/cshrc"
sync "${HOME}/.login" "./tcsh/login"
sync "${HOME}/.logout" "./tcsh/logout"
