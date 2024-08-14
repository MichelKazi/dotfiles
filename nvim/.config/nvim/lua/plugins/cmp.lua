return {
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-vsnip" },
      { "onsails/lspkind.nvim" },
      { "hrsh7th/vim-vsnip" },
    },
    opts = function()
      local luasnip = require("luasnip")
      local cmp = require("cmp")
      local lspkind = require("lspkind")
      local conf = {
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          -- { name = "vsnip" },
          { name = "treesitter" },
        },
        snippet = {
          expand = function(args)
            -- Comes from vsnip
            -- fn["vsnip#anonymous"](args.body)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
              cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- this way you will only jump inside the snippet region
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            elseif cmp.has_words_before then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
          -- None of this made sense to me when first looking into this since there
          -- is no vim docs, but you can't have select = true here _unless_ you are
          -- also using the snippet stuff. So keep in mind that if you remove
          -- snippets you need to remove this select
          ["<CR>"] = cmp.mapping.confirm({ select = true }),

          ["<C-Space>"] = cmp.mapping(function(fallback)
            if cmp.visible_docs then
              cmp.close_docs()
            elseif not cmp.visible_docs then
              cmp.open_docs()
            else
              fallback()
            end
          end),
        }),
        formatting = {
          format = lspkind.cmp_format({
            maxwidth = function()
              return math.floor(0.45 * vim.o.columns)
            end,
            ellipsis_char = "...",
            show_labelDetails = true, -- show labelDetails in menu. Disabled by default
          }),
          expandable_indicator = true,
          fields = { "abbr", "kind", "menu" },
        },
      }
      return conf
    end,
  },
}
