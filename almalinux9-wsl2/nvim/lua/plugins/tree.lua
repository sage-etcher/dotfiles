return {
  'nvim-tree/nvim-tree.lua',
  tag = 'nvim-tree-v1.3.3',
  opts = {
    filters = { dotfiles = true },
  },
  keys = {
    { '<C-t>',      '<cmd>:NvimTreeToggle<cr>' },
    { '<leader>tt', '<cmd>:NvimTreeFocus<cr>' },
  },
}

-- end of file
