#!/usr/bin/env sh

our_pwd=$(pwd)
cd ${HOME}/.config/dmenu/src/
make clean
make build
make install
make clean
cd ${our_pwd}


