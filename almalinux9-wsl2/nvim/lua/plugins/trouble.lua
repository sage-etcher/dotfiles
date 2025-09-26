
return {
  { 
    'folke/trouble.nvim',
    tag = 'v2.10.0',
    dependencies = {
      { 'nvim-tree/nvim-web-devicons' },
    },
    keys = {
      { '<leader>xx', '<Cmd>TroubleToggle workspace_diagnostics<cr>' },
    },
  },

}
