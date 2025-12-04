
return {
  'lukas-reineke/indent-blankline.nvim',
  tag = 'v2.18.2',
  init = function()
    vim.cmd [[highlight IndentBlanklineChar guifg=#d0d0d0 gui=nocombine]]
    --vim.cmd [[highlight IndentBlanklineSpaceChar guifg=#00ff00 gui=nocombine]]
    --vim.cmd [[highlight IndentBlanklineSpaceCharBlankLine guifg=#00ffff gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineContextChar guifg=#f0aab0 gui=nocombine,bold ]]
  end,
  opts = {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
  },
}

-- end of file
