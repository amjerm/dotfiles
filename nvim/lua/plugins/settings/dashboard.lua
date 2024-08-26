local header = {
	[[]],
	[[]],
	[[________________________________________________________________________________________________        ]],
	[[ __________________________________________/\\\__________________________________________________       ]],
	[[  _________________________________________\///___________________________________________________      ]],
	[[   __/\\\\\\\\\_______/\\\\\__/\\\\\_________/\\\_____/\\\\\\\\___/\\/\\\\\\\_____/\\\\\__/\\\\\___     ]],
	[[    _\////////\\\____/\\\///\\\\\///\\\______\/\\\___/\\\/////\\\_\/\\\/////\\\__/\\\///\\\\\///\\\_    ]],
	[[     ___/\\\\\\\\\\__\/\\\_\//\\\__\/\\\______\/\\\__/\\\\\\\\\\\__\/\\\___\///__\/\\\_\//\\\__\/\\\_   ]],
	[[      __/\\\/////\\\__\/\\\__\/\\\__\/\\\__/\\_\/\\\_\//\\///////___\/\\\_________\/\\\__\/\\\__\/\\\_  ]],
	[[       _\//\\\\\\\\/\\_\/\\\__\/\\\__\/\\\_\//\\\\\\___\//\\\\\\\\\\_\/\\\_________\/\\\__\/\\\__\/\\\_ ]],
	[[        __\////////\//__\///___\///___\///___\//////_____\//////////__\///__________\///___\///___\///__]],
	[[]],
	[[ˌnioʊˈvɪm]],
	[[]],
}

local operations = {
	{
		icon = "󰥨  ",
		desc = "Find files",
		group = "Directory",
		key = "f",
		action = "Telescope find_files",
	},
	-- {
	-- 	icon = "󱏒  ",
	-- 	desc = "nnn",
	-- 	key = "n",
	-- 	action = "NnnPicker",
	-- },
	-- {
	-- 	icon = "  ",
	-- 	desc = "Oil",
	-- 	key = "o",
	-- 	action = "Oil",
	-- },
	{
		icon = "󰭎  ",
		desc = "Telescope",
		group = "Directory",
		key = "t",
		action = "Telescope",
	},
	-- {
	-- 	icon = "  ",
	-- 	desc = "Marks (Harpoon)",
	-- 	key = "m",
	-- 	action = "require('harpoon.ui').toggle_quick_menu()",
	-- },
	-- {
	-- 	icon = "  ",
	-- 	desc = "Git changed files",
	-- 	key = "g",
	-- 	action = "Telescope git_status",
	-- },
	{
		icon = "󱊈  ",
		desc = "Mason",
		group = "Directory",
		key = "m",
		action = "Mason",
	},
	{
		icon = "  ",
		desc = "TSUpdate",
		group = "Directory",
		key = "l",
		action = "TSUpdate",
	},
	{
		icon = "  ",
		desc = "Lazy sync",
		group = "Directory",
		key = "p",
		action = "Lazy sync",
	},
	{
		icon = "󰿶  ",
		desc = "Check health",
		group = "Directory",
		key = "h",
		action = "checkhealth",
	},
	-- {
	-- 	icon = "  ",
	-- 	desc = "Empty buffer",
	-- 	key = "e",
	-- 	action = "enew",
	-- },
	{
		icon = "  ",
		desc = "Quit",
		group = "Directory",
		key = "q",
		action = "q",
	},
}

local doom_config = {
	header = header,
	center = operations,
	footer = {}, --your footer
}

local hyper_config = {
	week_header = {
		enable = true,
	},
	project = {
		enable = false,
	},
	mru = {
		cwd_only = true,
	},
	shortcut = operations,
}

require("dashboard").setup({
	theme = "hyper",
	config = hyper_config,
	event = "VimEnter",
})
