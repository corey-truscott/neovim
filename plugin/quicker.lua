vim.pack.add({
    "https://github.com/stevearc/quicker.nvim",
})

require("quicker").setup()

vim.keymap.set("n", "<leader>q", function()
    require("quicker").toggle()
end, { desc = "Toggle quickfix" })

vim.keymap.set("n", "<leader>l", function()
    require("quicker").toggle({ loclist = true })
end, { desc = "Toggle loclist" })
