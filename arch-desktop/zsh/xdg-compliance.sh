
export GRADLE_USER_HOME="${XDG_DATA_HOME}/gradle"
export GNUPGHOME="${XDG_DATA_HOME}/gnupg"
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=\"${XDG_CONFIG_HOME}/java\""
export NUGET_PACKAGES="${XDG_CACHE_HOME}/NuGetPackages"
export CUDA_CACHE_PATH="${XDG_CACHE_HOME}/nv"
export WGETRC="${XDG_CONFIG_HOME}/wget/wgetrc"
export WINEPREFIX="${XDG_DATA_HOME}/wineprefixes/default"
export XAUTHORITY="${XDG_RUNTIME_DIR}/Xauthority"

alias nvidia-settings='nvidia-settings --config="${XDG_CONFIG_HOME}/nvidia/settings"'



# end of file
