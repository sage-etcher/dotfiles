" Shell Command Function
function! ShellCommand (prefix, arg_list)
    let command = a:prefix .. join(a:arg_list, ' ')
    return system(command)
endfunction

" Git Command-line "inegration"
command -nargs=* G echo ShellCommand('git ', [<f-args>])

" The Command Panel is dumb, just lemme out
nnoremap q: :q

" Quick Quit
nnoremap <C-q> :qa!<CR>


