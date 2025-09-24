return {
  {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.7',
    dependencies = {
      { 'nvim-lua/plenary.nvim', tag = 'v0.1.0' },
    },
    opts = {
      defaults = {
        layout_config = {
          width = 0.9,
          height = 0.9,
          preview_cutoff = 50,
        },
      },
    },
    keys = {
      { '<leader>ff', '<cmd>Telescope find_files<cr>' },
      { '<leader>fg', '<cmd>Telescope live_grep<cr>' },
      { '<leader>fb', '<cmd>Telescope buffers<cr>' },
    }
  }
}
