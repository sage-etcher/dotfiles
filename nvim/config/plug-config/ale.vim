
" let g:ale_c_cc_options = '-std=c99 -Wall'
"let g:ale_c_cc_options = '-std=c99 -pedantic -Wpedantic -Wall -Wno-unused-function -Wno-unused-label -Wno-unused-variable'


function s:apply_cc_options (buffer)

    " Try to find the 'compile_commands.json' file
    let [l:root, l:json_file] = ale#c#FindCompileCommands(a:buffer)

    " set respective value's if it is/isn't found
    if l:json_file==''
        let g:ale_c_cc_options = '-ansi -pedantic -Wall'
    else
        let g:ale_c_cc_options = ''
    endif

endfunction
           
" apply options for each new file/buffer opened
autocmd BufReadPost * call s:apply_cc_options (bufnr(''))
