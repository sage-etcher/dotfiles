
lsp = vim.lsp
fs  = vim.fs
keymap = vim.keymap.set
autocmd  = vim.api.nvim_create_autocmd


feedkeys = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

handle_expandtab = function(text)
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

fallback = function(text)
  print(text)
  local vim_text = vim.api.nvim_replace_termcodes(handle_expandtab(text), true, true, true)
  vim.api.nvim_put({ vim_text }, 'c', false, true)
end

-- end of file
