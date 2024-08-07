-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: hthttps://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.luatps://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

opt.clipboard = {}
opt.clipboard = {}
opt.clipboard = {}

opt.ttimeoutlen = 10

opt.title = true
opt.scrolloff = 10

vim.g.lazyvim_ruby_lsp = "solargraph"

vim.diagnostic.config({
  virtual_text = false,
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
