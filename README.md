
# My Dotfiles

Legit just a collection of dot files I find myself needing on a decent basis

All are designed to follow the XDG Base Directory standards, so none of that
`$HOME/.*` business!

Script directories contain bash scripts for installing additional dependencies,
such as plugins or package managers.

Config directories contain "dotfiles" intended to be installed at
`$XDG_CONFIG_HOME/[programname]/` or `$HOME/.config/[programname]`.

Some programs may require you to set enviornmental variables to propperly use
the XDG directories. I recomend adding the enviornment variables in the
`/etc/security/pam_env.conf` file. A non-inclusive list of programs that may
need this are:

## X (xinit & startx)

``` text
XINITRC     DEFAULT=@{HOME}/.config/x/xintrc
XAUTHORITY  DEFAULT=@{HOME}/.config/x/Xauthority
```

## Z-Shell (zsh)

``` text
ZDOTDIR  DEFAULT=@{HOME}/.config/zsh
```

## Node Package Manager (npm)

``` text
NPM_CONFIG_USERCONFIG  DEFAULT=@{HOME}/.config/npm/npmrc
```

# License

MIT License

Copyright (C) 2024 Sage I. Hendricks
