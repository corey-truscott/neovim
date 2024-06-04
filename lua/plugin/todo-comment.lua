return {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    config = true,
    keys = {
        {
            "<leader>tn",
            function()
                require("todo-comments").jump_next()
            end,
            desc = "Next Todo Comment",
        },
        {
            "<leader>tp",
            function()
                require("todo-comments").jump_prev()
            end,
            desc = "Previous Todo Comment",
        },
        {
            "<leader>tf",
            function()
                if require("trouble").is_open() then
                    require("trouble").close()
                else
                    vim.cmd(":TodoTrouble")
                end
            end,
            desc = "Todo (Trouble)",
        },
    },
}
