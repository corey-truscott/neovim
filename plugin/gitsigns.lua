vim.pack.add({
    "https://github.com/lewis6991/gitsigns.nvim",
})

require("gitsigns").setup({ current_line_blame = true })

vim.keymap.set(
    "n",
    "<leader>gt",
    "<cmd>Gitsigns toggle_current_line_blame<cr>",
    { desc = "Toggle current line blame (Gitsigns)" }
)

vim.keymap.set(
    "n",
    "<leader>gl",
    "<cmd>Gitsigns blame_line<cr>",
    { desc = "Blame line (Gitsigns)" }
)

vim.keymap.set(
    "n",
    "<leader>gb",
    "<cmd>Gitsigns blame<cr>",
    { desc = "Toggle blame (Gitsigns)" }
)
