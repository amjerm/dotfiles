local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	--language server
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	{
		"mrcjkb/rustaceanvim",
		version = "^3", -- Recommended
		ft = { "rust" },
	},
	"nvimdev/lspsaga.nvim",
	"jparise/vim-graphql",
	"ray-x/lsp_signature.nvim",
	"lukas-reineke/lsp-format.nvim",
	"lvimuser/lsp-inlayhints.nvim",
	"stevearc/conform.nvim",
	"jose-elias-alvarez/typescript.nvim",
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},
	{
		"luckasRanarison/tailwind-tools.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {},
	},
	{
		"saecki/crates.nvim",
		tag = "v0.3.0",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	"b0o/schemastore.nvim",
	-- {
	-- 	"Wansmer/symbol-usage.nvim",
	-- 	event = "LspAttach",
	-- },
	"williamboman/mason.nvim",
	{ "dmmulroy/ts-error-translator.nvim", opts = {} },
	{
		"zeioth/garbage-day.nvim",
		dependencies = "neovim/nvim-lspconfig",
		event = "VeryLazy",
		opts = {},
	},

	--ai
	"github/copilot.vim",

	--treesitter
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"nvim-treesitter/nvim-treesitter-textobjects",
	"hedyhli/outline.nvim",

	--diagnostics
	{ "folke/trouble.nvim", dependencies = { "kyazdani42/nvim-web-devicons" } },

	--autocomplete
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/cmp-git",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lsp-signature-help", --signature help
	"hrsh7th/cmp-path",
	"hrsh7th/nvim-cmp",
	"onsails/lspkind.nvim", --pictograms in cmp

	--highlight
	-- "RRethy/vim-illuminate",
	-- "rasulomaroff/reactive.nvim",

	--snippets
	"SirVer/ultisnips",
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
	},

	--shortcuts
	"tpope/vim-unimpaired",

	--themes
	{ "cormacrelf/dark-notify" },
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	"sainnhe/edge",
	"sainnhe/everforest",
	"projekt0n/github-nvim-theme",
	"rose-pine/neovim",
	"katawful/kat.nvim",
	"rakr/vim-one",
	"shaunsingh/nord.nvim",
	"pgdouyon/vim-yin-yang",
	"preservim/vim-colors-pencil",
	"savq/melange-nvim",
	"wuelnerdotexe/vim-enfocado",
	"chriskempson/vim-tomorrow-theme",
	"morhetz/gruvbox",
	{ "sainnhe/gruvbox-material", priority = 1000 },
	"mswift42/vim-themes",
	"rebelot/kanagawa.nvim",
	"nlknguyen/papercolor-theme",
	{ "miikanissi/modus-themes.nvim", priority = 1000 },
	"cideM/yui", -- for diffs
	"mechatroner/rainbow_csv",
	"hzchirs/vim-material",
	"whatyouhide/vim-gotham",
	{ "ptdewey/darkearth-nvim", priority = 1000 },
	{ "navarasu/onedark.nvim", priority = 1000 },

	--icons
	{ "kyazdani42/nvim-web-devicons", opts = {} },

	--statusline
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons", lazy = true },
	},
	"arkav/lualine-lsp-progress",

	--splash screen
	{
		"nvimdev/dashboard-nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
	},

	-- directory explorer
	"stevearc/oil.nvim",

	--filesystem commands
	"tpope/vim-eunuch",

	--file manager
	"luukvbaal/nnn.nvim",

	--navigation
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = { modes = { search = { enabled = true } } },
	},

	--keymap guild
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {},
	},

	--marks
	"ThePrimeagen/harpoon",

	--folds
	-- {
	-- 	"chrisgrieser/nvim-origami",
	-- 	event = "BufReadPost", -- later or on keypress would prevent saving folds
	-- 	opts = true, -- needed even when using default config
	-- },

	--comments
	"tpope/vim-commentary",
	{
		"kkoomen/vim-doge",
		build = ":call doge#install()",
	},

	--search and replace
	"tpope/vim-abolish",

	--git
	"tpope/vim-fugitive", --comprehensive git tool
	{ "lewis6991/gitsigns.nvim", opts = {} }, -- alternative to gitgutter
	{ "akinsho/git-conflict.nvim", version = "*", config = true },

	--fuzzy finder
	{
		"junegunn/fzf",
		dependencies = {
			"junegunn/fzf.vim",
		},
		build = "{ -> fzf#install() }",
	},

	--telescope
	{
		"nvim-telescope/telescope.nvim",
		version = "1.4.0",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

	--repeat plugin commands with '.' in addition to native ones
	"tpope/vim-repeat",

	--refactor wrapping characters/tags
	"tpope/vim-surround",

	--auto-close brackets
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},

	--split and join lines
	{ "Wansmer/treesj", dependencies = { "nvim-treesitter/nvim-treesitter" } },

	--detect buffer options
	"tpope/vim-sleuth",

	--http client
	"mistweaverco/kulala.nvim",

	--debugger
	{ "mfussenegger/nvim-dap", dependencies = { "nvim-neotest/nvim-nio" } },
	"Pocco81/DAPInstall.nvim",
	"rcarriga/nvim-dap-ui",
	"theHamsta/nvim-dap-virtual-text",
	"nvim-telescope/telescope-dap.nvim",

	--testing
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	},

	--markdown
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
}

require("lazy").setup(plugins)
