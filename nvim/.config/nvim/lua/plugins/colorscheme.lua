-- {
-- --   "hardhackerlabs/theme-vim",
-- --   config = function()
-- --     vim.cmd.colorscheme("hardhacker")
-- --   end,
-- -- },
--
return {
  -- hard contrast and black bg for gruvbox colorscheme:
  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      require("gruvbox").setup({
        contrast = "hard",
        palette_overrides = {
          dark0_hard = "#0E0E0F",
        },
      })
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      color_overrides = {
        mocha = {
          base = "#000000",
          mantle = "#000000",
          crust = "#000000",
        },
      },
      transparent_background = true, -- disables setting the background color.
    },
  },
  {
    "navarasu/onedark.nvim",
    opts = {
      style = "deep",
      transparent = true,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
