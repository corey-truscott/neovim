return {
    {
        "sainnhe/everforest",
        priority = 1000,
        init = function()
            vim.cmd.colorscheme("everforest")
        end,
    },
    {
        "xiyaowong/transparent.nvim",
        config = function()
            require("transparent").setup({})
        end,
    },
}
