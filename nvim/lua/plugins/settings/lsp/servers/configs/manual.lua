local lspconfig = require("lspconfig")
local default_setup = require("plugins/settings/lsp/servers/defaults/index")

-- servers w standard config (not setting up rust_analyzer per instructions from rust-tools/rustacean)
local servers = { "emmet_ls", "dockerls", "intelephense", "eslint", "graphql", "sqlls", "marksman" }
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup(default_setup.default_setup_table)
end

-- json
require("plugins/settings/lsp/servers/lsps/jsonls").setup(lspconfig, default_setup.default_plus)

-- deno
require("plugins/settings/lsp/servers/lsps/denols").setup(lspconfig, default_setup.default_plus)

-- yaml
require("plugins/settings/lsp/servers/lsps/yamlls").setup(lspconfig, default_setup.default_plus)

-- lua
require("plugins/settings/lsp/servers/lsps/lua_ls").setup(lspconfig, default_setup.default_plus)

-- rust
require("plugins/settings/lsp/servers/tools/crates").setup()

-- typescript
require("plugins/settings/lsp/servers/tools/typescript-tools").setup(lspconfig, default_setup.default_plus)
