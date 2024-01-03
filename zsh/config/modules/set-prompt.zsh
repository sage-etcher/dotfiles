
# Setup the Prompt(s)
#autoload -U colors && colors
autoload -Uz add-zsh-hook vcs_info && add-zsh-hook precmd vcs_info
setopt prompt_subst

# Version Control message
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*'     unstagedstr   '*'
zstyle ':vcs_info:*'     stagedstr     '+'
zstyle ':vcs_info:git:*' formats       ' %F{magenta}(%b%u%c)%f'
zstyle ':vcs_info:git:*' actionformats ' %F{magenta}(%b|%a%u%c)%f'
#zstyle ':vcs_info:*' formats ' %F{magenta}(%b)%f'

# Primary Prompt
#PS1='%F{green}%m@%n%f %F{cyan}%~%f${vcs_info_msg_0_} $ '
PS1='%F{red}[%*]%f %F{green}%m@%n%f %F{cyan}%~%f${vcs_info_msg_0_} $ '

# Secondary Prompt
PS2='continue? '


# end of file
