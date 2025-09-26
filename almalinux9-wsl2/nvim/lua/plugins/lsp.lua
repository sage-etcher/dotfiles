
return {
  {
    'neovim/nvim-lspconfig',
    tag = 'v1.0.0',
    dependencies = {
      -- TODO: replace cpm with coq
      { 'hrsh7th/nvim-cmp', tag = 'v0.0.1' },
      { 'hrsh7th/cmp-nvim-lsp', commit = '78924d1' },

      -- for unkown reasons vsnip and treesitter didnt like each other, the two
      -- would throw errors on every modification to the text, ie the choice to
      -- use luasnip
      { 'L3MON4D3/LuaSnip', tag = 'v2.4.0' },
      { 'saadparwaiz1/cmp_luasnip', commit = '98d9cb5' },

      -- TODO: add custom snippets
      { 'sage-etcher/friendly-snippets', commit = 'de8fce9' },
    },
    config = function()

      -- snippet setup
      local luasnip = require('luasnip')
      luasnip_from_vscode = require('luasnip.loaders.from_vscode')
      luasnip_from_vscode.lazy_load()

      -- autocomplete setup
      local cmp = require('cmp')
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
        })
      })

      -- lsp setup
      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      lspconfig.clangd.setup({
        capabilities = capabilities,
      })
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
