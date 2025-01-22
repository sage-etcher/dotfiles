#!/usr/bin/env sh

our_pwd=$(pwd)
cd ${HOME}/.config/st/src/
make clean
make
make install
make clean
cd ${our_pwd}


