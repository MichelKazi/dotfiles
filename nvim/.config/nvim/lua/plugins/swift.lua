local swift = {
  "wojciech-kulik/xcodebuild.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "MunifTanjim/nui.nvim",
    "mfussenegger/nvim-dap",
  },
  config = function()
    require("xcodebuild").setup({
      code_coverage = {
        enabled = true,
      },
    })
    vim.keymap.set("n", "<leader>xl", "<cmd>XcodebuildToggleLogs<cr>", { desc = "Toggle Xcodebuild Logs" })
    vim.keymap.set("n", "<leader>xb", "<cmd>XcodebuildBuild<cr>", { desc = "Build Project" })
    vim.keymap.set("n", "<leader>xr", "<cmd>XcodebuildBuildRun<cr>", { desc = "Build & Run Project" })
    vim.keymap.set("n", "<leader>xt", "<cmd>XcodebuildTest<cr>", { desc = "Run Tests" })
    vim.keymap.set("n", "<leader>xT", "<cmd>XcodebuildTestClass<cr>", { desc = "Run This Test Class" })
    vim.keymap.set("n", "<leader>X", "<cmd>XcodebuildPicker<cr>", { desc = "Show All Xcodebuild Actions" })
    vim.keymap.set("n", "<leader>xd", "<cmd>XcodebuildSelectDevice<cr>", { desc = "Select Device" })
    vim.keymap.set("n", "<leader>xp", "<cmd>XcodebuildSelectTestPlan<cr>", { desc = "Select Test Plan" })
    vim.keymap.set("n", "<leader>xc", "<cmd>XcodebuildToggleCodeCoverage<cr>", { desc = "Toggle Code Coverage" })
    vim.keymap.set(
      "n",
      "<leader>xC",
      "<cmd>XcodebuildShowCodeCoverageReport<cr>",
      { desc = "Show Code Coverage Report" }
    )
    vim.keymap.set("n", "<leader>xq", "<cmd>Telescope quickfix<cr>", { desc = "Show QuickFix List" })

    local xcode_debug = require("xcodebuild.integrations.dap")
    local codelldbPath = os.getenv("HOME") .. "/.local/share/nvim/mason/bin/codelldb"

    xcode_debug.setup(codelldbPath)

    vim.keymap.set("n", "<leader>dd", xcode_debug.build_and_debug, { desc = "Build & Debug" })
    vim.keymap.set("n", "<leader>dr", xcode_debug.debug_without_build, { desc = "Debug Without Building" })
    vim.keymap.set("n", "<leader>dt", xcode_debug.debug_tests, { desc = "Debug Tests" })
    vim.keymap.set("n", "<leader>dT", xcode_debug.debug_class_tests, { desc = "Debug Class Tests" })
    vim.keymap.set("n", "<leader>b", xcode_debug.toggle_breakpoint, { desc = "Toggle Breakpoint" })
    vim.keymap.set("n", "<leader>B", xcode_debug.toggle_message_breakpoint, { desc = "Toggle Message Breakpoint" })
    vim.keymap.set("n", "<leader>dx", xcode_debug.terminate_session, { desc = "Terminate Debugger" })
  end,
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      servers = {
        sourcekit = {
          capabilities = {
            workspace = {
              didChangeWatchedFiles = {
                dynamicRegistration = true,
              },
            },
          },
        },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      events = { "BufReadPre", "BufNewFile" },
      linters_by_ft = {
        swift = { "swiftlint" },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      formatters_by_ft = {
        swift = { "swiftformat" },
      },
      log_level = vim.log.levels.ERROR,
    },
  },
}

return {}
