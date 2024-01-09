-- commands
vim.cmd("command! -nargs=+ CLScopes lua CLScopes(<f-args>)")

--autocommands
vim.cmd([[autocmd QuickFixCmdPost [^l]* cwindow]])
vim.cmd([[autocmd QuickFixCmdPost l* lwindow]])
vim.cmd([[autocmd BufRead,BufNewFile */git/config set filetype=gitconfig]])
