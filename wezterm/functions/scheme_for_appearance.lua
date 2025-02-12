local color_settings = require("theme/colors/settings")

local theme_pool = require("theme/colors/list")
local pick_random = require("functions/pick_random_item").pick

local function get(appearance)
	local always_dark = color_settings.always_dark
	local colors = color_settings.colors

	if always_dark == false and appearance:find("Light") then
		return colors.light
	elseif appearance:find("Dark") then
		if colors.dark == "random" or colors.dark == "rand" then
			return pick_random(theme_pool)
		elseif colors.dark == "default" or colors.dark == "def" then
			return colors.default
		else
			return colors.dark
		end
	else
		return colors.default
	end
end

return {
	get = get,
}
