
return {
  {
    'mfussenegger/nvim-lint',
    commit = '27f44d1',
    config = function()
      lint = require('lint')

      -- define linter per language
      lint.lint_by_ft = {
        c = {'clang-tidy'},
      }

      -- try and start a linter
      vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
        callback = function()
          lint.try_lint()
        end,
      })

    end,
  },

}
