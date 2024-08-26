local actions = require("telescope.actions")
local layout_actions = require("telescope.actions.layout")

require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-a>"] = "toggle_all",
				["<C-f>"] = "send_selected_to_qflist",
				["<C-h>"] = "which_key",
				["<C-q>"] = "send_to_qflist",
				["<C-y>"] = layout_actions.toggle_preview,
			},
			n = {
				["<C-a>"] = "toggle_all",
				["<C-d>"] = "delete_buffer",
				["<C-f>"] = "send_selected_to_qflist",
				["<C-h>"] = "which_key",
				["<C-q>"] = "send_to_qflist",
				["<C-y>"] = layout_actions.toggle_preview,
				["d"] = "delete_buffer",
				["x"] = "delete_buffer",
			},
		},
		preview = { hide_on_startup = true },
		path_display = {
			"filename_first",
		},
		sorting_strategy = "ascending",
		layout_config = {
			prompt_position = "top",
		},
	},
	pickers = {
		colorscheme = {
			enable_preview = true,
		},
		treesitter = {
			symbol_width = 80,
			ignore_symbols = { "type", "var" },
		},
		lsp_document_symbols = {
			symbol_width = 90,
			symbol_type_width = 10,
		},
		jumplist = {
			preview = { hide_on_startup = false },
		},
		marks = {
			preview = { hide_on_startup = false },
		},
		git_commits = {
			git_command = { "git", "lg" },
		},
		git_bcommits = {
			git_command = { "git", "lg" },
		},
	},
	extensions = {
		file_browser = {
			path = "%:p:h",
		},
	},
})

-- register extensions
require("telescope").load_extension("harpoon")
require("telescope").load_extension("dap")
require("telescope").load_extension("fzf")
