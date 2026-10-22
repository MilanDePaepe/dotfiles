-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 80
config.initial_rows = 24

-- or, changing the font size and color scheme.
config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 16
config.color_scheme = "Github Dark (Gogh)"
-- config.color_scheme = "Kanagawa (Gogh)"

config.enable_tab_bar = false

-- Finally, return the configuration to wezterm:
return config
