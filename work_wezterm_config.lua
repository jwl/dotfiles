-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Appearance options
config.color_scheme = 'Gruvbox (Gogh)'
config.font = wezterm.font 'JetBrains Mono'
config.enable_tab_bar = false


-- and finally, return the configuration to wezterm
return config
