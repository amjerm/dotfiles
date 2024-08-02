-- commands
vim.cmd("command! -nargs=+ CLScopes lua CLScopes(<f-args>)")
vim.cmd("command! ClearBG lua ClearBG()")
vim.cmd("command! Bd :up | %bd | e#")

--autocommands
vim.cmd([[autocmd QuickFixCmdPost [^l]* cwindow]])
vim.cmd([[autocmd QuickFixCmdPost l* lwindow]])
vim.cmd([[autocmd BufRead,BufNewFile */git/config set filetype=gitconfig]])
