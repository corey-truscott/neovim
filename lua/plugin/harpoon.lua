return {
    "ThePrimeagen/harpoon",
    lazy = true,
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function ()
        local harpoon = require("harpoon")
        vim.keymap.set("n", "<M-q>", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<M-w>", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<M-e>", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<M-r>", function() harpoon:list():select(4) end)
    end
}
