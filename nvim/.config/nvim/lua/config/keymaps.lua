-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local Util = require("lazyvim.util")

local map = Util.safe_keymap_set

map("n", "<esc><esc>", function()
  require("notify").dismiss({ silent = true, pending = true })
end, { desc = "Redraw / clear hlsearch / diff update" })

map("n", "<C-n>", function()
  require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
end, { desc = "Toggle tree (cwd)" })

map("n", "<C-e>", function()
  require("neo-tree.command").execute({ toggle = true, dir = Util.root() })
end, { desc = "Toggle tree (cwd)" })

-- Cut (delete) and copy to system clipboard
map("n", "<leader>d", '"+d')
map("v", "<leader>d", '"+d')
map("n", "<leader>D", '"+D')

-- Change and copy to system clipboard
map("n", "<leader>c", '"+c')
map("v", "<leader>c", '"+c')
map("n", "<leader>C", '"+C')

-- Yank to system clipboard
map("n", "<leader>y", '"+y')
map("v", "<leader>y", '"+y')
map("n", "<leader>Y", '"+Y')
map("n", "<C-y>", function()
  vim.cmd("let @+ = expand('%p')")
end)
--
-- Yank to system clipboard
map("n", "<leader>p", '"+p')
map("v", "<leader>p", '"+p')
map("n", "<leader>P", '"+P')

-- map("n", "<C-h>", function()
--   tmux.NvimTmuxNavigateLeft()
-- end)
--
-- map("n", "<C-j>", function()
--   tmux.NvimTmuxNavigateDown()
-- end)
--
-- map("n", "<C-k>", function()
--   tmux.NvimTmuxNavigateUp()
-- end)
--
-- map("n", "<C-l>", function()
--   tmux.NvimTmuxNavigateRight()
-- end)

map("n", "<leader>tl", function()
  require("neotest").run.run_last()
end, { desc = "Run last test" })

map("n", "<leader>tw", function() end, { desc = "Run and watch tests" })
