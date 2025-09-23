

local tmux = require('tmux')

tmux.setup({
  copy_sync = {
    redirect_to_clipboard = true,
    sync_clipboard = true
  },
  navigation = {
    enable_default_keybindings = false,
  },
  resize = {
    enable_default_keybindings = false,
    resize_step_x = 5,
    resize_step_y = 2,
  }
})

-- end of file
