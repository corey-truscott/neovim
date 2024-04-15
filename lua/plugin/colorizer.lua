return {
    "norcalli/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    version = "*",
    config = function()
        require("colorizer").setup()
    end,
}
