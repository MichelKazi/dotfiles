local status, autopairs = pcall(require, "nvim-autopairs")
if (not status) then return end

autopairs.setup({
  disable_filetype = { "TelescopePrompt", "guihua", "guihua_rust", "clap_input" },
})

if vim.o.ft == 'clap_input' and vim.o.ft == 'guihua' and vim.o.ft == 'guihua_rust' then
  require 'cmp'.setup.buffer { completion = { enable = false } }
end
