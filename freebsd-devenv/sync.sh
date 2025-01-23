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
for config in X11 git nvim tmux npm xmodmap suckless-build-files; do
    sync_from_config "${config}/"
done

# sync suckless software
for config in dwm dmenu st; do
    sync_from_config "${config}/Makefile"
    sync_from_config "${config}/config.mk"
    sync_from_config "${config}/patch/"
    sync_from_config "${config}/bin/"
done

# sync only bins
for config in feh; do
    sync_from_config "${config}/bin/"
done


# sync tcsh (has to be from home directory)
sync "${HOME}/.cshrc" "./tcsh/cshrc"
sync "${HOME}/.login" "./tcsh/login"
sync "${HOME}/.logout" "./tcsh/logout"
