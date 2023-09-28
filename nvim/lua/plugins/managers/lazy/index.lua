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
        'neovim/nvim-lspconfig',
        'simrat39/rust-tools.nvim',
        'jparise/vim-graphql',
        'ray-x/lsp_signature.nvim',
        'sbdchd/neoformat',
        'lukas-reineke/lsp-format.nvim',
        'jose-elias-alvarez/typescript.nvim',
        {
                "pmizio/typescript-tools.nvim",
                dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
                opts = {},
        },
        {
                'saecki/crates.nvim',
                tag = 'v0.3.0',
                dependencies = { 'nvim-lua/plenary.nvim' },
        },
        'b0o/schemastore.nvim',

        --treesitter
        { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

        --diagnostics
        {
                "folke/trouble.nvim",
                dependencies = { "kyazdani42/nvim-web-devicons" },
        },

        --autocomplete
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-git',
        'hrsh7th/cmp-path',
        'quangnguyen30192/cmp-nvim-ultisnips',
        'onsails/lspkind.nvim',                --pictograms in cmp
        'hrsh7th/cmp-nvim-lsp-signature-help', --signature help
        'folke/neodev.nvim',                   --lua signature help

        --snippets
        'SirVer/ultisnips',
        'honza/vim-snippets',

        --shortcuts
        'tpope/vim-unimpaired',

        --themes
        'arcticicestudio/nord-vim',
        'sainnhe/everforest',
        'sainnhe/gruvbox-material',
        'cideM/yui', -- for diffs
        'mechatroner/rainbow_csv',
        'rebelot/kanagawa.nvim',
        { 'catppuccin/nvim',                 name = 'catppuccin', priority = 1000 },
        { 'rose-pine/neovim',                name = 'rose-pine',  priority = 1000 },
        { 'savq/melange-nvim',               name = 'melange',    priority = 1000 },
        { 'embark-theme/vim',                name = 'embark',     priority = 1000 },
        'ghifarit53/tokyonight-vim',
        {
                'AlexvZyl/nordic.nvim',
                lazy = false,
                priority = 1000,
                config = function()
                        require 'nordic'.load()
                end
        },
        'whatyouhide/vim-gotham',
        'tlhr/anderson.vim',
        'ayu-theme/ayu-vim',
        'AlessandroYorba/Alduin',
        'rakr/vim-two-firewatch',
        'AlessandroYorba/Sierra',
        'haystackandroid/carbonized',
        'jdsimcoe/abstract.vim',
        'rose-pine/neovim',
        'aktersnurra/no-clown-fiesta.nvim',

        --icons
        'kyazdani42/nvim-web-devicons',

        --statusline
        {
                'nvim-lualine/lualine.nvim',
                dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true }
        },
        'arkav/lualine-lsp-progress',

        --splash screen
        {
                'glepnir/dashboard-nvim',
                dependencies = { 'kyazdani42/nvim-web-devicons' }
        },

        -- directory explorer
        'stevearc/oil.nvim',

        --filesystem commands
        'tpope/vim-eunuch',

        --symbol outline
        'stevearc/aerial.nvim',

        --marks
        'ThePrimeagen/harpoon',

        --comment toggle
        'tpope/vim-commentary',

        --search and replace
        'tpope/vim-abolish',

        --git
        'tpope/vim-fugitive',     --comprehensive git tool
        'airblade/vim-gitgutter', --git status in gutter

        --fuzzy finder
        {
                'junegunn/fzf',
                dependencies = {
                        'junegunn/fzf.vim',
                },
                build = '{ -> fzf#install() }',
        },

        --telescope
        {
                'nvim-telescope/telescope.nvim',
                version = '0.1.0',
                dependencies = { { 'nvim-lua/plenary.nvim' } }
        },
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

        --motions
        -- 'folke/flash.nvim',
        -- 'm4xshen/hardtime.nvim',

        --repeat plugin commands with '.' in addition to native ones
        'tpope/vim-repeat',

        --refactor wrapping characters/tags
        'tpope/vim-surround',

        --auto-close brackets
        'jiangmiao/auto-pairs',

        --split and join lines
        'AndrewRadev/splitjoin.vim',

        --detect buffer options
        'tpope/vim-sleuth',

        --debugger
        'mfussenegger/nvim-dap',
        'Pocco81/DAPInstall.nvim',
        'rcarriga/nvim-dap-ui',
        'theHamsta/nvim-dap-virtual-text',
        'nvim-telescope/telescope-dap.nvim',

        --testing
        'vim-test/vim-test',
        {
                'nvim-neotest/neotest',
                dependencies = {
                        'nvim-lua/plenary.nvim',
                        'nvim-neotest/neotest-plenary',
                        'nvim-treesitter/nvim-treesitter',
                        'antoinemadec/FixCursorHold.nvim',
                        'nvim-neotest/neotest-vim-test',
                        'haydenmeade/neotest-jest',
                        'rouge8/neotest-rust',
                }
        },

        --databases
        'tpope/vim-dadbod',

        --email
        'https://git.sr.ht/~soywod/himalaya-vim',

        --markdown preview
        { 'toppair/peek.nvim',                        run = 'deno task --quiet build:fast' },
}

require('lazy').setup(plugins)
