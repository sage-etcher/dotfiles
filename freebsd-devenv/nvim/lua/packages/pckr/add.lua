
local cmd = require('pckr.loader.cmd')
local keys = require('pckr.loader.keys')

require('pckr').add({


  -- utility
  { 'FotiadisM/tabset.nvim',
    config = function() require('config.tabset') end,
  };


  -- file manager/previewer
  { 'nvim-telescope/telescope.nvim',
    config = function() require('config.telescope') end,
    requires = {
      { 'nvim-lua/plenary.nvim' };
    }
  };

  -- code intellegence
  -- language server
  -- initialized in root init.lua

  -- autocompletion engine
  { 'hrsh7th/nvim-cmp',
    config = function() require('config.cmp') end,
    requires = {
      { 'hrsh7th/cmp-nvim-lsp' }; --{ 'hrsh7th/cmp-buffer' };
      --{ 'hrsh7th/path' };
      --{ 'hrsh7th/cmdline' };

      -- snippet engine
      { 'hrsh7th/cmp-vsnip' };
      { 'hrsh7th/vim-vsnip',
        config = function() require('config.vsnip') end,
        requires = {
          -- snippet list
          { 'sage-etcher/friendly-snippets' };
        },
      };
    },
  };

  -- signatures are lovely, coc is a dream, rest in peice :c
  { 'ray-x/lsp_signature.nvim',
    config = function() require('config.lsp_signature') end,
  };

  -- linter
  { 'mfussenegger/nvim-lint',
    config = function() require('config.nvim_lint') end,
  };

  -- formatters
  { 'mhartington/formatter.nvim',
    config = function() require('config.formatter') end,
  };

  -- better error view
  { 'folke/trouble.nvim',
    config = function() require('config.trouble') end,
  };

  -- pretty
  --{ 'nvim-treesitter/nvim-treesitter',
  --  config = function() require('config.treesitter') end,
  --  run = ':TSUpdate',
  --};

  { 'sage-etcher/vim-i8080-syntax' };
  
  { 'sage-etcher/vim-plm-syntax' };

  { 'nvim-tree/nvim-web-devicons',
    config = function() require('config.nvim_web_devicons') end,
  };

  { 'nvim-lualine/lualine.nvim',
    config = function() require('config.lualine') end,
  };

  { 'nyoom-engineering/oxocarbon.nvim',
    config = function() require('config.oxocarbon') end,
  };

  -- tmux integration
  { 'aserowy/tmux.nvim',
    config = function() require('config.tmux') end,
  };


  -- mild git integration
  { 'airblade/vim-gitgutter',
    config = function() require('config.gitgutter') end,
  };

  -- discord rich presence
  -- { 'andweeb/presence.nvim' };

})

-- end of file
