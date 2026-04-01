vim.pack.add({
    "https://github.com/nvim-mini/mini.icons",
    "https://github.com/stevearc/oil.nvim",
})

require('mini.icons').setup()
require("oil").setup({
    default_file_explorer = true,
    view_options = {
        show_hidden = true,
    },
    float = {
        -- Padding around the floating window
        padding = 2,
        max_width = 0,
        max_height = 0,
        border = "rounded",
        win_options = {
            winblend = 0,
        },
    },
})

vim.keymap.set(
    "n",
    "-",
    function()
        require("oil").open_float()
    end,
    { desc = "Open file explorer (oil)" }
)
