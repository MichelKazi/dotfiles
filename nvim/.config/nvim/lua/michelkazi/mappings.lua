local function map(mode, lhs, rhs)
    vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true })
end

-- comment.lua

-- Linewise toggle current line using C-/
map('n', '<leader>cc', '<CMD>lua require("Comment.api").toggle_current_linewise()<CR>')
-- Blockwise toggle current line using C-\
map('n', '<C-\\>', '<CMD>lua require("Comment.api").toggle_current_blockwise()<CR>')
-- Linewise toggle using C-/
map('x', '<leader>cc', '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')
-- Blockwise toggle using <leader>gb
map('x', '<leader>gb', '<ESC><CMD>lua require("Comment.api").toggle_blockwise_op(vim.fn.visualmode())<CR>')

-- nvimtree.lua
-- Open nvimtree
-- map('n', '<C-n>', '<CMD>:NvimTreeFindFileToggle<CR>')
map('n', '<C-n>', '<CMD>:NeoTreeRevealToggle<CR>')

-- Telescope
map('n', '<leader>f', "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>")
map('n', '<c-f>', "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>")
map('n', "<c-t>", "<cmd>Telescope live_grep<cr>")
map('n', "<c-y>", "<cmd>Telescope grep_string<cr>")


-- Navigate tabs
map("n", "<S-l>", ":tabnext<CR>")
map("n", "<S-h>", ":tabprevious<CR>")

-- Move text up and down
map("n", "<S-j>", "<Esc>:m .+1<CR>==")
map("n", "<S-k>", "<Esc>:m .-2<CR>==")

-- Move text up and down
map("v", "<S-j>", ":m .+1<CR>==")
map("v", "<S-k>", ":m .-2<CR>==")
map("v", "p", '"_dP')

-- Visual Block --
-- Move text up and down
map("x", "J", ":move '>+1<CR>gv-gv")
map("x", "K", ":move '<-2<CR>gv-gv")
map("x", "<S-j>", ":move '>+1<CR>gv-gv")
map("x", "<S-k>", ":move '<-2<CR>gv-gv")
