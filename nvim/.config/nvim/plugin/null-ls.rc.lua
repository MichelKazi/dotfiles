local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  })
end

vim.api.nvim_create_user_command(
  'DisableLspFormatting',
  function()
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
  end,
  { nargs = 0 }
)

null_ls.setup {
  sources = {
    null_ls.builtins.diagnostics.fish,
    null_ls.builtins.terraform_fmt,
    null_ls.builtins.diagnostics.eslint_d.with({
      prefer_local = "node_modules/.bin",
    }),
    null_ls.builtins.code_actions.eslint_d.with({
      prefer_local = "node_modules/.bin",
    }),
    null_ls.builtins.formatting.prettier.with({
      filetypes = {
        "javascriptreact", "javascript", "typescript", "typescriptreact", "css", "scss", "html", "json", "markdown",
        "graphql", "md", "txt",
      }
    }),
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          lsp_formatting(bufnr)
        end,
      })
    end
    if vim.bo.filetype == "yaml" then
      vim.api.DisableLspFormatting({})
    end
  end
}
