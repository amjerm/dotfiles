-- local header2 = {
--         [[]],
--         [[]],
--         [[]],
--         [[]],
--         [[]],
--         [[]],
--         [[]],
--         [[╔══╗ ╔╗   ╔═══╗╔═══╗╔╗╔═╗    ╔═══╗╔═══╗╔═══╗╔═══╗╔═══╗╔═╗ ╔╗    ╔═══╗╔════╗╔╗ ╔╗ ╔═══╗ ╔═══╗]],
--         [[║╔╗║ ║║   ║╔═╗║║╔═╗║║║║╔╝    ║╔═╗║║╔═╗║║╔═╗║║╔══╝║╔══╝║║╚╗║║    ║╔═╗║║╔╗╔╗║║║ ║║ ║╔══╝ ║╔══╝]],
--         [[║╚╝╚╗║║   ║║ ║║║║ ╚╝║╚╝╝     ║╚══╗║║ ╚╝║╚═╝║║╚══╗║╚══╗║╔╗╚╝║    ║╚══╗╚╝║║╚╝║║ ║║ ║╚══╗ ║╚══╗]],
--         [[║╔═╗║║║ ╔╗║╚═╝║║║ ╔╗║╔╗║     ╚══╗║║║ ╔╗║╔╗╔╝║╔══╝║╔══╝║║╚╗║║    ╚══╗║  ║║  ║║ ║║ ║╔══╝ ║╔══╝]],
--         [[║╚═╝║║╚═╝║║╔═╗║║╚═╝║║║║╚╗    ║╚═╝║║╚═╝║║║║╚╗║╚══╗║╚══╗║║ ║║║    ║╚═╝║ ╔╝╚╗ ║╚═╝║╔╝╚╗  ╔╝╚╗  ]],
--         [[╚═══╝╚═══╝╚╝ ╚╝╚═══╝╚╝╚═╝    ╚═══╝╚═══╝╚╝╚═╝╚═══╝╚═══╝╚╝ ╚═╝    ╚═══╝ ╚══╝ ╚═══╝╚══╝  ╚══╝  ]],
--         [[]],
--         [[]],
--         [[]],
--         [[]],
--         [[]],
-- }

local header = {
        [[]],
        [[]],
        [[╔════════════════╗]],
        [[║                ║]],
        [[║     neovim     ║]],
        [[║                ║]],
        [[╚════════════════╝]],
        [[]],
        [[]],
}

require('dashboard').setup({
        theme = 'doom',
        event = 'VimEnter',
        config = {
                header = header,
                center = {
                        {
                                icon = "󰥨  ",
                                desc = "Find files",
                                key = "f",
                                action = "Files",
                        },
                        {
                                icon = "  ",
                                desc = "Harpoon",
                                key = "h",
                                action = "require('harpoon.ui').toggle_quick_menu()",
                        },
                        {
                                icon = "󰭎  ",
                                desc = "Telescope",
                                key = "t",
                                action = "Telescope",
                        },
                        {
                                icon = "  ",
                                desc = "Empty buffer",
                                key = "e",
                                action = "enew",
                        },
                        {
                                icon = "  ",
                                desc = "TSUpdate",
                                key = "s",
                                action = "TSUpdate",
                        },
                        {
                                icon = "  ",
                                desc = "Lazy sync",
                                key = "l",
                                action = "Lazy sync",
                        },
                        {
                                icon = "  ",
                                desc = "Quit",
                                key = "q",
                                action = "q",
                        },
                },
                footer = {} --your footer
        }
})
