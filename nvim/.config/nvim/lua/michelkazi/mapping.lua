local vim = vim
local api = vim.api
local keymap = vim.keymap

keymap.set('n', '<Esc><Esc>', '<Esc>:nohlsearch<CR><Esc>')

keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
keymap.set('n', 'te', ':tabedit')
-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

keymap.set('n', '<leader>y', '"+y')
keymap.set('v', '<leader>y', '"+y')
keymap.set('n', '<leader>Y', '"+Y')
keymap.set('n', '<leader>yy', '"+yy')
keymap.set('n', '<leader>x', '"+x')
keymap.set('n', '<leader>d', '"+d')
keymap.set('n', '<leader>dd', '"+dd')
keymap.set('n', '<leader>p', '"+p')
keymap.set('v', '<leader>p', '"+p')
keymap.set('n', '<leader>P', '"+P')
-- Yabai configs

local direction_map = {
  west = "h",
  south = "j",
  north = "k",
  east = "l"
}

local function run_command(cmd)
  vim.cmd('!' .. cmd)
end

local function focus_or_yabai(direction)
  local prev = vim.api.nvim_get_current_win()

  vim.cmd("wincmd " .. direction_map[direction])

  if prev == vim.api.nvim_get_current_win() then
    --[[ os.execute("yabai -m window --focus " .. direction) ]]
    run_command("yabai -m window --focus " .. direction)
  end
end

keymap.set('n', '<C-h>', function() focus_or_yabai("west") end, { noremap = true, silent = true })
keymap.set('n', '<C-j>', function() focus_or_yabai("south") end, { noremap = true, silent = true })
keymap.set('n', '<C-k>', function() focus_or_yabai("north") end, { noremap = true, silent = true })
keymap.set('n', '<C-l>', function() focus_or_yabai("east") end, { noremap = true, silent = true })
