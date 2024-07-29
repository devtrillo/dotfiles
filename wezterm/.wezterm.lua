local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.automatically_reload_config = true
config.font = wezterm.font("firacode Nerd Font")
config.font_size = 14

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.window_background_opacity = 0.95
config.macos_window_background_blur = 20

config.color_scheme = "Tokyo Night"

config.window_background_gradient = {
	colors = { "#24283b", "#1a1b26" },
	-- Specifices a Linear gradient starting in the top left corner.
	orientation = { Linear = { angle = 45.0 } },
}

return config
