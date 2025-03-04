
vim.opt.background = "dark"
vim.cmd("colorscheme oxocarbon")

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

term = os.getenv("TERM")
if term == "xterm" then
  vim.cmd("colorscheme vim")
end

-- end of file
