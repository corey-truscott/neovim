return { -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    version = false,
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        {
            "windwp/nvim-ts-autotag",
            event = { "BufReadPost", "BufWritePost", "BufNewFile" },
            opts = {},
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
    config = function(_, opts)
        ---@diagnostic disable-next-line: missing-fields
        require("nvim-treesitter.configs").setup(opts)
    end,
}
