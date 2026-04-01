vim.pack.add({
    "https://github.com/folke/trouble.nvim",
})

require("trouble").setup()

vim.keymap.set(
    "n",
    "<leader>xX",
    "<cmd>Trouble diagnostics toggle<cr>",
    { desc = "Diagnostics (Trouble)" }
)

vim.keymap.set(
    "n",
    "<leader>xx",
    "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    { desc = "Buffer diagnostics (Trouble)" }
)

vim.keymap.set(
    "n",
    "<leader>xq",
    "<cmd>Trouble qflist toggle<cr>",
    { desc = "Quickfix list (Trouble)" }
)
