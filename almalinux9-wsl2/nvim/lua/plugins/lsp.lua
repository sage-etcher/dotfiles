
return {
  {
    'neovim/nvim-lspconfig',
    tag = 'v1.0.0',
    dependencies = {
      { 'ms-jpq/coq_nvim', branch = 'coq', commit = '3febed8' },
      { 'ms-jpq/coq.artifacts', branch = 'artifacts', commit = 'ef5f21d' },
      { 'ms-jpq/coq.thirdparty', branch = '3p', commit = '6ee3c22' },
    },
    init = function()
      vim.g.coq_settings = {
        auto_start = true,
      }
    end,
    config = function()
      -- lsp setup
      local lspconfig = require('lspconfig')
      local coq = require('coq')

      lspconfig.clangd.setup(coq.lsp_ensure_capabilities({}))
    end,
  },

  {
    'ray-x/lsp_signature.nvim',
    branch = 'nvim-0.9',  -- supports nvim>=0.8 owo"
    opts = {
      bind = true,
      handler_opts = {
        border = 'none',
      },
    },
  },

}
