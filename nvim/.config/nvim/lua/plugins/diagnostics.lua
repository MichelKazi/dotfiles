return {
  "sontungexpt/better-diagnostic-virtual-text",
  event = "LspAttach",
  config = function(_)
    require("better-diagnostic-virtual-text").setup()
  end,
}
