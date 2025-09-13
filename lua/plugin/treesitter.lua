-- go to lua/ensure_installed/init.lua to change what is automatically installed
local ensure = require("user.ensure_installed")

return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    version = false,
    lazy = false,
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
