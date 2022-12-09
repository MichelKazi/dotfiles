local wt = require("wezterm")

return {
  enable_tab_bar = false,
  color_scheme_dirs = { "/Users/michel.kazi/.config/wezterm" },
  color_scheme = "tokyonight",
  font = wt.font("FiraCode Nerd Font"),
  font_rules = {
    {
      intensity = "Bold",
      font = wt.font("FiraCode Nerd Font", { weight = "Bold" }),
    },
    {
      italic = true,
      font = wt.font("VictorMono Nerd Font", { weight = "DemiLight" }),
    },
    {
      italic = true,
      intensity = "Bold",
      font = wt.font("VictorMono Nerd Font", { weight = "DemiBold" }),
    },
  },
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  }
}
