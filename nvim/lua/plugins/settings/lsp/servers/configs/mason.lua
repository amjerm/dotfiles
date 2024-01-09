require("mason").setup()

local lspconfig = require("lspconfig")

local default_setup = require("plugins/settings/lsp/servers/defaults/index")

local ensure_installed = {
	"denols",
	"dockerls",
	"emmet_ls",
	"eslint",
	"graphql",
	"intelephense",
	"jsonls",
	"lua_ls",
	"marksman",
	"sqlls",
	"tsserver",
	"yamlls",
}

local handlers = {
	function(lsp) -- default handler
		lspconfig[lsp].setup(default_setup.default_setup_table)
	end,

	-- deno
	["denols"] = function()
		require("plugins/settings/lsp/servers/lsps/denols").setup(lspconfig, default_setup.default_plus)
	end,

	-- json
	["jsonls"] = function()
		require("plugins/settings/lsp/servers/lsps/jsonls").setup(lspconfig, default_setup.default_plus)
	end,

	-- lua
	["lua_ls"] = function()
		require("plugins/settings/lsp/servers/lsps/lua_ls").setup(lspconfig, default_setup.default_plus)
	end,

	-- rust
	["rust_analyzer"] = function()
		require("plugins/settings/lsp/servers/tools/crates").setup()
	end,

	-- typescript
	["tsserver"] = function()
		require("plugins/settings/lsp/servers/tools/typescript-tools").setup(lspconfig, default_setup.default_plus)
	end,

	-- yaml
	["yamlls"] = function()
		require("plugins/settings/lsp/servers/lsps/yamlls").setup(lspconfig, default_setup.default_plus)
	end,
}

require("mason-lspconfig").setup({ ensure_installed = ensure_installed, handlers = handlers })
