local Util = require("lazyvim.util")
local map = Util.safe_keymap_set

local metals_lspconfig = {
  {
    "m00qek/baleia.nvim",
    version = "*",
    config = function()
      vim.g.baleia = require("baleia").setup({})

      -- Command to colorize the current buffer
      vim.api.nvim_create_user_command("BaleiaColorize", function()
        vim.g.baleia.once(vim.api.nvim_get_current_buf())
      end, { bang = true })

      vim.api.nvim_create_autocmd("FileType", {
        desc = "Force colorize on dap-repl",
        pattern = "dap-repl",
        group = vim.api.nvim_create_augroup("auto_colorize", { clear = true }),
        callback = function()
          vim.g.baleia.automatically(vim.api.nvim_get_current_buf())
        end,
      })

      -- Command to show logs
      vim.api.nvim_create_user_command("BaleiaLogs", vim.g.baleia.logger.show, { bang = true })
    end,
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function(self, opts)
      -- Debug settings if you're using nvim-dap
      local dap = require("dap")

      dap.listeners.after["event_terminated"]["nvim-metals"] = function()
        dap.repl.open()
      end

      dap.configurations.scala = {
        {
          type = "scala",
          request = "launch",
          name = "RunOrTest",
          metals = {
            runType = "runOrTestFile",
            --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
          },
        },
        {
          type = "scala",
          request = "launch",
          name = "Test Target",
          metals = {
            runType = "testTarget",
          },
        },
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "scalameta/nvim-metals",
      "nvim-lua/plenary.nvim",
      {
        "j-hui/fidget.nvim",
        opts = {},
      },
    },
    opts = {
      servers = {
        metals = {
          keys = {
            {
              "<leader>me",
              function()
                require("telescope").extensions.metals.commands()
              end,
              desc = "Metals commands",
            },
            {
              "gD",
              vim.lsp.buf.definition,
              desc = "Go to definition",
            },
            {
              "K",
              vim.lsp.buf.hover,
              desc = "Show hover",
            },
            {
              "gi",
              vim.lsp.buf.implementation,
              desc = "Go to implementation",
            },
            {
              "gr",
              vim.lsp.buf.references,
              desc = "Go to references",
            },
            {
              "gds",
              vim.lsp.buf.document_symbol,
              desc = "Go to document symbol",
            },
            {
              "gws",
              vim.lsp.buf.workspace_symbol,
              desc = "Go to workspace symbol",
            },
            {
              "<leader>cl",
              vim.lsp.codelens.run,
              desc = "Run codelens",
            },
            {
              "<leader>sh",
              vim.lsp.buf.signature_help,
              desc = "Show signature help",
            },
            {
              "<leader>rn",
              vim.lsp.buf.rename,
              desc = "Rename",
            },
            {
              "<leader>mf",
              vim.lsp.buf.format,
              desc = "Format with scalaFmt",
            },
            {
              "<leader>ca",
              vim.lsp.buf.code_action,
              desc = "Code action",
            },
            {
              "<leader>mcc",
              function()
                require("metals").compile_cascade()
              end,
              desc = "Metals compile cascade",
            },
            {
              "<leader>mcx",
              function()
                require("metals").compile_clean()
              end,
              desc = "Metals compile clean",
            },
            {
              "<leader>mr",
              function()
                require("metals").restart_metals()
              end,
              desc = "Restart Metals",
            },
            {
              "<leader>mss",
              function()
                require("metals").scan_sources()
              end,
              desc = "Scan sources",
            },
            {
              "<leader>mA",
              function()
                require("metals").new_scala_file()
              end,
              desc = "New Scala file",
            },
            {
              "<leader>ws",
              function()
                require("metals").hover_worksheet()
              end,
              desc = "Hover worksheet",
            },
            {
              "<leader>Da",
              vim.diagnostic.setqflist,
              desc = "All workspace diagnostics",
            },
            {
              "<leader>De",
              function()
                vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.E })
              end,
              desc = "All workspace errors",
            },
            {
              "<leader>Dw",
              function()
                vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.W })
              end,
              desc = "All workspace warnings",
            },
            {
              "<leader>D",
              vim.diagnostic.setloclist,
              desc = "Buffer diagnostics only",
            },
            {
              "Dn",
              function()
                vim.diagnostic.goto_prev({ wrap = false })
              end,
              desc = "Go to previous diagnostic",
            },
            {
              "]c",
              function()
                vim.diagnostic.goto_next({ wrap = false })
              end,
              desc = "Go to next diagnostic",
            },
            {
              "<leader>dc",
              function()
                require("dap").continue()
              end,
              desc = "Continue debugging",
            },
            {
              "<leader>dr",
              function()
                require("dap").repl.toggle()
              end,
              desc = "Toggle REPL",
            },
            {
              "<leader>dK",
              function()
                require("dap.ui.widgets").hover()
              end,
              desc = "Hover widget",
            },
            {
              "<leader>dt",
              function()
                require("dap").toggle_breakpoint()
              end,
              desc = "Toggle breakpoint",
            },
            {
              "<leader>dso",
              function()
                require("dap").step_over()
              end,
              desc = "Step over",
            },
            {
              "<leader>dsi",
              function()
                require("dap").step_into()
              end,
              desc = "Step into",
            },
            {
              "<leader>dl",
              function()
                require("dap").run_last()
              end,
              desc = "Run last",
            },
            {
              "<leader>md",
              function()
                local buf = vim.api.nvim_get_current_buf()
                local enabled = vim.diagnostic.is_enabled()
                vim.diagnostic.enable(not enabled, { bufnr = buf })
              end,
              desc = "Toggle diagnostics",
            },
          },
          init_options = {
            statusBarProvider = "off",
            disableColorOutput = false,
          },
          settings = {
            showImplicitArguments = true,
            excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
            javaHome = "/Users/mkazi/.sdkman/candidates/java/current",
            defaultBspToBuildTool = true,
          },
        },
      },
      setup = {
        metals = function(_, opts)
          local metals = require("metals")
          local metals_config = vim.tbl_deep_extend("force", metals.bare_config(), opts)
          metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()
          metals_config.on_attach = function(client, bufnr)
            if LazyVim.has("nvim-dap") then
              metals.setup_dap()
            end
          end

          local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
          vim.api.nvim_create_autocmd("FileType", {
            pattern = { "scala", "sbt", "thrift" },
            callback = function()
              vim.b.autoformat = false
              metals.initialize_or_attach(metals_config)
            end,
            group = nvim_metals_group,
          })
          return true
        end,
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {},
  },
}

return metals_lspconfig
