-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
local action = wezterm.action

-- Appearance options
-- config.color_scheme = 'Gruvbox (Gogh)'
config.color_scheme = 'Gruvbox light, hard (base16)'
-- config.font = wezterm.font 'JetBrains Mono'
config.font = wezterm.font {
  family = 'JetBrains Mono',
  weight = 'Medium',
}
config.enable_tab_bar = false


-- and finally, return the configuration to wezterm
return config
