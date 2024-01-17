local defaultOpts = { noremap = true }
local telescopeBuiltin = require("telescope.builtin")

-- alpha
vim.keymap.set("n", "-", ":lua require('oil').open()<CR>", defaultOpts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, defaultOpts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, defaultOpts)
vim.keymap.set("n", "[h", ":Gitsigns prev_hunk<CR>", defaultOpts)
vim.keymap.set("n", "[t", ":tabprevious<CR>", defaultOpts)
vim.keymap.set("n", "[z", "zM", defaultOpts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, defaultOpts)
vim.keymap.set("n", "]h", ":Gitsigns next_hunk<CR>", defaultOpts)
vim.keymap.set("n", "]t", ":tabnext<CR>", defaultOpts)
vim.keymap.set("n", "]z", "zR", defaultOpts)
vim.keymap.set("n", "ga", ":Lspsaga code_action<CR>", defaultOpts)
vim.keymap.set("n", "gb", ":Git blame<CR>", defaultOpts)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, defaultOpts)
vim.keymap.set("n", "gh", vim.lsp.buf.signature_help, defaultOpts)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, defaultOpts)
vim.keymap.set("n", "gk", ":Files<CR>", defaultOpts)
vim.keymap.set("n", "gq", ":TroubleToggle quickfix<CR>", defaultOpts)
vim.keymap.set("n", "gr", vim.lsp.buf.references, defaultOpts)
vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, defaultOpts)
vim.keymap.set("o", "r", ":lua require('flash').remote()<CR>")
vim.keymap.set({ "n", "o", "x" }, "S", ":lua require('flash').treesitter()<CR>")
vim.keymap.set({ "n", "o", "x" }, "s", ":lua require('flash').jump()<CR>")
vim.keymap.set({ "o", "x" }, "R", ":lua require('flash').treesitter_search()<CR>")

-- ctrl
vim.keymap.set("c", "<C-s>", ":lua require('flash').toggle()<CR>")
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", defaultOpts) -- window nav
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", defaultOpts) -- window nav
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", defaultOpts) -- window nav
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", defaultOpts) -- window nav
vim.keymap.set("n", "<C-t>", ":TroubleToggle<CR>", defaultOpts) -- window nav
vim.keymap.set("n", "<C-x>", ":Dashboard<CR>", defaultOpts) -- window nav

-- other
vim.keymap.set("n", "<Esc>", ":noh<CR>", defaultOpts) -- find file
vim.keymap.set("n", "<Space>", "za", defaultOpts) -- toggle fold
vim.keymap.set("n", "?", ":WhichKey<CR>", defaultOpts) -- toggle fold

-- buffers - LEADER b
vim.keymap.set("n", "<Leader>bl", ":redir! @a | silent ls | redir END | new | put! a<CR>", defaultOpts) -- ls in buffer

-- diagnostics - LEADER d
vim.keymap.set("n", "<Leader>df", telescopeBuiltin.diagnostics, defaultOpts)
vim.keymap.set("n", "<Leader>dk", vim.diagnostic.open_float, defaultOpts)
vim.keymap.set("n", "<Leader>dn", vim.diagnostic.goto_next, defaultOpts)
vim.keymap.set("n", "<Leader>dp", vim.diagnostic.goto_prev, defaultOpts)
vim.keymap.set("n", "<Leader>dq", vim.diagnostic.setqflist, defaultOpts)
vim.keymap.set("n", "<Leader>dt", ":TroubleToggle<CR>", defaultOpts)

