
local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')
  
  -- pretty
  Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
  Plug('nyoom-engineering/oxocarbon.nvim')

  -- misclaneous
  Plug('FotiadisM/tabset.nvim')


vim.call('plug#end')

-- pretty
require('config.treesitter')
require('config.tabset')

-- theme
require('config.oxocarbon')

-- end of file



