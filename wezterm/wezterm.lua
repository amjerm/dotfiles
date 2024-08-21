local wezterm = require("wezterm")

local always_dark = true

local colors = {
	light = "Alabaster",
	dark = "Gotham (custom)",
	default = "nord",
}

function scheme_for_appearance(appearance)
	if always_dark == false and appearance:find("Light") then
		return colors.light
	elseif appearance:find("Dark") then
		local default_color = "nord"
		if colors.dark == "random" or colors.dark == "rand" then
			return require("functions/random_color_scheme").generate()
		elseif colors.dark == "default" or colors.dark == "def" then
			return default_color
		else
			return colors.dark
		end
	else
		return colors.default
	end
end

local color_scheme = colors.default

wezterm.on("window-config-reloaded", function(window)
	window:set_right_status(wezterm.format({
		{ Attribute = { Intensity = "Half" } },
		{ Text = color_scheme .. "    " },
	}))

	local overrides = window:get_config_overrides() or {}
	local appearance = window:get_appearance()
	local scheme = scheme_for_appearance(appearance)
	if overrides.color_scheme ~= scheme then
		overrides.color_scheme = scheme
		window:set_config_overrides(overrides)
	end
end)

local keys = {
	{
		key = "|",
		mods = "LEADER|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "-",
		mods = "LEADER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "x",
		mods = "LEADER",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	-- launch tmux session switching popup with cmd+j
	{
		key = "j",
		mods = "CMD",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = " ", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "t", mods = "SHIFT" }),
		}),
	},
}

-- color modifications
local modified_color_schemes = wezterm.color.get_builtin_schemes()

if color_scheme == "Gotham (custom)" then
	local modified_gotham = modified_color_schemes["Gotham (terminal.sexy)"]
	modified_gotham.brights[3] = "#26a183"
	modified_gotham.brights[1] = "#195465"
	modified_color_schemes["Gotham (custom)"] = modified_gotham
end

local config = {
	leader = { key = "w", mods = "ALT", timeout_milliseconds = 1000 },
	color_scheme = color_scheme,
	color_schemes = modified_color_schemes,
	font = wezterm.font_with_fallback({
		"Iosevka",
		"Iosevka Extended",
		"JetBrains Mono",
		"MonoLisa Custom",
		"Iosevka Term",
		"CaskaydiaCove Nerd Font Mono",
	}),
	keys = keys,
	initial_rows = 40,
	initial_cols = 105,
	window_padding = {
		left = "1cell",
		right = "1cell",
		top = 0,
		bottom = 0,
	},
	window_background_opacity = 0.9,
	font_size = 20
}

return config
