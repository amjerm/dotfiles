local wezterm = require("wezterm")

local use_color = "Gotham (custom)"
local default_color_scheme = "nord"
local color_scheme

if use_color == "random" or use_color == "rand" then
	color_scheme = require("functions/random_color_scheme").generate()
elseif use_color == "default" or use_color == "def" then
	color_scheme = default_color_scheme
else
	color_scheme = use_color
end

wezterm.on("window-config-reloaded", function(window)
	window:set_right_status(wezterm.format({
		{ Attribute = { Intensity = "Half" } },
		{ Text = color_scheme .. "    " },
	}))
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
	leader = { key = "w", mods = "CTRL", timeout_milliseconds = 1000 },
	color_scheme = color_scheme,
	color_schemes = modified_color_schemes,
	font = wezterm.font_with_fallback({
		"Iosevka",
		"Iosevka Term",
		"MonoLisa Custom",
		"Iosevka Extended",
		"JetBrains Mono",
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
	font_size = 24,
}

return config
