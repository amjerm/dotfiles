local actions = require "telescope.actions"
local trouble = require("trouble.providers.telescope")

require('telescope').setup {
        defaults = {
                -- Default configuration for telescope goes here:
                -- config_key = value,
                -- layout_strategy = "vertical",
                -- layout_config = {
                --     prompt_position = 'top',
                -- },
                mappings = {
                        i = {
                                -- map actions.which_key to <C-h> (default: <C-/>)
                                -- actions.which_key shows the mappings for your picker,
                                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                                ["<C-h>"] = "which_key",
                                ["<C-q>"] = "send_to_qflist",
                                ["<C-s>"] = trouble.open_selected_with_trouble,
                                ["<C-t>"] = trouble.open_with_trouble,
                                ["<C-f>"] = "send_selected_to_qflist",
                        },
                        n = {
                                ["<C-h>"] = "which_key",
                                ["<C-q>"] = "send_to_qflist",
                                ["<C-s>"] = trouble.open_selected_with_trouble,
                                ["<C-t>"] = trouble.open_with_trouble,
                                ["<C-f>"] = "send_selected_to_qflist",
                        }
                }
        },
        pickers = {
                -- Default configuration for builtin pickers goes here:
                -- picker_name = {
                --   picker_config_key = value,
                --   ...
                -- }
                -- Now the picker_config_key will be applied every time you call this
                -- builtin picker
        },
        extensions = {
                -- Your extension configuration goes here:
                -- extension_name = {
                --   extension_config_key = value,
                -- }
                -- please take a look at the readme of the extension you want to configure
                file_browser = {
                        path = "%:p:h"
                }
        }
}

-- register extensions
require('telescope').load_extension('harpoon')
require('telescope').load_extension('dap')
