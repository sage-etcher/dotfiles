-- import
local cmp = require('cmp')
local trouble = require('trouble')
local ts_builtin = require('telescope.builtin')

-- leader config
vim.g.mapleader = ','

-- vim shorthand
local keymap = vim.keymap.set
local feedkeys = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end
local handle_expandtab = function(text)
  if vim.o.expandtab == true then
    local tab = '<Tab>'

    local _,col = unpack(vim.api.nvim_win_get_cursor(0))
    local n = vim.o.tabstop - (col % vim.o.tabstop)
    local spaces = string.rep('<Space>', n)

    local new_text = string.gsub(text, tab, spaces) 

    return new_text 
  end
  return text
end
local fallback = function(text)
  print(text)
  local vim_text = vim.api.nvim_replace_termcodes(handle_expandtab(text), true, true, true)
  vim.api.nvim_put({ vim_text }, 'c', false, true)
end


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
keymap('n', 'K', vim.lsp.buf.hover, opts)
keymap('n', 'gd', vim.lsp.buf.definition, opts)
keymap('n', 'gD', vim.lsp.buf.declaration, opts)
keymap('n', 'gi', vim.lsp.buf.implementation, opts)
keymap('n', 'go', vim.lsp.buf.type_definition, opts)
keymap('n', 'gr', vim.lsp.buf.references, opts)
keymap('n', 'gs', vim.lsp.buf.signature_help, opts)
keymap('n', '<F2>', vim.lsp.buf.rename, opts)

-- formatter
local opts = {}
keymap('n', '<F3>', ':Format', opts)


-- trouble
local opts = { silent = true }
vim.keymap.set('n', '<leader>xx', function()
  -- will throw error string on closing, ie silent
  trouble.focus(trouble.toggle('diagnostics'))
end, opts)


-- telescope
local opts = {}
keymap('n', '<leader>ff', ts_builtin.find_files, opts)
keymap('n', '<leader>fg', ts_builtin.live_grep, opts)
keymap('n', '<leader>fb', ts_builtin.buffers, opts)


-- end of file
