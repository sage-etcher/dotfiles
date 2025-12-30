
return {
  {
    'neovim/nvim-lspconfig',
    tag = 'v1.0.0',
    lazy = false,
    dependencies = {
      { 'ms-jpq/coq_nvim', branch = 'coq', commit = '3febed8' },
      { 'ms-jpq/coq.artifacts', branch = 'artifacts', commit = 'ef5f21d' },
      { 'ms-jpq/coq.thirdparty', branch = '3p', commit = '6ee3c22' },
    },
    init = function()
      vim.g.coq_settings = {
        auto_start = 'shut-up',
      }
    end,
    config = function()
      local lspconfig = require('lspconfig')
      local coq = require('coq')

      lspconfig.clangd.setup(coq.lsp_ensure_capabilities({}))
      lspconfig.pyright.setup(coq.lsp_ensure_capabilities({}))
      lspconfig.gopls.setup(coq.lsp_ensure_capabilities({}))
    end,
    keys = {
      { 'K',    '<Cmd>:lua vim.lsp.buf.hover()<cr>' },
      { 'gd',   '<Cmd>:lua vim.lsp.buf.definition()<cr>' },
      { 'gD',   '<Cmd>:lua vim.lsp.buf.declaration()<cr>' },
      { 'gi',   '<Cmd>:lua vim.lsp.buf.implementation()<cr>' },
      { 'go',   '<Cmd>:lua vim.lsp.buf.type_definition()<cr>' },
      { 'gr',   '<Cmd>:lua vim.lsp.buf.references()<cr>' },
      { 'gs',   '<Cmd>:lua vim.lsp.buf.signature_help()<cr>' },
      { '<F2>', '<Cmd>:lua vim.lsp.buf.rename()<cr>' },
    }
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

  {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    tag = 'v3.0.0',
    lazy = false,
    config = function()
      vim.diagnostic.config({
        virtual_text  = false,
        virtual_lines = true,
      })

      lsp_lines = require('lsp_lines')
      lsp_lines.setup({})
    end,
    keys = {
      { '<leader>l', '<cmd>:lua require("lsp_lines").toggle()<cr>' },
    },

  },

}
