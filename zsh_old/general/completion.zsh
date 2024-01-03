
# https://github.com/sage-etcher/config-files/blob/main/zsh/general/zshrc
#
# Sage I. Hendricks
# Last modified: Jan 2nd, 2024


# Auto Completion
zstyle ':completion:*' completer _expand _complete _ignored
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit
compinit


# end of file
