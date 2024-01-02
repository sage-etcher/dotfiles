set encoding=utf-8

set nobackup
set nowritebackup

set updatetime=300

set signcolumn=yes

inoremap <silent><expr> <TAB>
	\ coc#pum#visible() ? coc#pum#next(1) :
	\ "\<Tab>"

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
	\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <C-space> coc#refresh()

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
	if CocAction('hasProvider', 'hover')
		call CocActionAsync('doHover')
	else
		call feedkeys('K', 'in')
	endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)


