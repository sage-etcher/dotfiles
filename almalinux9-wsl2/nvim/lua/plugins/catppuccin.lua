
return {
  {
    'catppuccin/nvim', name = 'catppuccin',
    priority = 1000,
    tag = 'v1.11.0',
    config = function()
      catppuccin = require('catppuccin')

      catppuccin.setup({
        flavour = 'latte',
        transparent_background = true,
        show_end_of_buffer = true,
        styles = {
          comments     = { "italic" },
          conditionals = { "italic" },
          loops        = { "italic" },
          keywords     = { "italic" },
          types        = { "italic" },
          strings      = { "italic" },
        }
      })

      vim.cmd([[colorscheme catppuccin]])
    end,
  }
}
