local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-h>"] = "which_key",
				["<C-q>"] = "send_to_qflist",
				["<C-f>"] = "send_selected_to_qflist",
			},
			n = {
				["<C-h>"] = "which_key",
				["<C-q>"] = "send_to_qflist",
				["<C-f>"] = "send_selected_to_qflist",
			},
		},
	},
	pickers = {},
	extensions = {
		file_browser = {
			path = "%:p:h",
		},
	},
})

-- register extensions
require("telescope").load_extension("harpoon")
require("telescope").load_extension("dap")
