require('lsp-format').setup()

-- neoformat
vim.g.neoformat_try_node_exe = 1
vim.cmd [[ autocmd BufWritePre *.{js,jsx,ts,tsx} Neoformat ]]

-- default format on save (includes rustfmt)
vim.cmd [[ autocmd BufWritePre *.{rs,html,php} lua vim.lsp.buf.format() ]]
