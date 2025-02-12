local wezterm = require("wezterm")

return {
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
