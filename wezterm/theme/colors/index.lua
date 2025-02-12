local get_modified_colors = require("functions/get_modified_colors").get

local color_scheme = "Shaman"
local color_schemes = get_modified_colors(color_scheme)

return {
	config = {
		color_scheme = color_scheme,
		color_schemes = color_schemes,
	},
}
