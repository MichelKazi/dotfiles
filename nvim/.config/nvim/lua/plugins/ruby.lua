local nvim_lsp = require("lspconfig")
local ruby_config = {
  { "tpope/vim-rails" },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      servers = {
        ruby_lsp = {},
        solargraph = {
          cmd = { os.getenv("HOME") .. "/.rbenv/shims/solargraph", "stdio" },
          root_dir = nvim_lsp.util.root_pattern("Gemfile", ".git", "."),
          settings = {
            solargraph = {
              autoformat = true,
              completion = true,
              diagnostic = true,
              folding = true,
              references = true,
              rename = true,
              symbols = true,
            },
          },
        },
      },
    },
  },
}

return ruby_config
