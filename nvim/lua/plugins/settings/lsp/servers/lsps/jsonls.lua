local setup = function(lspconfig, default_plus)
        lspconfig.jsonls.setup(default_plus({
                schemas = require('schemastore').json.schemas(),
                validate = { enable = true },
        }))
end

return {
        setup = setup
}
