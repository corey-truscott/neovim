vim.pack.add({
    "https://github.com/stevearc/conform.nvim",
})

-- conform looks in $PATH for formatters,
-- so we will just add the location of
-- formatters installed by mason to the $PATH
vim.env.PATH = vim.fn.stdpath("data")
    .. "/mason/bin"
    .. (vim.fn.has("win32") == 1 and ";" or ":")
    .. vim.env.PATH

require("conform").setup({
    formatters_by_ft = {
        python = { "isort", "black" },
        --     lua = { "stylua" },
        --     -- Conform will run multiple formatters sequentially
        --     -- You can customize some of the format options for the filetype (:help conform.format)
        --     rust = { "rustfmt", lsp_format = "fallback" },
        --     -- Conform will run the first available formatter
        --     javascript = { "prettierd", "prettier", stop_after_first = true },
    },
})

vim.keymap.set("n", "<leader>f", function()
    require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format buffer" })
