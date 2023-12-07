require("lualine").setup({
	options = {
		globalstatus = true,
		theme = "auto",
		-- section_separators = { left = '', right = '' },
		section_separators = "",
	},
	sections = {
		-- defaults
		-- lualine_a = { 'mode' },
		-- lualine_b = { 'branch', 'diff', 'diagnostics' },
		-- lualine_c = { 'filename' },
		-- lualine_x = { 'encoding', 'fileformat', 'filetype' },
		-- lualine_y = { 'progress' },
		-- lualine_z = { 'location' }
		lualine_c = { { "filename", path = 1 }, "lsp_progress" },
	},
})
