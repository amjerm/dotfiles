require("conform").setup({
	formatters_by_ft = {
		-- Conform will run multiple formatters sequentially
		-- Use a sub-list to run only the first available formatter
		lua = { "stylua" },
		toml = { "taplo" },
		javascript = { "rustywind", { "prettierd", "prettier" } },
		javascriptreact = { "rustywind", { "prettierd", "prettier" } },
		typescript = { "rustywind", { "prettierd", "prettier" } },
		typescriptreact = { "rustywind", { "prettierd", "prettier" } },
		rust = { "rustfmt" },
		yaml = { "yamlfmt" },
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

-- neoformat
-- require('lsp-format').setup()
-- vim.g.neoformat_try_node_exe = 1
-- vim.cmd [[ autocmd BufWritePre *.{js,jsx,ts,tsx} Neoformat ]]

-- default format on save
vim.cmd([[ autocmd BufWritePre *.{html,php,json} lua vim.lsp.buf.format() ]])
