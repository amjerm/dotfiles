vim.opt_local.spell = true
vim.opt_local.wrap = true
vim.opt_local.colorcolumn = "50,72"

vim.keymap.set("n", "<C-l>", ":!cat commitlint.config.js | rg ", { noremap = true })
vim.keymap.set("i", "<C-l>", "<C-o>:!cat commitlint.config.js | rg ", { noremap = true })
-- vim.keymap.set("v", "<C-l>", 'y:!cat commitlint.config.js | rg expand(@")', { noremap = true })
