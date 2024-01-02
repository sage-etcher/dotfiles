" Basic
set number
set showcmd
set nowrap
set cursorline

" Compatibility
set nocompatible
filetype plugin indent on
set secure

" Colours
set t_Co=256
set termguicolors
syntax on
syntax enable

" Vim, no. gimme
set noequalalways
set foldmethod=manual

" Set leader key
let mapleader = ","

" Use global clipboard as default (better for tmux)
set clipboard=unnamed
