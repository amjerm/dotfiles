local setup = function(lspconfig, default_plus)
        require('typescript-tools').setup(default_plus({
                root_dir = lspconfig.util.root_pattern('package.json'),
                settings = {
                        tsserver_file_preferences = {
                                includeInlayParameterNameHints = 'all',
                                includeInlayEnumMemberValueHints = true,
                                includeInlayFunctionLikeReturnTypeHints = true,
                                includeInlayFunctionParameterTypeHints = true,
                                includeInlayPropertyDeclarationTypeHints = true,
                                includeInlayVariableTypeHints = true
                        },
                },
        }))
end

return {
        setup = setup
}
