vim.o.completeopt = "menu"

local cmp = require("cmp")

require("lspkind").init({
	preset = "codicons",
	symbol_map = {
		Copilot = "",
	},
})

if cmp then
	cmp.setup({
		experimental = {
			ghost_text = true, -- turn off for copilot
		},
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
		formatting = {
			fields = { "kind", "abbr", "menu" },
			format = function(entry, vim_item)
				local kind = require("lspkind").cmp_format({
					mode = "symbol_text",
					maxwidth = 50,
					menu = {
						copilot = "[CP]",
						buffer = "[Buf]",
						lsp_signature = "[Sig]",
						nvim_lsp = "[LSP]",
						nvim_lua = "[Lua]",
						path = "[Path]",
						utilisnips = "[US]",
					},
				})(entry, vim_item)

				local strings = vim.split(kind.kind, "%s", { trimempty = true })

				kind.kind = " " .. " " .. strings[1] .. " "

				if strings[2] then
					kind.menu = "    (" .. strings[2] .. ")"
				end

				return kind
			end,
		},
		view = {
			entries = { name = "custom", selection_order = "near_cursor" },
		},
		snippet = {
			expand = function(args)
				vim.fn["UltiSnips#Anon"](args.body)
			end,
		},
		mapping = cmp.mapping.preset.insert({
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({ select = true }),
		}),
		sources = cmp.config.sources({
			-- { name = "copilot", group_index = 2 },
			{ name = "ultisnips", group_index = 2 },
			{ name = "nvim_lsp", group_index = 2 },
			{ name = "lsp_signature", group_index = 2 },
			{ name = "path", group_index = 2 },
			{ name = "crates", group_index = 2 },
		}, {
			{ name = "buffer", keyword_length = 3 },
		}),
	})

	cmp.setup.filetype("gitcommit", {
		sources = cmp.config.sources({
			{ name = "cmp_git" },
		}, {
			{ name = "buffer" },
		}),
	})

	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})

	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	})
end
