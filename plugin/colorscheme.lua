local colorscheme = {
    default = function()
        vim.cmd.colorscheme("default")
    end,

    sora = function()
        vim.pack.add({
            "https://github.com/Aejkatappaja/sora",
        })

        vim.cmd.colorscheme("sora")
    end,

    rosepine = function()
        vim.pack.add({
            "https://github.com/rose-pine/neovim",
        })

        vim.cmd.colorscheme("rose-pine")
    end,

    moonfly = function()
        vim.pack.add({
            "https://github.com/bluz71/vim-moonfly-colors",
        })

        vim.cmd.colorscheme("moonfly")
    end,

    terafox = function()
        vim.pack.add({
            "https://github.com/EdenEast/nightfox.nvim",
        })

        vim.cmd.colorscheme("terafox")
    end,

    gruvbox = function()
        vim.pack.add({
            "https://github.com/ellisonleao/gruvbox.nvim",
        })

        -- Default options:
        require("gruvbox").setup({
            contrast = "soft",
            dim_inactive = false,
            transparent_mode = false,
        })

        vim.cmd.colorscheme("gruvbox")
    end,

    kanagawa = function()
        vim.pack.add({
            "https://github.com/rebelot/kanagawa.nvim",
        })

        vim.cmd.colorscheme("kanagawa-lotus")
    end,
}

colorscheme.moonfly()
