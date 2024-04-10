return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    version = false,
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "comment", "markdown_inline" },

            sync_install = false,
            auto_install = true,

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
            },
        })
    end,
}
