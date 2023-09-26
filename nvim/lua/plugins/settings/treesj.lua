local lang_utils = require('treesj.langs.utils')
local langs = {
        javascript = {
                object = lang_utils.set_preset_for_dict(),
                array = lang_utils.set_preset_for_list(),
                formal_parameters = lang_utils.set_preset_for_args(),
                arguments = lang_utils.set_preset_for_args(),
                statement_block = lang_utils.set_preset_for_statement({
                        join = {
                                no_insert_if = {
                                        'function_declaration',
                                        'try_statement',
                                        'if_statement',
                                },
                        },
                }),
        },
}
require('treesj').setup({
        notify = true,
        langs = langs,
})
