local setup = function(lspconfig, default_plus)
        require('typescript-tools').setup(default_plus({
                root_dir = lspconfig.util.root_pattern("package.json"),
        }))
end

return {
        setup = setup
}
