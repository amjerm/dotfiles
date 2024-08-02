-- COMPLETION
require("plugins/settings/lsp/completion")

-- FORMATTING
require("plugins/settings/lsp/formatting")

-- SERVERS
require("plugins/settings/lsp/servers/index")

-- HELPERS
require("lspsaga").setup({
	code_action = {
		extend_gitsigns = true,
		show_server_name = true,
	},
	outline = {
		detail = {
			enable = false,
			max_width = 0.2,
		},
		auto_preview = false,
		show_detail = false,
	},
})

-- FILETYPES
require("plugins/settings/lsp/filetypes")
