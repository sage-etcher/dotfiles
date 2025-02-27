
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
clangtidy.cmd = 'clang-tidy'
clangtidy.args = {
  '--quiet'
  --'--checks='..
    -- only do what we tell you to do
    -- '-*,'..
    -- enable group checks
    -- 'bugprone-*,'..
    -- 'cert-*,'..
    -- 'clang-analyzer-core.*,'..
    -- 'clang-analyzer-nullability.*,'..
    -- 'clang-analyzer-optin.*,'..
    -- 'clang-analyzer-security.*,'..
    -- 'clang-analyzer-unix.*,'..
    -- 'clang-analyzer-deadcode.*,'..
    -- 'concurrency-*,'..
    -- 'misc-*,'..
    -- 'modernize-*,'..
    -- 'performance-*,'..
    -- 'portability-*,'..
    -- 'readability-*,'..
    -- -- enable single checks
    -- 'cppcoreguidelines-avoid-goto,'..
    -- 'cppcoreguidelines-avoid-non-const-global-variables,'..
    -- 'cppcoreguidelines-init-variables,'..
    -- -- disable single checks
    -- '-misc-include-cleaner,'..
    -- '-misc-unused-parameters,'..
    -- '-readability-redundant-control-flow'
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
