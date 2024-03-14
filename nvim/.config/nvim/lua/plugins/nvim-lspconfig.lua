return {
  "neovim/nvim-lspconfig",
  init = function()
    require("lazyvim.util").lsp.on_attach(function(_, buffer)
      vim.api.nvim_create_autocmd("CursorHold", {
        buffer = buffer,
        callback = function()
          local opts = {
            focusable = false,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            border = "rounded",
            source = "always",
            prefix = " ",
            scope = "cursor",
          }
          vim.diagnostic.config({
            virtual_text = false,
          })
          vim.diagnostic.open_float(nil, opts)
        end,
      })
    end)
  end,
  opts = {
    servers = { eslint = {} },
    setup = {
      eslint = function()
        require("lazyvim.util").lsp.on_attach(function(client)
          if client.name == "eslint" then
            client.server_capabilities.documentFormattingProvider = true
          elseif client.name == "tsserver" then
            client.server_capabilities.documentFormattingProvider = false
          end
        end)
      end,
    },
  },
}
