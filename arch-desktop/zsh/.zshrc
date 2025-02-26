# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/zsh/histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep
unsetopt extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/sage/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export PATH="${PATH}:/home/sage/.local/bin"

source ~/.config/zsh/xdg-compliance.sh

export LC_ALL=C
alias ls='ls -F --color=auto'
alias la='ls -a'
alias ll='ls -la'
alias l='ls -l'


