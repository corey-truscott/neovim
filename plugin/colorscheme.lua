local colorscheme = {
    sora = function()
        vim.pack.add({
            "https://github.com/Aejkatappaja/sora",
        })

        vim.cmd.colorscheme('sora')
    end,

    rosepine = function()
        vim.pack.add({
            "https://github.com/rose-pine/neovim",
        })

        vim.cmd.colorscheme('rose-pine')
    end,

    moonfly = function()
        vim.pack.add({
            "https://github.com/bluz71/vim-moonfly-colors",
        })

        vim.cmd.colorscheme('moonfly')
    end,
}

colorscheme.sora()
