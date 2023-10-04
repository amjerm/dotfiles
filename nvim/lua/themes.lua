-- everforest
vim.g.everforest_background = 'hard'

if vim.wo.diff then
        vim.cmd('colorscheme yui')
else
        -- vim.cmd('colorscheme kanagawa-wave')
        vim.cmd('colorscheme gotham256')
        vim.cmd([[highlight ColorColumn guibg=#091f2e]])
end
