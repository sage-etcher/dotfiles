
local trouble = require('trouble')

local t_diagnostics_toggle = function()
  local mode = 'diagnostics'

  local is_open = trouble.is_open(mode)

  if is_open then
    trouble.close(mode)
  else
    trouble.focus(trouble.open(mode))
  end

end

vim.keymap.set('n', '<leader>xx', t_diagnostics_toggle, { remap = true })


-- end of file
