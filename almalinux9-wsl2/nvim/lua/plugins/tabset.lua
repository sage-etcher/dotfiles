
return {
  { 
    'FotiadisM/tabset.nvim', 
    commit = '996f95e',
    opts = {
      languages = {
        {
          filetypes = { 'python', 'Makefile' },
          config = {
            expandtab = false,
          },
        },
        {
          filetypes = { 'yaml', 'html', 'lua', 'json', 'meson' },
          config = {
            tabwidth = 2,
          },
        },
        {
          filetypes = { 'assembly', 'disassembly', 'i8080' },
          config = {
            tabwidth = 8,
            expandtab = false,
          },
        },
      },
    } 
  }
}
