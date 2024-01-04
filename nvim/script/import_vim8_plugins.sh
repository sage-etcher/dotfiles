#!/bin/sh

# configuration variables
#VIM_PACK="$HOME/.vim/pack"
VIM_PACK="$XDG_CONFIG_DIR/vim/pack"

NVIM_SETUP=1
NVIM_PACK="$XDG_CONFIG_DIR/nvim/pack"

# source import file
. ./import_git_pkg.sh


# install packages (import_package "name" "url" "path")
import_package "sage-etcher/vim-i8080-syntax" "https://github.com/sage-etcher/vim-i8080-syntax.git" "$VIM_PACK/sage-etcher/start/vim-i8080-syntax"
import_package "sage-etcher/vim-plm-syntax"   "https://github.com/sage-etcher/vim-plm-syntax.git"   "$VIM_PACK/sage-etcher/start/vim-plm-syntax"
import_package "bfrg/vim-cpp-modern"          "https://github.com/bfrg/vim-cpp-modern.git"          "$VIM_PACK/bfrg/start/vim-cpp-modern"
import_package "jnurmine/Zenburn"             "https://github.com/jnurmine/Zenburn.git"             "$VIM_PACK/jnurmine/start/Zenburn"


# symlink the vim diretory to be used by nvim aswell
if [[ $NVIM_SETUP == 1 ]]; then
    ln -ds "$VIM_PACK" "$NVIM_PACK"
fi


# end of file
