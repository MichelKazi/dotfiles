local lspconfig = require("lspconfig")
local lspkind = require('lspkind')
local luasnip = require('luasnip')
local null_ls = require("null-ls")
local cmp = require("cmp")


local buf_map = function(bufnr, mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
        silent = true,
    })
end
local on_attach = function(client, bufnr)
    vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
    vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
    vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
    vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
    vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
    vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
    vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
    vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
    vim.cmd("command! LspDiagPrev lua vim.diagnostic.goto_prev()")
    vim.cmd("command! LspDiagNext lua vim.diagnostic.goto_next()")
    vim.cmd("command! LspDiagLine lua vim.diagnostic.open_float()")
    vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")
    buf_map(bufnr, "n", "gd", ":LspDef<CR>")
    buf_map(bufnr, "n", "gr", ":LspRename<CR>")
    buf_map(bufnr, "n", "gy", ":LspTypeDef<CR>")
    buf_map(bufnr, "n", "K", ":LspHover<CR>")
    buf_map(bufnr, "n", "[a", ":LspDiagPrev<CR>")
    buf_map(bufnr, "n", "]a", ":LspDiagNext<CR>")
    buf_map(bufnr, "n", "ga", ":LspCodeAction<CR>")
    buf_map(bufnr, "n", "<Leader>a", ":LspDiagLine<CR>")
    buf_map(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>")
    if client.resolved_capabilities.document_formatting then
        vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end
end
lspconfig.tsserver.setup({
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        local ts_utils = require("nvim-lsp-ts-utils")
        ts_utils.setup({})
        ts_utils.setup_client(client)
        buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
        buf_map(bufnr, "n", "gi", ":TSLspRenameFile<CR>")
        buf_map(bufnr, "n", "go", ":TSLspImportAll<CR>")
        on_attach(client, bufnr)
    end,
})
null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.formatting.prettier,
    },
    on_attach = on_attach,
})


vim.o.completeopt = 'menuone,noselect'

cmp.setup {
  formatting = {
    format = lspkind.cmp_format()
  },
  mapping = {
--    ['<C-p>'] = cmp.mapping.select_prev_item(),
--    ['<C-n>'] = cmp.mapping.select_next_item(),
--    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
--    ['<C-f>'] = cmp.mapping.scroll_docs(4),
--    ['<C-Space>'] = cmp.mapping.complete(),
--    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    -- use Tab and shift-Tab to navigate autocomplete menu
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  },
  snippet = {
    expand = function(args)
        luasnip.lsp_expand(args.body)
    end
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' }
  },
}

-- OLD CONF

-- local cmp = require('cmp')
-- local cmp_nvim_lsp = require('cmp_nvim_lsp')
-- local lspkind = require('lspkind')
-- local luasnip = require('luasnip')
-- local nvim_lsp = require('lspconfig')
-- local null_ls = require('null-ls')
-- --
-- -- Lspconfig
-- --

-- -- Use an on_attach function to only map the following keys after
-- -- the language server attaches to the current buffer
-- local on_attach  = function(client, bufnr)
    -- local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    -- -- Mappings
    -- local opts = { noremap=true, silent=true }

    -- -- See `:help vim.lsp.*` for documentation on any of the below functions
    -- buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    -- buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    -- buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    -- buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    -- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    -- buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    -- buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    -- buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    -- buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

    -- -- Disable Autoformat
    -- client.resolved_capabilities.document_formatting = false
    -- client.resolved_capabilities.document_range_formatting = false
-- end

-- -- nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

-- -- Use a loop t conveniently call 'setup' on multiple servers and
-- -- map buffer local keybindings when the language server attaches
-- local servers = { 'tsserver' }
-- for _, lsp in ipairs(servers) do
    -- nvim_lsp[lsp].setup {
        -- capabilities = capabilities,
        -- on_attach = on_attach,
        -- flags = {
            -- debounce_text_changes = 150,
        -- }
    -- }
-- end


-- --
-- -- Null-ls
-- --

-- -- null-ls is a general purpose language server that doesn't need
-- -- the same config as actual language servers like tsserver, so
-- -- setup is a little different.
-- null_ls.setup({
    -- sources = {
        -- -- prettierd is installed globally via npm
        -- null_ls.builtins.formatting.prettierd
    -- },
    -- on_attach = function(client, bufnr)
        -- -- Autoformat
        -- if client.resolved_capabilities.document_formatting then
           -- vim.cmd [[augroup Format]]
           -- vim.cmd [[autocmd! * <buffer>]]
           -- vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
           -- vim.cmd [[augroup END]]
        -- end
        -- -- call local on_attach
        -- return on_attach(client, bufnr)
    -- end
-- })


-- --
-- -- Nvim-cmp
-- --

-- -- Set completeopt to have a better completion experience
-- vim.o.completeopt = 'menuone,noselect'

-- cmp.setup {
  -- formatting = {
    -- format = lspkind.cmp_format()
  -- },
  -- mapping = {
-- --    ['<C-p>'] = cmp.mapping.select_prev_item(),
-- --    ['<C-n>'] = cmp.mapping.select_next_item(),
-- --    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
-- --    ['<C-f>'] = cmp.mapping.scroll_docs(4),
-- --    ['<C-Space>'] = cmp.mapping.complete(),
-- --    ['<C-e>'] = cmp.mapping.close(),
    -- ['<CR>'] = cmp.mapping.confirm {
      -- behavior = cmp.ConfirmBehavior.Replace,
      -- select = true,
    -- },
    -- -- use Tab and shift-Tab to navigate autocomplete menu
    -- ['<Tab>'] = function(fallback)
      -- if cmp.visible() then
        -- cmp.select_next_item()
      -- elseif luasnip.expand_or_jumpable() then
        -- luasnip.expand_or_jump()
      -- else
        -- fallback()
      -- end
    -- end,
    -- ['<S-Tab>'] = function(fallback)
      -- if cmp.visible() then
        -- cmp.select_prev_item()
      -- elseif luasnip.jumpable(-1) then
        -- luasnip.jump(-1)
      -- else
        -- fallback()
      -- end
    -- end,
  -- },
  -- snippet = {
    -- expand = function(args)
        -- luasnip.lsp_expand(args.body)
    -- end
  -- },
  -- sources = {
    -- { name = 'nvim_lsp' },
    -- { name = 'luasnip' }
  -- },
-- }


-- --
-- -- Diagnostics
-- --

-- -- Set diganostic sign icons
-- -- https://github.com/neovim/nvim-lspconfig/wiki/UI-customization#change-diagnostic-symbols-in-the-sign-column-gutter
-- local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
-- for type, icon in pairs(signs) do
    -- local hl = "DiagnosticSign" .. type
    -- vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
-- end
