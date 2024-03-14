-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local Util = require("lazyvim.util")
local tmux = require("nvim-tmux-navigation")
local neotest = require("neotest")

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

map("n", "<C-h>", function()
  tmux.NvimTmuxNavigateLeft()
end)

map("n", "<C-j>", function()
  tmux.NvimTmuxNavigateDown()
end)

map("n", "<C-k>", function()
  tmux.NvimTmuxNavigateUp()
end)

map("n", "<C-l>", function()
  tmux.NvimTmuxNavigateRight()
end)

map("n", "<leader>tl", function()
  require("neotest").run.run_last()
end, { desc = "Run last test" })

map("n", "<leader>tw", function() end, { desc = "Run and watch tests" })
