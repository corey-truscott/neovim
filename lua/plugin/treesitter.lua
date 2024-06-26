-- go to lua/ensure_installed/init.lua to change what is automatically installed
local ensure = require("user.ensure_installed")

return {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
    build = ":TSUpdate",
    dependencies = {
        {
            "windwp/nvim-ts-autotag",
            opts = {},
        },
        {
            "https://github.com/folke/ts-comments.nvim",
            opts = {},
        },
    },
    opts = {
        ensure_installed = ensure.syntax,
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = { "ruby" },
        },
        indent = { enable = true, disable = { "ruby" } },
    },
}
