return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                -- lua
                null_ls.builtins.formatting.stylua,

                -- python
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,

                -- go
                null_ls.builtins.formatting.gofumpt,
                null_ls.builtins.formatting.golines,

                -- markdown
                null_ls.builtins.formatting.cbfmt,
                null_ls.builtins.formatting.mdformat,
            },
        })
    end,
}
