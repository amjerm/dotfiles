local lspconfig = require('lspconfig')
local utils = require('utilities')

-- define capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- define on_attach
local custom_on_attach = require('plugins/settings/lsp/servers/custom_on_attach').custom_on_attach

local default_setup_table = {
        on_attach = custom_on_attach,
        capabilities = capabilities
}

local default_plus = function(additional_settings_table)
        return utils.combineTables(default_setup_table, additional_settings_table)
end

-- servers w standard config (not setting up rust_analyzer per instructions from rust-tools)
local servers = { 'emmet_ls', 'dockerls', 'intelephense', 'eslint', 'graphql', 'sqlls', 'marksman' }
for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup(default_setup_table)
end

-- json
require('plugins/settings/lsp/servers/lsps/jsonls').setup(lspconfig, default_plus)

-- deno
require('plugins/settings/lsp/servers/lsps/denols').setup(lspconfig, default_plus)

-- yaml
require('plugins/settings/lsp/servers/lsps/yamlls').setup(lspconfig, default_plus)

-- lua
require('plugins/settings/lsp/servers/lsps/lua_ls').setup(lspconfig, default_plus)

-- rust
require('plugins/settings/lsp/servers/tools/rust-tools').setup(default_plus)
require('plugins/settings/lsp/servers/tools/crates').setup()

-- typescript
require('plugins/settings/lsp/servers/tools/typescript-tools').setup(lspconfig, default_plus)

-- signature
require('plugins/settings/lsp/servers/tools/lsp_signature')
