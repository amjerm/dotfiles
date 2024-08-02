local fn = function(client, bufnr)
	-- formatting
	require("lsp-format").on_attach(client)

	-- inlay hints
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

	--inlay hints
	if vim.lsp.buf.inlay_hint and client.server_capabilities.inlayHintProvider then
		vim.lsp.buf.inlay_hint(bufnr, true)
	end
end

-- inlay hints
-- vim.api.nvim_create_augroup('LspAttach_inlayhints', {})
-- vim.api.nvim_create_autocmd('LspAttach', {
--         group = 'LspAttach_inlayhints',
--         callback = function(args)
--                 if not (args.data and args.data.client_id) then
--                         return
--                 end

--                 local bufnr = args.buf
--                 local client = vim.lsp.get_client_by_id(args.data.client_id)
--                 require('lsp-inlayhints').on_attach(client, bufnr)
--         end,
-- })

return {
	fn = fn,
}
