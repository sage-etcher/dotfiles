#!/bin/sh

#let VIM_CONFIG_DIR = "$HOME/.vim"
VIM_CONFIG_DIR="/tmp/vim"
VIM_PACK_DIR="$VIM_CONFIG_DIR/pack"

NVIM_CONFIG_DIR="$HOME/.config/nvim"

# if 1 create a directory hard link for nvim, 0 only setup for standard vim.
NVIM_SETUP=0


# silence pushd and popd msgs
function spushd {
    command pushd "$@" > /dev/null
}

function spopd {
    command popd "$@" > /dev/null
}


# create+enter vim8 style package folder
mkdir -p "$VIM_PACK_DIR"
spushd "$VIM_PACK_DIR"

# clone plugins/packages functions
function to_lower {
    input_string="$1"

    # convert the string
    output_string=$(echo "$input_string" | tr '[:upper:]' '[:lower:]')

    # retrun the string using stdout/pipe
    echo "$output_string"
}


function clean_install {
    pkg_directory="$1"

    user_input=""
    user_input_lower=""

    read -p "package already exists, reinstall? [y/N] " user_input

    # check that the first character of the string is a 'y' or 'Y'
    user_input_lower=$(to_lower "$user_input")
    if [[ "${user_input_lower:0:1}" == "y" ]]; then
        rm -rf "$pkg_directory"
        return 0
    fi

    return 1
}

function import_package {
    git_author="$1"
    git_package="$2"
    dest_dir="$3"

    start_directory="$dest_dir/$git_author/start"
    pkg_directory="$start_directory/$git_package"
    pkg_name="$git_author/$git_package"

    reinstall_flag=1

    user_input=""
    user_input_lower=""


    read -p "import $pkg_name? [y/N]: " user_input

    # check that the first character of the string is a 'y' or 'Y'
    user_input_lower=$(to_lower "$user_input")
    if [[ "${user_input_lower:0:1}" == "y" ]]; then
        # if the package exists, prompt the user for confirmation of reinstall
        if [[ -d "$pkg_directory" ]]; then
            # get return code from clean_install
            clean_install "$pkg_directory"
            reinstall_flag="$?"

            # if the user doesnt say yes, dont reinstall the package
            if [[ $reinstall_flag != 0 ]]; then
                # make pretty formatting
                echo ""
                return
            fi
        fi

        # import the package from git repo
        mkdir -p "$pkg_directory"
        spushd "$pkg_directory"
        git clone "https://github.com/$pkg_name.git"
        spopd

        # echo new line for pretty formatting
        echo ""
    fi
}


# prompt for the packages
import_package "sage-etcher" "vim-i8080-syntax" "$VIM_PACK_DIR"
import_package "sage-etcher" "vim-plm-syntax"   "$VIM_PACK_DIR"
import_package "bfrg"        "vim-cpp-modern"   "$VIM_PACK_DIR"
import_package "jnurmine"    "Zenburn"          "$VIM_PACK_DIR"


# exit the vim config folder
spopd


# create a directory symlink for neovim
if [[ $NVIM_SETUP == 1 ]]; then
    ln -d "$VIM_PACK_DIR" "$NVIM_CONFIG_DIR/pack"
fi

# exit
