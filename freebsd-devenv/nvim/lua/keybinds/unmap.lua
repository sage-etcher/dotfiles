
local keydel = vim.keymap.del

keydel('o', 'g%')  -- <Plug>(MatchitOperationBackward)  use '[%'
keydel('x', 'g%')  -- <Plug>(MatchitVisualBackward)     use '[%'
keydel('n', 'g%')  -- <Plug>(MatchitNormalBackward)     use '[%'

keydel('o', 'gc')  -- Comment textobject
keydel('x', 'gc')  -- toggle comment
keydel('n', 'gc')  -- toggle comment
keydel('n', 'gcc') -- toggle comment line

keydel('n', '<C-W><C-D>') -- show diagnostics under the cursor
keydel('n', '<C-W>d') -- show diagnostics under the cursor


-- end of file
