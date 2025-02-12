local wezterm = require("wezterm")

local get = function(color_scheme)
	local modified_color_schemes = wezterm.color.get_builtin_schemes()
	if color_scheme == "Gotham (custom)" then
		local modified_gotham = modified_color_schemes["Gotham (terminal.sexy)"]
		modified_gotham.brights[3] = "#26a183"
		modified_gotham.brights[1] = "#195465"
		modified_color_schemes["Gotham (custom)"] = modified_gotham
	end
end

return {
	get = get,
}
