
# Setup basic auto completion
autoload -U compinit

zstyle ':completion:*' menu select
zmodload zsh/complist
setopt extendedglob
_copm_options+=(globdots)


