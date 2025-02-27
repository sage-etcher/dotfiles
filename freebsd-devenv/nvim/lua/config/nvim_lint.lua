
require('utils')

local lint = require('lint')
local util = require('lint.util')

local lint_progress = function()
  local linters = lint.get_running()
  if #linters == 0 then
    return "none"
  end
  return "something "..table.concat(linters, ", ")
end

local clangtidy = lint.linters.clangtidy
clangtidy.cmd = 'clang-tidy17'
clangtidy.args = {
  '--quiet'
}

lint.linters_by_ft = {
  c = { 'clangtidy' },
}


autocmd('BufWritePost', {
  callback = function()
    -- try to lint, using the linters_by_ft defines
    lint.try_lint()
  end,
})