-- find - LEADER f
vim.keymap.set("n", "<Leader>fa", telescopeBuiltin.resume, defaultOpts)
vim.keymap.set("n", "<Leader>fb", telescopeBuiltin.buffers, defaultOpts)
vim.keymap.set("n", "<Leader>fc", telescopeBuiltin.command_history, defaultOpts)
vim.keymap.set("n", "<Leader>fd", ":Telescope diagnostics bufnr=0<CR>", defaultOpts)
vim.keymap.set("n", "<Leader>fD", ":Telescope diagnostics<CR>", defaultOpts)
vim.keymap.set("n", "<Leader>ff", ":Telescope<CR>", defaultOpts)
vim.keymap.set("n", "<Leader>fj", telescopeBuiltin.jumplist, defaultOpts)
vim.keymap.set("n", "<Leader>fk", telescopeBuiltin.keymaps, defaultOpts)
vim.keymap.set("n", "<Leader>fl", telescopeBuiltin.loclist, defaultOpts)
vim.keymap.set("n", "<Leader>fn", ":grep nocommit<CR>", defaultOpts)
vim.keymap.set("n", "<Leader>fm", ":Telescope treesitter<CR>method", defaultOpts)
vim.keymap.set("n", "<Leader>fn", ":Telescope current_buffer_fuzzy_find<CR>function", defaultOpts)
vim.keymap.set("n", "<Leader>fp", ":Files<CR>", defaultOpts)
vim.keymap.set("n", "<Leader>fr", telescopeBuiltin.registers, defaultOpts)
vim.keymap.set("n", "<Leader>ft", telescopeBuiltin.treesitter, defaultOpts)
vim.keymap.set("n", "<Leader>fu", telescopeBuiltin.grep_string, defaultOpts)
vim.keymap.set("n", "<Leader>fx", ":Telescope dap commands<CR>", defaultOpts)
vim.keymap.set("n", "<Leader>f/", telescopeBuiltin.current_buffer_fuzzy_find, defaultOpts)
vim.keymap.set("n", "<Leader>f.", telescopeBuiltin.resume, defaultOpts)

-- git - LEADER g
vim.keymap.set("n", "<Leader>gb", ":G blame<CR>", defaultOpts)
vim.keymap.set("n", "<Leader>gc", ":Commits --pretty=df<CR>", defaultOpts)
vim.keymap.set("n", "<Leader>gd", ":Gvdiffsplit!<CR>", defaultOpts)
vim.keymap.set("n", "<Leader>gh", ":BCommits --pretty=df<CR>", defaultOpts)
vim.keymap.set("n", "<Leader>gi", ":Gitsigns preview_hunk_inline<CR>", defaultOpts)
vim.keymap.set("n", "<Leader>gs", ":Telescope git_status<CR>", defaultOpts)

-- splitjoin - LEADER j
vim.keymap.set("n", "<Leader>jj", ":lua require('treesj').split()<CR>", defaultOpts)
vim.keymap.set("n", "<Leader>jk", ":lua require('treesj').join()<CR>", defaultOpts)
vim.keymap.set("n", "<Leader>jt", ":lua require('treesj').toggle()<CR>", defaultOpts)

-- lsp - LEADER l
vim.keymap.set("n", "<Leader>la", ":Lspsaga code_action<CR>", defaultOpts)
vim.keymap.set("n", "<Leader>ld", ":DogeGenerate<CR>", defaultOpts)
vim.keymap.set("n", "<Leader>lh", ":Lspsaga hover_doc<CR>", defaultOpts)
vim.keymap.set("n", "<Leader>li", ":LspInfo<CR>", defaultOpts)
vim.keymap.set("n", "<Leader>lf", function()
	vim.lsp.buf.format({ async = true })
end, defaultOpts)
vim.keymap.set("n", "<Leader>ll", ":Lspsaga ", defaultOpts)
vim.keymap.set("n", "<Leader>lo", ":Lspsaga outline<CR>", defaultOpts)
vim.keymap.set("n", "<Leader>lr", ":Lspsaga rename<CR>", defaultOpts)
-- vim.keymap.set("n", "<Leader>lr", vim.lsp.buf.rename, defaultOpts)
vim.keymap.set("n", "<Leader>lv", ":lua require('flash').treesitter()<CR>", defaultOpts)

