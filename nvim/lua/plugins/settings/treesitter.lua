require('nvim-treesitter.configs').setup({
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
                        }
                },
        }
})
