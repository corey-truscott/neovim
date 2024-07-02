return {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    config = true,
    keys = {
        {
            "]t",
            function()
                require("todo-comments").jump_next()
            end,
            desc = "Next Todo Comment",
        },
        {
            "[t",
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
