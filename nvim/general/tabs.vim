
" set defaults
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" file type defaults
autocmd FileType Makefile
	\ setlocal noexpandtab

autocmd FileType python
	\ setlocal noexpandtab

autocmd FileType Whitespace " Does not work atm, no detection for Whitespace lang
	\ setlocal tabstop=1
	\ setlocal softtabstop=1
	\ setlocal shiftwidth=1
	\ setlocal noexpandtab

autocmd FileType Yaml
	\ setlocal tabstop=2
	\ setlocal softtabstop=2
	\ setlocal shiftwidth=2
	\ setlocal expandtab

autocmd FileType html
	\ setlocal tabstop=2
	\ setlocal softtabstop=2
	\ setlocal shiftwidth=2
	\ setlocal noexpandtab

autocmd FileType asm
	\ setlocal tabstop=8
	\ setlocal softtabstop=8
	\ setlocal shiftwidth=8
	\ setlocal noexpandtab

