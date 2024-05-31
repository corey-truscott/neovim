return {
    "folke/trouble.nvim",
    cmd = { "Trouble" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        indent_guides = true,
        follow = true,
        auto_refresh = true,
        auto_close = false,
        use_diagnostic_signs = true,
    },
    keys = {
        {
            "<leader>tt",
            function()
                vim.cmd("Trouble diagnostics toggle")
            end,
            desc = "Trouble",
        },

        {
            "<leader>tT",
            function()
                vim.cmd("Trouble diagnostics toggle filter.buf=0")
            end,
            desc = "Trouble (Single buffer)",
        },

        {
            "[q",
            function()
                if require("trouble").is_open() then
                    require("trouble").prev({ skip_groups = true, jump = true })
                else
                    local ok, err = pcall(vim.cmd.cprev)
                    if not ok then
                        vim.notify(err, vim.log.levels.ERROR)
                    end
                end
            end,
            desc = "Previous Trouble/Quickfix Item",
        },

        {
            "]q",
            function()
                if require("trouble").is_open() then
                    require("trouble").next({ skip_groups = true, jump = true })
                else
                    local ok, err = pcall(vim.cmd.cnext)
                    if not ok then
                        vim.notify(err, vim.log.levels.ERROR)
                    end
                end
            end,
            desc = "Next Trouble/Quickfix Item",
        },
    },
}
