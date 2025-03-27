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
    desc = "cmp|vsnip: select next item",
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
    desc = "cmp|vsnip: select previous item",
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

  ["<C-e>"] = imap(cmp.abort, "cmp: close cmp drowdown"),

  ["<Tab>"] = {
    mode = { "i" },
    desc = "cmp: autocomplete",
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
    desc = "cmp|vim: close cmp dropdown and send <CR>",
    map = {
      action = cmp.abort,
      always_fallback = true,
    }
  },

  -- lsp options
  ["K"]    = nmap(lsp.buf.hover,           "lsp: display hover details"),
  ["gD"]   = nmap(lsp.buf.declaration,     "lsp: goto declaration"),
  ["gd"]   = nmap(lsp.buf.definition,      "lsp: goto definition"),
  ["gi"]   = nmap(lsp.buf.implementation,  "lsp: goto implementaion"),
  ["go"]   = nmap(lsp.buf.type_definition, "lsp: goto type definition"),
  ["gr"]   = nmap(lsp.buf.references,      "lsp: show references"),
  ["gs"]   = nmap(lsp.buf.signature_help,  "lsp: show signature"),
  ["<F2>"] = map_all(lsp.buf.rename,       "lsp: rename item"),
  ["<F5>"] = map_all(function()
    lsp.buf.rename('g_'..vim.fn.expand('<cword>'))
  end, "lsp: append 'g_' to an item, marking it as global"),
  ["<leader>tl"] = nmap(toggle_lsp,        "lsp: toggle on/off"),

  -- Formatter
  ["<F3>"] = map_all(cmd_action(":Format"), "formatter: run on current buffer"),

  -- Trouble
  ["<leader>xx"] = nmap(function()
    trouble.focus(trouble.toggle('diagnostics'))
  end, "trouble: toggle issues pane"),
  
  -- Telescope
  ["<leader>ff"] = nmap(ts_builtin.find_files, "telescope: search by file"),
  ["<leader>fg"] = nmap(ts_builtin.live_grep,  "telescope: search by grep"),
  ["<leader>fb"] = nmap(ts_builtin.buffers,    "telescope: search by buffer"),
 
  -- tmux
  ['<M-h>'] = map_all(tmux.move_left,       "tmux: move left"),
  ['<M-j>'] = map_all(tmux.move_bottom,     "tmux: move down"),
  ['<M-k>'] = map_all(tmux.move_top,        "tmux: move up"),
  ['<M-l>'] = map_all(tmux.move_right,      "tmux: move right"),

  ['<M-S-h>'] = map_all(tmux.resize_left,   "tmux: resize left"),
  ['<M-S-j>'] = map_all(tmux.resize_bottom, "tmux: resize bottom"),
  ['<M-S-k>'] = map_all(tmux.resize_top,    "tmux: resize top"),
  ['<M-S-l>'] = map_all(tmux.resize_right,  "tmux: resize right"),

})


-- end of file
