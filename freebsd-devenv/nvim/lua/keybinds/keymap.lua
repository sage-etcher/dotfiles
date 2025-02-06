-- import
require('utils')

local cmp = require('cmp')
local trouble = require('trouble')
local tmux = require('tmux')
local ts_builtin = require('telescope.builtin')

-- leader config
vim.g.mapleader = ','

-- cmp and vsnip
local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

local opts = {}

keymap({'i', 's'}, '<C-j>', function()
  if cmp.visible() then
    cmp.select_next_item()
  elseif vim.fn['vsnip#available'](1) == 1 then
    feedkey('<Plug>(vsnip-expand-or-jump)', '')
  elseif has_words_before() then
    cmp.complete()
  end
end, opts)

keymap({'i', 's'}, '<C-k>', function()
  if cmp.visible() then
    cmp.select_prev_item()
  elseif vim.fn['vsnip#available'](-1) == 1 then
    feedkey('<Plug>(vsnip-jump-prev)', '')
  end
end, opts)

keymap('i', '<C-e>', cmp.abort, opts)

keymap('i', '<Tab>', function() 
  if cmp.visible() then 
    cmp.confirm({ select = true }) 
  else
    fallback('<Tab>')
  end
end, opts)


-- lsp
local opts = {}
keymap('n', 'K', lsp.buf.hover, opts)
keymap('n', 'gd', lsp.buf.definition, opts)
keymap('n', 'gD', lsp.buf.declaration, opts)
keymap('n', 'gi', lsp.buf.implementation, opts)
keymap('n', 'go', lsp.buf.type_definition, opts)
keymap('n', 'gr', lsp.buf.references, opts)
keymap('n', 'gs', lsp.buf.signature_help, opts)
keymap('n', '<F2>', lsp.buf.rename, opts)
keymap('n', '<F5>', function() lsp.buf.rename('g_'..vim.fn.expand('<cword>')) end, opts) 

-- formatter
local opts = {}
keymap('n', '<F3>', ':Format', opts)


-- trouble
local opts = { silent = true }
keymap('n', '<leader>xx', function()
  -- will throw error string on closing, ie silent
  trouble.focus(trouble.toggle('diagnostics'))
end, opts)


-- telescope
local opts = {}
keymap('n', '<leader>ff', ts_builtin.find_files, opts)
keymap('n', '<leader>fg', ts_builtin.live_grep, opts)
keymap('n', '<leader>fb', ts_builtin.buffers, opts)


-- tmux integration
local opts = {}
keymap('n', '<M-h>', tmux.move_left, opts)
keymap('n', '<M-j>', tmux.move_bottom, opts)
keymap('n', '<M-k>', tmux.move_top, opts)
keymap('n', '<M-l>', tmux.move_right, opts)

keymap('n', '<C-h>', tmux.resize_left, opts)
keymap('n', '<C-j>', tmux.resize_bottom, opts)
keymap('n', '<C-k>', tmux.resize_top, opts)
keymap('n', '<C-l>', tmux.resize_right, opts)


-- end of file
