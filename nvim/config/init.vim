
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"

" General Settings
source $CONFIG_DIR/nvim/vim-plug/plugins.vim
source $CONFIG_DIR/nvim/general/settings.vim
source $CONIFG_DIR/nvim/general/tabs.vim
source $CONFIG_DIR/nvim/keys/mappings.vim

source $CONFIG_DIR/nvim/themes/palenight.vim
"source $CONFIG_DIR/nvim/themes/transparent.vim

source $CONFIG_DIR/nvim/plug-config/coc.vim
source $CONFIG_DIR/nvim/plug-config/ale.vim
"source $CONFIG_DIR/nvim/plug-config/bufferline.lua
source $CONFIG_DIR/nvim/plug-config/lualine.lua
source $CONFIG_DIR/nvim/plug-config/telescope.vim
