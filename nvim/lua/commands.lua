-- commands
vim.cmd("command! -nargs=+ CLScopes lua CLScopes(<f-args>)")

--autocommands
vim.cmd [[autocmd FileType html set omnifunc=htmlcomplete#CompleteTags]]
vim.cmd [[autocmd FileType gitcommit set colorcolumn=50,72]]
vim.cmd [[autocmd QuickFixCmdPost [^l]* cwindow]]
vim.cmd [[autocmd QuickFixCmdPost l* lwindow]]
