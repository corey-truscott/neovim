vim.pack.add({
    "https://github.com/nvim-lua/plenary.nvim",
    {
        src = "https://github.com/ThePrimeagen/harpoon",
        version = "harpoon2",
    },
})

local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set("n", "<leader>ha", function()
    harpoon:list():add()
end, { desc = "Add to list (Harpoon)" })
vim.keymap.set("n", "<leader>hv", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "View list (Harpoon)" })

vim.keymap.set("n", "<M-q>", function()
    harpoon:list():select(1)
end, { desc = "File 1 (Harpoon)" })

vim.keymap.set("n", "<M-w>", function()
    harpoon:list():select(2)
end, { desc = "File 2 (Harpoon)" })

vim.keymap.set("n", "<M-e>", function()
    harpoon:list():select(3)
end, { desc = "File 3 (Harpoon)" })

vim.keymap.set("n", "<M-r>", function()
    harpoon:list():select(4)
end, { desc = "File 4 (Harpoon)" })

vim.keymap.set("n", "<M-t>", function()
    harpoon:list():select(5)
end, { desc = "File 5 (Harpoon)" })
