-- functions
function CLScopes(...)
	local args = { ... }
	local command = '!zsh -ic "pnpm run cl:scopes -q '

	for i, arg in ipairs(args) do
		command = command .. "'" .. vim.fn.shellescape(arg) .. "'"
		if i < #args then
			command = command .. ","
		end
	end

	command = command .. '"'

	vim.cmd("execute '" .. command .. "'")
end

function ClearBG()
	vim.api.nvim_set_hl(0, "Normal", { ctermfg = "NONE", fg = "NONE" })
end
