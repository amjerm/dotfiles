local wezterm = require("wezterm")

local function update(window, color_scheme)
	window:set_right_status(wezterm.format({
		{ Attribute = { Intensity = "Half" } },
		{ Text = color_scheme .. "    " },
	}))

	local overrides = window:get_config_overrides() or {}
	local appearance = window:get_appearance()
	local scheme = require("functions/scheme_for_appearance").get(appearance)
	if overrides.color_scheme ~= scheme then
		overrides.color_scheme = scheme
		window:set_config_overrides(overrides)
	end
end

return {
	update = update,
}
