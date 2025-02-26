
local tsc = require('nvim-treesitter.configs')

tsc.setup({
  ensure_installed = {
    "lua", "vim", "vimdoc", "query", 
    "c", "python", "bash", "go", "disassembly",
    "cmake", "make",
    "markdown", "markdown_inline", 
    "yaml", "toml", "json",
    "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore", "diff"
  },
  sync_install = true,
  auto_install = false,

  highlight = {
    enable = true,

    disabe = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,

    additional_vim_regex_highlighting = true,
  },

})

