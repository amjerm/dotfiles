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
		"saecki/crates.nvim",
		tag = "v0.3.0",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	"b0o/schemastore.nvim",
	{
		"Wansmer/symbol-usage.nvim",
		event = "BufReadPre", -- need run before LspAttach if you use nvim 0.9. On 0.10 use 'LspAttach'
	},
	"williamboman/mason.nvim",

	--treesitter
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"nvim-treesitter/nvim-treesitter-textobjects",

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
	"quangnguyen30192/cmp-nvim-ultisnips",

	--highlight
	"RRethy/vim-illuminate",
	{ "rasulomaroff/reactive.nvim" },

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
	"arcticicestudio/nord-vim",
	"sainnhe/everforest",
	"sainnhe/gruvbox-material",
	"cideM/yui", -- for diffs
	"mechatroner/rainbow_csv",
	"rebelot/kanagawa.nvim",
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "rose-pine/neovim", name = "rose-pine", priority = 1000 },
	{ "savq/melange-nvim", name = "melange", priority = 1000 },
	{ "embark-theme/vim", name = "embark", priority = 1000 },
	"ghifarit53/tokyonight-vim",
	{ "fcancelinha/northern.nvim", branch = "master", priority = 1000 },
	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nordic").load()
		end,
	},
	"whatyouhide/vim-gotham",
	"tlhr/anderson.vim",
	"ayu-theme/ayu-vim",
	"AlessandroYorba/Alduin",
	"rakr/vim-two-firewatch",
	"AlessandroYorba/Sierra",
	"haystackandroid/carbonized",
	"jdsimcoe/abstract.vim",
	"rose-pine/neovim",
	"aktersnurra/no-clown-fiesta.nvim",
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},

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
		opts = {},
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
	{
		"chrisgrieser/nvim-origami",
		event = "BufReadPost", -- later or on keypress would prevent saving folds
		opts = true, -- needed even when using default config
	},

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
	-- "samoshkin/vim-mergetool",

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

	--debugger
	"mfussenegger/nvim-dap",
	"Pocco81/DAPInstall.nvim",
	"rcarriga/nvim-dap-ui",
	"theHamsta/nvim-dap-virtual-text",
	"nvim-telescope/telescope-dap.nvim",

	--testing
	"vim-test/vim-test",
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-neotest/neotest-plenary",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-neotest/neotest-vim-test",
			"haydenmeade/neotest-jest",
			"rouge8/neotest-rust",
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

	--databases
	"tpope/vim-dadbod",
}

require("lazy").setup(plugins)
