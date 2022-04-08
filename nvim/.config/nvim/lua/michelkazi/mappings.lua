local function map(mode, lhs, rhs)
    vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true })
end

-- comment.lua

-- # NORMAL mode

-- Linewise toggle current line using C-/
map('n', '<leader>cc', '<CMD>lua require("Comment.api").toggle_current_linewise()<CR>')
-- or with dot-repeat support
-- map('n', '<C-_>', '<CMD>lua require("Comment.api").call("toggle_current_linewise_op")<CR>g@$')

-- Blockwise toggle current line using C-\
map('n', '<C-\\>', '<CMD>lua require("Comment.api").toggle_current_blockwise()<CR>')
-- or with dot-repeat support
-- map('n', '<C-\\>', '<CMD>lua require("Comment.api").call("toggle_current_blockwise_op")<CR>g@$')

-- # VISUAL mode

-- Linewise toggle using C-/
map('x', '<leader>cc', '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')

-- Blockwise toggle using <leader>gb
map('x', '<leader>gb', '<ESC><CMD>lua require("Comment.api").toggle_blockwise_op(vim.fn.visualmode())<CR>')

-- nvimtree.lua
--
-- Open nvimtree
map('n', 'C-n', ':NvimTreeFindFileToggle<CR>')
