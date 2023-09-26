local setup = function(default_plus, lspconfig)
        require('typescript').setup({
                server = default_plus({
                        single_file_support = false,
                        root_dir = lspconfig.util.root_pattern("package.json"),
                })
        })
end

return {
        setup = setup
}
