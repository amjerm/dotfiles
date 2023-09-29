--manager
require 'plugins/managers/index'

--lsp
require 'plugins/settings/lsp/index'

--in use
require 'plugins/settings/dadbod'
require 'plugins/settings/dap'
require 'plugins/settings/dashboard'
require 'plugins/settings/fzf'
require 'plugins/settings/indentline'
require 'plugins/settings/lualine'
require 'plugins/settings/neotest'
require 'plugins/settings/oil'
require 'plugins/settings/peek'
require 'plugins/settings/splitjoin'
require 'plugins/settings/telescope'
require 'plugins/settings/treesitter'
require 'plugins/settings/utilisnips'
require 'plugins/settings/vim-gitgutter'

-- no additional settings
require('aerial').setup()
require('nvim-web-devicons').setup()
require('trouble').setup()
