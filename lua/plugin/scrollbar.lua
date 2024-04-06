return {
    "petertriho/nvim-scrollbar",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("scrollbar").setup({
            folds = false,
            marks = {
                GitAdd = { text = "│" },
                GitChange = { text = "│" },
                GitDelete = { text = "│" },
            },
        })
    end,
}
