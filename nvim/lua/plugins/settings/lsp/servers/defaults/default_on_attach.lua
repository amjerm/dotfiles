local custom_on_attach = function(client, bufnr)
	-- formatting
	require("lsp-format").on_attach(client)
	require("lsp-inlayhints").on_attach(client, bufnr)

	-- cmp
	vim.api.nvim_set_option_value("formatexpr", "v:lua.vim.lsp.formatexpr()", { buf = bufnr })
	vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })
	vim.api.nvim_set_option_value("tagfunc", "v:lua.vim.lsp.tagfunc", { buf = bufnr })

	-- prevent tsserver in deno
	local active_clients = vim.lsp.get_clients({ bufnr = bufnr })
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
	custom_on_attach = custom_on_attach,
}
