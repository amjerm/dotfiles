local colors = require("theme/colors/index").config
local fonts = require("theme/fonts/index").config
local merge = require("functions/merge_tables").merge

local config = {
	initial_rows = 40,
	initial_cols = 105,
	window_padding = {
		left = "1cell",
		right = "1cell",
		top = 0,
		bottom = 0,
	},
	window_background_opacity = 1,
	color_scheme = "Shaman",
}

config = merge(colors, fonts)

return {
	config = config,
}
