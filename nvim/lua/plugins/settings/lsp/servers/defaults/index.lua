local utils = require('utilities')

local capabilities = require('plugins/settings/lsp/servers/defaults/capabilities').capabilities
local on_attach = require('plugins/settings/lsp/servers/defaults/on_attach').fn

local default_setup_table = {
        on_attach = on_attach,
        capabilities = capabilities,
}

local default_plus = function(additional_settings_table)
        return utils.combineTables(default_setup_table, additional_settings_table)
end

return {
        default_setup_table = default_setup_table,
        default_plus = default_plus,
}
