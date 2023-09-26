local setup = function(lspconfig, default_plus)
        lspconfig.denols.setup(default_plus({
                root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
        }))
end

return {
        setup = setup
}
