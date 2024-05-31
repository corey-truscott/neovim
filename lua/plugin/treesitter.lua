return {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
    build = ":TSUpdate",
    dependencies = {
        {
            "windwp/nvim-ts-autotag",
            -- event = { "BufReadPost", "BufWritePost", "BufNewFile" },
            opts = {},
        },
        {
            "https://github.com/folke/ts-comments.nvim",
            opts = {},
            event = { "BufReadPost", "BufWritePost", "BufNewFile" },
        },
    },
    opts = {
        ensure_installed = { "comment", "markdown_inline" },
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = { "ruby" },
        },
        indent = { enable = true, disable = { "ruby" } },
    },
}
