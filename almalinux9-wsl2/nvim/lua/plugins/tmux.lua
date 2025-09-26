
local all_modes = { 'n', 'v', 'x', 's', 'o', 'i', 'l', 'c', 't' }

return {
  {
    'aserowy/tmux.nvim',
    commit = '2c1c3be',
    opts = {
      navigation = {
        enable_default_keybindings = false,
      },
      resize = {
        enable_default_keybindings = false,
        resize_step_x = 5,
        resize_step_y = 2,
      }
    },
    keys = {
      { '<M-h>', '<cmd>lua require("tmux").move_left()<cr>',   mode = all_modes },
      { '<M-j>', '<cmd>lua require("tmux").move_bottom()<cr>', mode = all_modes },
      { '<M-k>', '<cmd>lua require("tmux").move_top()<cr>',    mode = all_modes },
      { '<M-l>', '<cmd>lua require("tmux").move_right()<cr>',  mode = all_modes },

      { '<M-S-h>', '<cmd>lua require("tmux").resize_left()<cr>',   mode = all_modes },
      { '<M-S-j>', '<cmd>lua require("tmux").resize_bottom()<cr>', mode = all_modes },
      { '<M-S-k>', '<cmd>lua require("tmux").resize_top()<cr>',    mode = all_modes },
      { '<M-S-l>', '<cmd>lua require("tmux").resize_right()<cr>',  mode = all_modes },
    }
  },
}
