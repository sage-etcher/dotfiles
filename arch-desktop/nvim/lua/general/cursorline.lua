

local acmd = vim.api.nvim_create_autocmd

-- initial window
vim.o.cursorline = true

-- if any other windows are opened, only set cursorline to the active window.
acmd({ 'WinEnter' }, 
     { pattern = '*',
       command = 'setlocal cursorline' })

acmd({ 'WinLeave' }, 
     { pattern = '*',
       command = 'setlocal nocursorline' })

-- end of file
