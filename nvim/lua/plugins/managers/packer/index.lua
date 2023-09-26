require('packer').startup(function(use)
        use 'wbthomason/packer.nvim'

        --language server
        use 'neovim/nvim-lspconfig'
        use 'simrat39/rust-tools.nvim'
        use 'jparise/vim-graphql'
        use 'ray-x/lsp_signature.nvim'
        use 'sbdchd/neoformat'
        use 'lukas-reineke/lsp-format.nvim'
        use {
                'kosayoda/nvim-lightbulb',
                requires = 'antoinemadec/FixCursorHold.nvim',
        }

        --treesitter
        use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

        --autocomplete
        use 'hrsh7th/nvim-cmp'
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-cmdline'
        use 'hrsh7th/cmp-git'
        use 'hrsh7th/cmp-path'
        use 'quangnguyen30192/cmp-nvim-ultisnips'
        use 'onsails/lspkind.nvim'                --pictograms in cmp
        use 'hrsh7th/cmp-nvim-lsp-signature-help' --signature help
        use 'folke/neodev.nvim'                   --lua signature help

        --snippets
        use 'SirVer/ultisnips'
        use 'honza/vim-snippets'

        --diagnostic interface
        use {
                "folke/trouble.nvim",
                requires = "kyazdani42/nvim-web-devicons",
                config = function()
                        require("trouble").setup {}
                end
        }

        --themes
        use 'arcticicestudio/nord-vim'
        use { 'kaicataldo/material.vim', branch = 'main' }
        use 'sainnhe/everforest'
        use 'sainnhe/gruvbox-material'
        use { 'sonph/onehalf', rtp = 'vim' }
        use 'EdenEast/nightfox.nvim'
        use 'humanoid-colors/vim-humanoid-colorscheme'
        use 'hzchirs/vim-material'
        use 'ayu-theme/ayu-vim'
        use 'katawful/kat.nvim'
        use 'dracula/vim'
        use 'ghifarit53/tokyonight-vim'
        use { 'srcery-colors/srcery-vim', as = 'srcery' }

        --icons
        use 'kyazdani42/nvim-web-devicons'

        --statusline
        use {
                'nvim-lualine/lualine.nvim',
                requires = { 'kyazdani42/nvim-web-devicons', opt = true }
        }

        -- directory explorer
        use 'tpope/vim-vinegar'
        -- use 'stevearc/oil.nvim'

        --filesystem commands
        use 'tpope/vim-eunuch'

        -- edit directory as buffer
        -- use 'elihunter173/dirbuf.nvim'

        --symbol outline
        use 'stevearc/aerial.nvim'

        --marks
        use 'ThePrimeagen/harpoon'

        --comment toggle
        use 'tpope/vim-commentary'

        --search and replace
        use 'tpope/vim-abolish'

        --git
        use 'tpope/vim-fugitive'     --comprehensive git tool
        use 'airblade/vim-gitgutter' --git status in gutter

        --fuzzy finder
        use {
                'junegunn/fzf',
                requires = {
                        'junegunn/fzf.vim',
                },
                run = '{ -> fzf#install() }',
        }

        --telescope
        use {
                'nvim-telescope/telescope.nvim',
                tag = '0.1.0',
                requires = { { 'nvim-lua/plenary.nvim' } }
        }
        use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

        --motions
        use 'ggandor/leap.nvim'
        -- use 'ggandor/leap-spooky.nvim'

        --shortcuts
        use 'tpope/vim-unimpaired'

        --repeat plugin commands with '.' in addition to native ones
        use 'tpope/vim-repeat'

        --refactor wrapping characters/tags
        use 'tpope/vim-surround'

        --auto-close brackets
        use 'jiangmiao/auto-pairs'

        --detect buffer options
        use 'tpope/vim-sleuth'

        --debugger
        use 'mfussenegger/nvim-dap'
        use 'Pocco81/DAPInstall.nvim'
        use 'rcarriga/nvim-dap-ui'
        use 'theHamsta/nvim-dap-virtual-text'
        use 'nvim-telescope/telescope-dap.nvim'

        --testing
        use 'vim-test/vim-test'
        use {
                'nvim-neotest/neotest',
                requires = {
                        'nvim-lua/plenary.nvim',
                        'nvim-neotest/neotest-plenary',
                        'nvim-treesitter/nvim-treesitter',
                        'antoinemadec/FixCursorHold.nvim',
                        'nvim-neotest/neotest-vim-test',
                        'haydenmeade/neotest-jest',
                        'rouge8/neotest-rust',
                }
        }

        --documentation
        use {
                'kkoomen/vim-doge',
                run = ':call doge#install()'
        }

        --database:
        -- use 'tpope/vim-dadbod'
end)

--settings
require 'plugins/managers/packer/settings/aerial'
require 'plugins/managers/packer/settings/blamer'
require 'plugins/managers/packer/settings/dap'
require 'plugins/managers/packer/settings/fzf'
require 'plugins/managers/packer/settings/indentline'
require 'plugins/managers/packer/settings/leap'
require 'plugins/managers/packer/settings/lsp'
require 'plugins/managers/packer/settings/lsp_signature'
require 'plugins/managers/packer/settings/lualine'
require 'plugins/managers/packer/settings/neotest'
require 'plugins/managers/packer/settings/nvim-lightbulb'
require 'plugins/managers/packer/settings/nvim-web-devicons'
require 'plugins/managers/packer/settings/telescope'
require 'plugins/managers/packer/settings/treesitter'
require 'plugins/managers/packer/settings/utilisnips'
require 'plugins/managers/packer/settings/vim-gitgutter'
