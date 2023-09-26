local null_ls = require("null-ls")

null_ls.setup({
        sources = {
                -- diagnostics
                -- null_ls.builtins.diagnostics.commitlint,
                null_ls.builtins.diagnostics.deno_lint,
                null_ls.builtins.diagnostics.tsc,
                null_ls.builtins.diagnostics.eslint,
                -- code actions
                null_ls.builtins.code_actions.eslint,
                null_ls.builtins.code_actions.refactoring,
                -- completion
                null_ls.builtins.completion.spell,
                -- formatting
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.deno_fmt,
                null_ls.builtins.formatting.eslint,
        },
})
