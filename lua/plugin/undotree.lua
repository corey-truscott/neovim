return {
    "mbbill/undotree",
    event = { "VimEnter" },
    config = function ()
        vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<cr>", { desc = "Undotree" })
    end
}
