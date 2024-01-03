
# https://github.com/sage-etcher/config-files/blob/main/zsh/zshrc
#
# Sage I. Hendricks
# Last modified: Jan 2nd, 2024


# Main Prompt
autoload -Uz add-zsh-hook vcs_info
setopt prompt_subst
add-zsh-hook precmd vcs_info
zstyle ':vcs_info:*' formats ' %F{magenta}(%b)%f'
PS1='%F{green}%m@%n%f %F{cyan}%~%f${vcs_info_msg_0_} $ '

# Secondary Prompt
PS2='continue? '


# end of file 
