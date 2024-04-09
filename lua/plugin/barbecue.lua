return {
    "utilyre/barbecue.nvim",
    event = { "BufReadPre", "BufNewFile" },
    version = "*",
    dependencies = {
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("barbecue").setup()
    end,
}
