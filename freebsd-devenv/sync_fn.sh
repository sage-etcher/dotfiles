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

sync_to_myconfig() {
    local src="$1"
    local dst="${HOME}/.myconfig/$1"
    local exclude=$2

    sync "${src}" "${dst}"
}

symlink_myconfig() {
    local dst_path="~/.myconfig"
    local src_path="~/.config"
    ln -s "${src_path}/*" "${dst_path}/"
}

symlink_bin() {
    local name="$1"
    local src_path="~/.config/${name}/bin"
    local dst_path="~/.local/bin"
    ln -s "${src_path}/*" "${dst_path}/"
}

