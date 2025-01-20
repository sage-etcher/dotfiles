
local executable = vim.fn.executable

if executable('clangd17') == 1 then
  vim.lsp.start({
    name = 'Clangd',

  })




lsp.clangd.setup({
  cmd = { 'clangd17' },
  single_file_support = true,

  capabilities = capabilities,
})

-- end of file
