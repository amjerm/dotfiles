require("oil").setup({
	view_options = {
		show_hidden = true,
	},
	keymaps = {
		-- disabling as it interferes with window navigation keymap
		["<C-h>"] = false,
		["<C-s>"] = "actions.select_split",
		["<C-v>"] = "actions.select_vsplit",
	},
})
