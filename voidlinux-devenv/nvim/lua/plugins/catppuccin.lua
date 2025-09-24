
return {
  {
    'catppuccin/nvim',
    tag = 'v1.11.0',
    opts = {
      flavor = 'latte',
      transparent_background = true,
    },
    config = function()
      vim.cmd([[colorscheme catppuccin-latte]])
    end,
  }
}