-- marks - LEADER m
vim.keymap.set("n", "<Leader>ma", ":lua require('harpoon.mark').add_file()<CR>", defaultOpts)
vim.keymap.set("n", "<Leader>mm", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", defaultOpts)

-- nnn - LEADER n
vim.keymap.set("n", "<Leader>ne", ":NnnExplorer<CR>", defaultOpts)
vim.keymap.set("n", "<Leader>nn", ":NnnPicker<CR>", defaultOpts)
vim.keymap.set("n", "<Leader>np", ":NnnPicker<CR>", defaultOpts)

-- quickfix - LEADER q
vim.keymap.set("n", "<Leader>qd", vim.diagnostic.setqflist, defaultOpts) -- set qf to diagnostics
vim.keymap.set("n", "<Leader>qn", ":cn<CR>", defaultOpts)
vim.keymap.set("n", "<Leader>qp", ":cp<CR>", defaultOpts)

-- snippets - LEADER s
vim.keymap.set("n", "<Leader>sr", "<cmd>source ~/.config/nvim/after/ftplugin/luasnip.lua<CR>", defaultOpts)
vim.keymap.set("n", "<Leader>se", ":lua require('luasnip.loaders').edit_snippet_files()<CR>", defaultOpts)

-- trouble - LEADER t
vim.keymap.set("n", "<Leader>tt", ":TroubleToggle<CR>", defaultOpts)
vim.keymap.set("n", "<Leader>tr", ":TroubleRefresh<CR>", defaultOpts)

-- unit tests - LEADER u
vim.keymap.set("n", "<Leader>un", ":lua require('neotest').run.run()<CR>", defaultOpts)
vim.keymap.set("n", "<Leader>uf", ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>", defaultOpts)
vim.keymap.set(
	"n",
	"<Leader>ud",
	":lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<CR>",
	defaultOpts
)
vim.keymap.set("n", "<Leader>us", ":lua require('neotest').summary.toggle()<CR>", defaultOpts)

-- database queries - LEADER v
vim.keymap.set("n", "<Leader>vtll", ":DB g:dbll ", defaultOpts)
vim.keymap.set("n", "<Leader>vfll", ":DB g:dbll < %<CR>", defaultOpts)
vim.keymap.set("v", "<Leader>vll", ":DB g:dbll<CR>", defaultOpts)

-- debugger - LEADER x
vim.keymap.set("n", "<Leader>xa", ":lua require('dap').run_last()<CR>", defaultOpts)
vim.keymap.set("n", "<Leader>xb", ":lua require('dap').toggle_breakpoint()<CR>", defaultOpts)
vim.keymap.set("n", "<Leader>xc", ":lua require('dap').continue()<CR>", defaultOpts)
vim.keymap.set("n", "<Leader>xf", ":Telescope dap commands<CR>", defaultOpts)
vim.keymap.set("n", "<Leader>xi", ":lua require('dap').step_into()<CR>", defaultOpts)
vim.keymap.set("n", "<Leader>xl", ":lua require('dap').clear_breakpoints()<CR>", defaultOpts)
vim.keymap.set("n", "<Leader>xo", ":lua require('dap').step_over()<CR>", defaultOpts)
vim.keymap.set("n", "<Leader>xq", ":lua require('dap').list_breakpoints()<CR>:copen<CR>", defaultOpts)
vim.keymap.set("n", "<Leader>xr", ":lua require('dap').repl.open()<CR>", defaultOpts)
vim.keymap.set("n", "<Leader>xs", ":lua require('dap').terminate()<CR>", defaultOpts)
vim.keymap.set("n", "<Leader>xu", ":lua require('dap').step_out()<CR>", defaultOpts)
vim.keymap.set("n", "<Leader>xv", ":Telescope dap variables<CR>", defaultOpts)
vim.keymap.set("n", "<Leader>xx", ":lua require('dapui').toggle()<CR>", defaultOpts)

-- yank - LEADER y
vim.keymap.set("n", "<Leader>yl", ':let @*=fnamemodify(expand("%"), ":~:.") . ":" . line(".")<CR>', defaultOpts)
vim.keymap.set("n", "<Leader>yf", ':let @*=fnamemodify(expand("%"), ":~:.")<CR>', defaultOpts)
