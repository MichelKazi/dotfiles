return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "haydenmeade/neotest-jest",
      "olimorris/neotest-rspec",
    },
    opts = function(_, opts)
      opts.adapters = {
        require("neotest-jest")({
          jestCommand = "npm run test:nocoverage --",
          jestConfigFile = function()
            local file = vim.fn.expand("%:p")
            if string.find(file, "/packages/") then
              return string.match(file, "(.-/[^/]+/)src") .. "jest.config.js"
            end

            return vim.fn.getcwd() .. "/jest.config.js"
          end,
          env = { CI = true },
          cwd = function()
            local file = vim.fn.expand("%:p")
            if string.find(file, "/packages/") then
              return string.match(file, "(.-/[^/]+/)src")
            end
            return vim.fn.getcwd()
          end,
        }),
        require("neotest-rspec"),
      }
    end,
  },
}
