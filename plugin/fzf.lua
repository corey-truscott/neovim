vim.pack.add({
    "https://github.com/ibhagwan/fzf-lua",
})

require("fzf-lua").setup({
    keymap = {
        fzf = {
            ["ctrl-q"] = "select-all+accept",
        },
    },
})

vim.keymap.set("n", "<leader>pv", function()
    require("fzf-lua").files()
end, { desc = "Find files (fzf-lua)" })

vim.keymap.set("n", "<leader>ps", function()
    require("fzf-lua").live_grep()
end, { desc = "Grep files (fzf-lua)" })

vim.keymap.set("n", "<leader>pw", function()
    require("fzf-lua").grep_cword()
end, { desc = "Grep word under cursor (fzf-lua)" })

vim.keymap.set("n", "<leader>pW", function()
    require("fzf-lua").grep_cWORD()
end, { desc = "Grep WORD under cursor (fzf-lua)" })

vim.keymap.set("n", "<leader>pb", function()
    require("fzf-lua").buffers()
end, { desc = "View buffers (fzf-lua)" })

vim.keymap.set("n", "<leader>pt", function()
    require("fzf-lua").tabs()
end, { desc = "View tabs (fzf-lua)" })

vim.keymap.set("n", "<leader>po", function()
    require("fzf-lua").oldfiles()
end, { desc = "Recent files (fzf-lua)" })
