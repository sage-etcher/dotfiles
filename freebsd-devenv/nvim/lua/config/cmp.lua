

require('utils')

local cmp = require('cmp')

cmp.setup({
  enabled = function()
    local context = require('cmp.config.context')
    if vim.api.nvim_get_mode().mode == 'c' then
      return true
    else
      return not context.in_treesitter_capture('comment')
         and not context.in_syntax_group('Comment')
    end
  end,
  snippet = {
    -- REQUIRED
    expand = function(args)
      vim.fn['vsnip#anonymous'](args.body)
    end,
  },
  mapping = {}, -- set externally in 'keymaps/mapping.lua'
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
  })
})

-- end of file
