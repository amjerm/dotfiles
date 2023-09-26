local defaultOpts = { noremap = true }
local telescopeBuiltin = require('telescope.builtin')

-- alpha
vim.keymap.set('n', 'K', vim.lsp.buf.hover, defaultOpts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, defaultOpts)
vim.keymap.set('n', 'gh', vim.lsp.buf.signature_help, defaultOpts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, defaultOpts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, defaultOpts)
vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, defaultOpts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, defaultOpts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, defaultOpts)
vim.keymap.set('n', '-', ":lua require('oil').open()<CR>", defaultOpts)

-- ctrl
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', defaultOpts) -- window nav
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', defaultOpts) -- window nav
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', defaultOpts) -- window nav
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', defaultOpts) -- window nav

-- other
vim.keymap.set('n', '<Esc>', ':noh<CR>', defaultOpts) -- find file

-- buffers - LEADER b
vim.keymap.set('n', '<Leader>bl', ':redir! @a | silent ls | redir END | new | put! a<CR>', defaultOpts) -- ls in buffer


-- code actions - LEADER c
vim.keymap.set('n', '<Leader>cc', vim.lsp.buf.code_action, defaultOpts)
vim.keymap.set('n', '<Leader>cf', function() vim.lsp.buf.format { async = true } end, defaultOpts)
vim.keymap.set('n', '<Leader>cr', vim.lsp.buf.rename, defaultOpts)

-- diagnostics - LEADER d
vim.keymap.set('n', '<Leader>dk', vim.diagnostic.open_float, defaultOpts)
vim.keymap.set('n', '<Leader>dq', vim.diagnostic.setqflist, defaultOpts)
vim.keymap.set('n', '<Leader>dn', vim.diagnostic.goto_next, defaultOpts)
vim.keymap.set('n', '<Leader>dp', vim.diagnostic.goto_prev, defaultOpts)
vim.keymap.set('n', '<Leader>df', telescopeBuiltin.diagnostics, defaultOpts)

-- find - LEADER f
vim.keymap.set('n', '<Leader>fa', telescopeBuiltin.resume, defaultOpts)
vim.keymap.set('n', '<Leader>fb', telescopeBuiltin.buffers, defaultOpts)
vim.keymap.set('n', '<Leader>fd', telescopeBuiltin.diagnostics, defaultOpts)
vim.keymap.set('n', '<Leader>ff', ':Telescope<CR>', defaultOpts)
vim.keymap.set('n', '<Leader>fk', telescopeBuiltin.keymaps, defaultOpts)
vim.keymap.set('n', '<Leader>fn', ':grep nocommit<CR>', defaultOpts)
vim.keymap.set('n', '<Leader>fp', ':Files<CR>', defaultOpts)
vim.keymap.set('n', '<Leader>fu', telescopeBuiltin.grep_string, defaultOpts)
vim.keymap.set('n', '<Leader>fx', ":Telescope dap commands<CR>", defaultOpts)

-- git - LEADER g
vim.keymap.set('n', '<Leader>gb', ':G blame<CR>', defaultOpts)
vim.keymap.set('n', '<Leader>gc', ':Commits --pretty=df<CR>', defaultOpts)
vim.keymap.set('n', '<Leader>gd', ':Gvdiffsplit!<CR>', defaultOpts)
vim.keymap.set('n', '<Leader>gh', ':BCommits --pretty=df<CR>', defaultOpts)

-- himalaya - LEADER h
vim.keymap.set('n', '<Leader>hd', ':HimalayaDelete<CR>', defaultOpts)
vim.keymap.set('n', '<Leader>hh', ':Himalaya<CR>', defaultOpts)
vim.keymap.set('n', '<Leader>hw', ':HimalayaWrite<CR>', defaultOpts)

-- splitjoin - LEADER j
vim.keymap.set('n', '<Leader>jj', ':SplitjoinSplit<CR>', defaultOpts)
vim.keymap.set('n', '<Leader>jk', ':SplitjoinJoin<CR>', defaultOpts)

-- marks - LEADER m
vim.keymap.set('n', '<Leader>ma', ":lua require('harpoon.mark').add_file()<CR>", defaultOpts)
vim.keymap.set('n', '<Leader>mm', ":lua require('harpoon.ui').toggle_quick_menu()<CR>", defaultOpts)

-- quickfix - LEADER q
vim.keymap.set('n', '<Leader>qd', vim.diagnostic.setqflist, defaultOpts) -- set qf to diagnostics
vim.keymap.set('n', '<Leader>qn', ':cn<CR>', defaultOpts)
vim.keymap.set('n', '<Leader>qp', ':cp<CR>', defaultOpts)

-- symbols - LEADER s
vim.keymap.set('n', '<Leader>s', ':AerialToggle<CR>', defaultOpts)

-- unit tests - LEADER u
vim.keymap.set('n', '<Leader>un', ":lua require('neotest').run.run()<CR>", defaultOpts)
vim.keymap.set('n', '<Leader>uf', ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>", defaultOpts)
vim.keymap.set('n', '<Leader>ud', ":lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<CR>",
        defaultOpts)
vim.keymap.set('n', '<Leader>us', ":lua require('neotest').summary.toggle()<CR>", defaultOpts)

-- database queries - LEADER v
vim.keymap.set('n', '<Leader>vll', ":DB g:dbll ", defaultOpts)
vim.keymap.set('v', '<Leader>vll', ":DB g:dbll<CR>", defaultOpts)

-- debugger - LEADER x
vim.keymap.set('n', '<Leader>xa', ":lua require('dap').run_last()<CR>", defaultOpts)
vim.keymap.set('n', '<Leader>xb', ":lua require('dap').toggle_breakpoint()<CR>", defaultOpts)
vim.keymap.set('n', '<Leader>xc', ":lua require('dap').continue()<CR>", defaultOpts)
vim.keymap.set('n', '<Leader>xf', ":Telescope dap commands<CR>", defaultOpts)
vim.keymap.set('n', '<Leader>xi', ":lua require('dap').step_into()<CR>", defaultOpts)
vim.keymap.set('n', '<Leader>xl', ":lua require('dap').clear_breakpoints()<CR>", defaultOpts)
vim.keymap.set('n', '<Leader>xo', ":lua require('dap').step_over()<CR>", defaultOpts)
vim.keymap.set('n', '<Leader>xq', ":lua require('dap').list_breakpoints()<CR>:copen<CR>", defaultOpts)
vim.keymap.set('n', '<Leader>xr', ":lua require('dap').repl.open()<CR>", defaultOpts)
vim.keymap.set('n', '<Leader>xs', ":lua require('dap').terminate()<CR>", defaultOpts)
vim.keymap.set('n', '<Leader>xu', ":lua require('dap').step_out()<CR>", defaultOpts)
vim.keymap.set('n', '<Leader>xv', ":Telescope dap variables<CR>", defaultOpts)
vim.keymap.set('n', '<Leader>xx', ":lua require('dapui').toggle()<CR>", defaultOpts)

-- yank - LEADER y
vim.keymap.set('n', '<Leader>y', ':let @*=fnamemodify(expand("%"), ":~:.") . ":" . line(".")<CR>', defaultOpts)
