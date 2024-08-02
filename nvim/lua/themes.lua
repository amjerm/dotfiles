-- everforest
vim.g.everforest_background = "hard"

if vim.wo.diff then
	vim.cmd("colorscheme yui")
else
	vim.cmd("colorscheme gotham")

	-- vim.api.nvim_set_option("background", "light")
	-- vim.cmd([[highlight ColorColumn guibg=#091f2e]])
end
