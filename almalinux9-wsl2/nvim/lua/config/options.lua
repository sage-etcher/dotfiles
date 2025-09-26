
-- disable perl
vim.g.loaded_perl_provider = false

-- disable python3
vim.g.loaded_python3_provider = false

-- disable node
vim.g.loaded_node_provider = false

-- disable ruby
vim.g.loaded_ruby_provider = false

-- set cursorline on current window
vim.o.cursorline = true
vim.api.nvim_create_autocmd({ 'WinEnter' }, { pattern = '*', command = 'setlocal cursorline' })
vim.api.nvim_create_autocmd({ 'WinLeave' }, { pattern = '*', command = 'setlocal nocursorline' })

-- custom keywords
vim.opt.iskeyword:append('-')

-- backup generation
vim.opt.swapfile = false
vim.opt.backup = false

-- signcolumn
vim.opt.signcolumn = 'yes'

-- line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- wrap
vim.opt.wrap = false

-- rulers
vim.opt.colorcolumn = '80,120'

-- visual whitespace
vim.o.list = true
vim.o.listchars = 'tab:» ,leadmultispace:••  ,trail:~'
--vim.o.listchars = 'tab:» ,space:•,leadmultispace:••  ,trail:~,eol:$'
--vim.o.listchars = 'tab:» ,space:•,leadmultispace:••  ,trail:~,eol:£'
--vim.o.listchars = 'tab:» ,space:•,leadmultispace:••  ,trail:~,eol:€'

-- dont touch my splits
vim.o.equalalways = false

-- true colour
vim.o.termguicolors = true


-- end of file 
