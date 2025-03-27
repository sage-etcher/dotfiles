

require('utils')

local findroot = function(file_list)
  return fs.dirname(fs.find(file_list, { upward = true })[1])
end

autocmd('FileType', {
  pattern = { 'c', 'cpp' },
  callback = function(ev)
    lsp.start({
      name = 'Clangd',
      cmd = { 'clangd' },
      args = {
        '--clang-tidy',
        '-j4',
      },
      root_dir = findroot({
        '.clangd',
        '.clang-tidy',
        '.clang-format',
        'compile_commands.json',
        'compile_flags.txt',
        'configure.ac',
        '.git',
      }),
      settings = {
        single_file_support = true,
      }
    })
  end
})


-- end of file
