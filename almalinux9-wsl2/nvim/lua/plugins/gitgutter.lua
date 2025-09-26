
return {
  {
    'airblade/vim-gitgutter',
    commit = '488c055',
    init = function()
      vim.api.nvim_create_autocmd('BufWrite', { command = 'GitGutterEnable' })
    end,
  },
}
