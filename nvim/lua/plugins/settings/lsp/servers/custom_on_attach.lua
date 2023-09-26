local custom_on_attach = function(client, bufnr)
        -- formatting
        require('lsp-format').on_attach(client)

        -- cmp
        vim.api.nvim_buf_set_option(bufnr, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        vim.api.nvim_buf_set_option(bufnr, 'tagfunc', 'v:lua.vim.lsp.tagfunc')

        -- prevent tsserver in deno
        local active_clients = vim.lsp.get_active_clients()
        if client.name == "denols" then
                for _, client_ in pairs(active_clients) do
                        -- stop tsserver if denols is already active
                        if client_.name == "tsserver" then
                                client_.stop()
                        end
                end
        elseif client.name == "tsserver" then
                for _, client_ in pairs(active_clients) do
                        -- prevent tsserver from starting if denols is already active
                        if client_.name == "denols" then
                                client.stop()
                        end
                end
        end
end

return {
        custom_on_attach = custom_on_attach
}
