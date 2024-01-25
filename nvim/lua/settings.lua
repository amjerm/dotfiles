-- GLOBALS
vim.g.mapleader = ","
vim.g.vim_markdown_conceal = 0
vim.g.vim_markdown_conceal_code_blocks = 0
vim.g["&t_EI"] = "<Esc>]50;CursorShape=3x7"
vim.g["&t_SI"] = "<Esc>]50;CursorShape=1x7"
vim.g["&t_SR"] = "<Esc>]50;CursorShape=2x7"

-- OPTIONS
vim.o.background = "dark"
vim.o.breakindent = true
vim.o.clipboard = "unnamedplus"
vim.o.colorcolumn = "+0,160"
vim.o.cursorline = true
vim.o.encoding = "utf-8"
vim.o.expandtab = true
vim.o.foldenable = false
vim.o.foldmethod = "indent"
vim.o.grepprg = "rg --vimgrep --smart-case"
vim.o.guifont = "MonoLisa:h12"
vim.o.ignorecase = true
vim.o.incsearch = false
vim.o.number = true
vim.o.paste = false
vim.o.pyxversion = 3
vim.o.relativenumber = true
vim.o.showbreak = "… "
vim.o.showtabline = 2
vim.o.smartcase = true
vim.o.softtabstop = 2
vim.o.spell = false
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.startofline = true
vim.o.termguicolors = true
vim.o.updatetime = 300
vim.wo.signcolumn = "yes"

-- highlights
vim.api.nvim_set_hl(0, "Normal", { ctermfg = "NONE", fg = "NONE" })
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#888ca6" })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#2aa889" })
