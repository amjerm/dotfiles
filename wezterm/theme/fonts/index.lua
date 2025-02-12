local wezterm = require("wezterm")
local list = require("theme/fonts/list")

return {
	config = {
		font = wezterm.font_with_fallback(list),
		font_size = 20,
	},
}
