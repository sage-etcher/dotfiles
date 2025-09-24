
return {
  'nvim-treesitter/nvim-treesitter',
  tag = 'v0.8.0',
  run = ':TSUpdate',
  opts = {
    ensure_installed = {
      'lua', 'vim', 'vimdoc', 'query',
      'c', 'python', 'bash', 'go', 'disassembly',
      'cmake', 'make', 
      'markdown', 'markdown_inline',
      'yaml', 'toml', 'json',
      'git_config', 'git_rebase', 'gitattributes', 'gitcommit', 'gitignore', 'diff',
    },
    sync_install = true,
    auto_install = false,

    highlight = {
      enable = true,
      disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100kb
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
    },

    additional_vim_regex_highlighting = true,
  },
}
