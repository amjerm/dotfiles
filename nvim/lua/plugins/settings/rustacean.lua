vim.g.rustaceanvim = {
	server = {
		settings = {
			-- rust-analyzer language server configuration
			["rust-analyzer"] = {
				check = {
					command = "clippy",
				},
			},
		},
	},
}
