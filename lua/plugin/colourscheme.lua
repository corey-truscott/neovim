-- to try and help with the crippling urge to be every colourscheme at once
local colourscheme = {
    nightfox = {
        "EdenEast/nightfox.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            options = {
                transparent = false,
                dim_inactive = true,
                styles = {
                    comments = "italic",
                    variables = "italic",
                    constants = "bold,italic",
                },
            },
        },
        init = function()
            vim.cmd.colorscheme("carbonfox")
        end,
    },

    everforest = {
        "neanias/everforest-nvim",
        priority = 1000,
        lazy = false,
        init = function()
            require("everforest").setup({
                background = "hard",
                italics = false,
                dim_inactive_windows = true,
            })
            vim.cmd.colorscheme("everforest")
        end,
    },

    catpuccin = {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        lazy = false,
        opts = {
            flavour = "mocha", -- latte, frappe, macchiato, mocha
            dim_inactive = {
                enabled = true,
                shade = "dark",
                percentage = 0.40,
            },
            styles = {
                conditionals = { "italic" },
                variables = { "italic" },
                types = { "bold" },
            },
        },
        init = function()
            vim.cmd.colorscheme("catppuccin")
        end,
    },
}

return colourscheme.nightfox
