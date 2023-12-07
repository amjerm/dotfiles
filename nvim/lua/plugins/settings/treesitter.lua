local ensure_installed = {
	"comment",
	"css",
	"dockerfile",
	"git_config",
	"git_rebase",
	"gitattributes",
	"gitcommit",
	"gitignore",
	"go",
	"gomod",
	"gpg",
	"html",
	"http",
	"javascript",
	"jsdoc",
	"json",
	"json5",
	"lua",
	"luadoc",
	"markdown",
	"markdown_inline",
	"php",
	"phpdoc",
	"regex",
	"rust",
	"scheme",
	"sql",
	"toml",
	"ssh_config",
	"tsx",
	"typescript",
	"vim",
	"vimdoc",
	"xml",
	"yaml",
}

require("nvim-treesitter.configs").setup({
	ensure_installed = ensure_installed,
	matchup = {
		enable = true, -- mandatory
	},
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = { query = "@function.outer", desc = "Select around function" },
				["if"] = { query = "@function.inner", desc = "Select inside function" },
				["ac"] = { query = "@class.outer", desc = "Select around class" },
				["ic"] = { query = "@class.inner", desc = "Select inside class" },
			},
		},
	},
})
