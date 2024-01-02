# source this file to use in a bash script. does nothing if executed 

# silent pushd
function spushd {
    command pushd "$@" > /dev/null
}

# silent popd
function spopd {
    command popd "$@" > /dev/null
}

# convert string to lower case
function to_lower {
    local input_string="$1"

    # convert the string
    local output_string=$(echo "$input_string" | tr '[:upper:]' '[:lower:]')

    # retrun the string using stdout/pipe
    echo "$output_string"
}


# confirm deletion, then remove the given directory
function clean_install {
    local pkg_directory="$1"

    # variables
    local user_input=""
    local user_input_lower=""

    # check that the first character of the string is a 'y' or 'Y'
    read -p "package already exists, reinstall? [y/N] " user_input
    user_input_lower=$(to_lower "$user_input")
    if [[ "${user_input_lower:0:1}" == "y" ]]; then
        # remove the directory
        rm -rf "$pkg_directory"
        return 0
    fi

    return 1
}

# install a package from github
function import_package {
    local PKG_NAME="$1"
    local PKG_URL="$2"
    local PKG_OUTPATH="$3"

    # variables
    local user_input=""
    local user_input_lower=""
    local reinstall_flag=1

    # check that the first character of the string is a 'y' or 'Y'
    read -p "import $PKG_NAME? [y/N]: " user_input
    user_input_lower=$(to_lower "$user_input")
    if [[ "${user_input_lower:0:1}" != "y" ]]; then
        return
    fi

    # prompt to remove PKG_OUTPATH if it exists
    if [[ -d "$PKG_OUTPATH" ]]; then

        # prompt and clean
        clean_install "$PKG_OUTPATH"
        reinstall_flag="$?"

        # if user say no to cleaning, dont do anything more
        if [[ $reinstall_flag != 0 ]]; then
            # exit function (pretty formatting)
            echo ""
            return
        fi
    fi

    # clone the git repo to PKG_OUTPATH
    git clone "$PKG_URL" "$PKG_OUTPATH"

    # exit function (pretty formatting)
    echo ""
    return
}


# end of file
