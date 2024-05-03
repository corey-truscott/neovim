return {
    "ThePrimeagen/harpoon",
    lazy = true,
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        {
            "<leader>mv",
            function()
                require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
            end,
            desc = "Open harpoon menu"
        },
        {
            "<leader>ma",
            function()
                require("harpoon"):list():add()
            end,
            desc = "Append to harpoon list"
        },

        -- normal but slow
        {
            "<leader>mq",
            function()
                require("harpoon"):list():select(1)
            end,
            desc = "Harpoon menu item 1"
        },
        {
            "<leader>mw",
            function()
                require("harpoon"):list():select(2)
            end,
            desc = "Harpoon menu item 2"
        },
        {
            "<leader>me",
            function()
                require("harpoon"):list():select(3)
            end,
            desc = "Harpoon menu item 3"
        },
        {
            "<leader>mr",
            function()
                require("harpoon"):list():select(4)
            end,
            desc = "Harpoon menu item 4"
        },

        -- with alt
        {
            "<M-q>",
            function()
                require("harpoon"):list():select(1)
            end,
            desc = "Harpoon menu item 1"
        },
        {
            "<M-w>",
            function()
                require("harpoon"):list():select(2)
            end,
            desc = "Harpoon menu item 2"
        },
        {
            "<M-e>",
            function()
                require("harpoon"):list():select(3)
            end,
            desc = "Harpoon menu item 3"
        },
        {
            "<M-r>",
            function()
                require("harpoon"):list():select(4)
            end,
            desc = "Harpoon menu item 4"
        },
    }
}
