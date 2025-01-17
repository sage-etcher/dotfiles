
local formatter = require('formatter')
local util = require('formatter.util')

formatter.setup({
  filetype = {
    c = {
      function()
        return {
          exe = 'astyle',
          args = {
            '--mode=c',
            '--project=./.astylerc'
          },
          stdin = true,
        }
      end
    }
  }
})


