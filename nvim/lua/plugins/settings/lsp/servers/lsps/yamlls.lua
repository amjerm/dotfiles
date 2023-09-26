local setup = function(lspconfig, default_plus)
        lspconfig.yamlls.setup(default_plus({
                settings = {
                        yaml = {
                                schemaStore = {
                                        -- per schemastore plugin:
                                        -- You must disable built-in schemaStore support if you want to use
                                        -- this plugin and its advanced options like `ignore`.
                                        enable = false,
                                        -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                                        url = "",
                                },
                                schemas = {
                                        require('schemastore').yaml.schemas()
                                }
                        }
                }
        }))
end

return {
        setup = setup
}
