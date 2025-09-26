
local tabset = require('tabset')

tabset.setup({
  defaults = {
    tabwidth = 4,
    expandtab = true,
  },
  languages = {
    {
      filetypes = { 'python', 'Makefile' },
      config = {
        expandtab = false,
      }
    },
    {
      filetypes = { 'yaml', 'html', 'lua', 'json' },
      config = {
        tabwidth = 2,
      }
    },
    {
      filetypes = { 'assembly', 'disassembly' },
      config = {
        tabwidth = 8,
        expandtab = false,
      }
    },
  }
})

-- end of file
