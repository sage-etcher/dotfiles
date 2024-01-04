
# completion around expansion
zle -C complete-glob menu-complete compglob
bindkey "^K" complete-glob
compglob () {
    setopt localoptions globsubst
    compset -P '*'
    files=(${IPREFIX}*)
    display=(${files/${IPREFIX}/${(q)IPREFIX}})
    glob=(${files/${IPREFIX}/})
    compadd -d display -- $glob
}


# completion w/o expansion >:P
bindkey "^I" complete-word


