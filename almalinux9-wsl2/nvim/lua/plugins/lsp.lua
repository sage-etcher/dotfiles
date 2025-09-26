
return {
  {
    'neovim/nvim-lspconfig',
    tag = 'v1.0.0',
    dependencies = {
      { 
        'hrsh7th/nvim-cmp',
        tag = 'v0.0.1',
        dependencies = {
          { 'hrsh7th/cmp-nvim-lsp', commit = '78924d1' },
          { 'hrsh7th/cmp-vsnip', commit = '989a8a7' },
          { 'hrsh7th/vim-vsnip', commit = '0a4b841' },
        },
        config = function()
          local cmp = require('cmp')

          cmp.setup({
            snippet = {
              expande = function(args)
                vim.fn["vsnip#anonymous"](args.body)
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
              { name = 'vsnip' },
            }, {
              { name = 'buffer' },
            })
          })
        end,
      },
    },
    config = function()
      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      lspconfig.clangd.setup({
        capabilities = capabilities,
      })
    end,
  },

  {
    'ray-x/lsp_signature.nvim',
    branch = 'neovim-0.6',
    opts = {
      bind = true,
      handler_opts = {
        border = 'none',
      },
    },
  },

}
