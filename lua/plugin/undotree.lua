return {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    keys = {
        {
            "<leader>u",
            function()
                vim.cmd("UndotreeToggle")
            end,
            desc = "Undotree",
        },
    },
}
