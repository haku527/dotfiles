local wezterm = require 'wezterm'

local config = wezterm.config_builder()


config.hide_tab_bar_if_only_one_tab = true

config.font = wezterm.font 'Maple Mono SC NF'

config.color_scheme = 'Everforest Light (Gogh)'

return config
