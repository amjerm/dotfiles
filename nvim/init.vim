set runtimepath^=~/.nvim runtimepath+=~/.nvim/after
let &packpath = &runtimepath

set shell=/bin/zsh

lua require('init')

syntax on
filetype plugin on
set hidden
