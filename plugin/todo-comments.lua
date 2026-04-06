vim.pack.add({
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/folke/todo-comments.nvim",
})

require("todo-comments").setup()

vim.keymap.set("n", "]t", function()
    require("todo-comments").jump_next()
end, { desc = "Next Todo comment" })

vim.keymap.set("n", "[t", function()
    require("todo-comments").jump_prev()
end, { desc = "Previous Todo comment" })

vim.keymap.set("n", "<leader>tt", "<cmd>TodoTrouble toggle<cr>", { desc = "Todo Trouble" })
