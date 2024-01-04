

" True Colors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Term vs GUI colors
if (has("termguicolors"))
	set termguicolors
endif

" Personal config 
let g:palenight_color_overrides = {
\   'black':       { 'gui': '#303030', 'cterm': '236', 'cterm16': '0' },
\   'cursor_grey': { 'gui': '#303030', 'cterm': '236', 'cterm16': '0' },
\}

" Use italics
let g:palenight_terminal_italics=1

" set the color scheme
set background=dark
colorscheme palenight

