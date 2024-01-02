
# https://github.com/sage-etcher/config-files/blob/main/zsh/zshrc
#
# Sage I. Hendricks
# Last modified: Jan 2nd, 2024


# Keyboard Special Keys
zkbd_file="$HOME/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE}"
if [ ! -f "$zkbd_file" ]; then
    autoload zkbd
    zkbd
fi

source "$zkbd_file"
[[ -n "$key[Home]" ]] && bindkey - "$key[Home]" vi-beginning-of-line
[[ -n "$key[End]" ]] && bindkey - "$key[End]" vi-end-of-line
[[ -n "$key[Insert]" ]] && bindkey - "$key[Insert]" overwrite-mode
[[ -n "$key[Backspace]" ]] && bindkey - "$key[Backspace]" vi-backward-delete-char
[[ -n "$key[Delete]" ]] && bindkey - "$key[Delete]" vi-delete-char
[[ -n "$key[Up]" ]] && bindkey - "$key[Up]" up-line-or-history
[[ -n "$key[Down]" ]] && bindkey - "$key[Down]" down-line-or-history
[[ -n "$key[Left]" ]] && bindkey - "$key[Left]" vi-backward-char
[[ -n "$key[Right]" ]] && bindkey - "$key[Right]" vi-forward-char


# end of file 
