-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local Util = require("lazyvim.util")
local nav = require("nvim-tmux-navigation")

local map = Util.safe_keymap_set

map("n", "<esc><esc>", function()
  -- vim.cmd("<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>")
  require("notify").dismiss({ silent = true, pending = true })
end, { desc = "Redraw / clear hlsearch / diff update" })

map("n", "<C-n>", function()
  require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
end, { desc = "Toggle tree (cwd)" })

map("n", "<C-e>", function()
  require("neo-tree.command").execute({ toggle = true, dir = Util.root() })
end, { desc = "Toggle tree (cwd)" })

map("n", "C-h>", nav.NvimTmuxNavigateLeft, { desc = "Navigate left" })
map("n", "C-j>", nav.NvimTmuxNavigateDown, { desc = "Navigate down" })
map("n", "C-k>", nav.NvimTmuxNavigateUp, { desc = "Navigate up" })
map("n", "C-l>", nav.NvimTmuxNavigateRight, { desc = "Navigate right" })
