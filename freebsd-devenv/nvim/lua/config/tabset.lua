
local tabset = require('tabset')

tabset.setup({
  defaults = {
    tabwidth = 4,
    expandtab = true,
  },
  languages = {
    {
      filetypes = { 'python', 'make' },
      config = {
        expandtab = false,
      }
    },
    {
      filetypes = { 'yaml', 'html', 'lua', 'json', 'meson' },
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
