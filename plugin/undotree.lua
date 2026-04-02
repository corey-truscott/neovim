-- undotree was added in 0.12 as an in-built undotree
vim.cmd.packadd("nvim.undotree")
vim.keymap.set("n", "<leader>u", function()
    require("undotree").open({
        command = math.floor(vim.api.nvim_win_get_width(0) / 3) .. "vnew",
    })
end, { desc = "Undotree" })
