return {
    "ThePrimeagen/harpoon",
    lazy = true,
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        settings = {
            save_on_toggle = true,
        },
    },
    keys = function()
        local keys = {
            {
                "<leader>mv",
                function()
                    require("harpoon").ui:toggle_quick_menu(
                        require("harpoon"):list()
                    )
                end,
                desc = "Open harpoon menu",
            },
            {
                "<leader>ma",
                function()
                    require("harpoon"):list():add()
                end,
                desc = "Append to harpoon list",
            },
        }

        local harpoonKeys = { "q", "w", "e", "r", "t", "y" }
        for i = 1, #harpoonKeys do
            -- keybinds with alt
            table.insert(keys, {
                "<M-" .. harpoonKeys[i] .. ">",
                function()
                    require("harpoon"):list():select(i)
                end,
                desc = "Harpoon to File " .. i,
            })

            -- keybinds with <leader>m
            table.insert(keys, {
                "<leader>m" .. harpoonKeys[i],
                function()
                    require("harpoon"):list():select(i)
                end,
                desc = "Harpoon to File " .. i,
            })
        end
        return keys
    end,
}
