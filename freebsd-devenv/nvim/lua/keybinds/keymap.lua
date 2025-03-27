-- import
require('keybinds.c_keymap')

require('lsp.toggle')
local cmp = require('cmp')
local trouble = require('trouble')
local tmux = require('tmux')
local ts_builtin = require('telescope.builtin')

-- leader config
vim.g.mapleader = ','

-- keymap
c_keyset({
  -- cmp nad vsnip
  ["<C-j>"] = {
    mode = { "i", "s" },
    map = {
      {
        cond   = cmp.visible,
        action = cmp.select_next_item
      },
      {
        cond = function()
          return vim.fn['vsnip#available'](1) == 1
        end,
        action = plug_action("vsnip-expand-or-jump"),
      },
    },
  },

  ["<C-k>"] = {
    mode = { "i", "s" },
    map = {
      {
        cond   = cmp.visible,
        action = cmp.select_prev_item,
      },
      {
        cond = function()
          return vim.fn['vsnip#available'](-1) == 1
        end,
        action = plug_action("vsnip-jump-prev"),
      },
    },
  },

  ["<C-e>"] = imap(cmp.abort),

  ["<Tab>"] = {
    mode = { "i" },
    map = {
      cond   = cmp.visible,
      action = function()
        cmp.confirm({ select = true })
      end,
      fallback = true,
    },
  },

  ["<CR>"] = {
    mode = { "i" },
    map = {
      action = cmp.abort,
      always_fallback = true,
    }
  },

  -- lsp options
  ["K"]    = nmap(lsp.buf.hover),
  ["gD"]   = nmap(lsp.buf.declaration),
  ["gd"]   = nmap(lsp.buf.definition),
  ["gi"]   = nmap(lsp.bufimplementation),
  ["go"]   = nmap(lsp.buf.type_definition),
  ["gr"]   = nmap(lsp.buf.references),
  ["gs"]   = nmap(lsp.buf.signature_help),
  ["<F2>"] = map_all(lsp.buf.rename),
  ["<F5>"] = map_all(function()
    lsp.buf.rename('g_'..vim.fn.expand('<cword>'))
  end),
  ["<leader>tl"] = nmap(toggle_lsp),

  -- Formatter
  ["<F3>"] = map_all(cmd_action(":Format")),

  -- Trouble
  ["<leader>xx"] = nmap(function()
    trouble.focus(trouble.toggle('diagnostics'))
  end),
  
  -- Telescope
  ["<leader>ff"] = nmap(ts_builtin.find_files),
  ["<leader>fg"] = nmap(ts_builtin.live_grep),
  ["<leader>fb"] = nmap(ts_builtin.buffers),
 
  -- tmux
  ['<M-h>'] = map_all(tmux.move_left),
  ['<M-j>'] = map_all(tmux.move_down),
  ['<M-k>'] = map_all(tmux.move_up),
  ['<M-l>'] = map_all(tmux.move_right),

  ['<M-S-h>'] = map_all(tmux.resize_left),
  ['<M-S-j>'] = map_all(tmux.resize_down),
  ['<M-S-k>'] = map_all(tmux.resize_up),
  ['<M-S-l>'] = map_all(tmux.resize_right),

})


-- end of file
