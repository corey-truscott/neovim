return {
    "echasnovski/mini.pairs",
    event = { "BufReadPre", "BufNewFile" },
    config = function(_, opts)
        require("mini.pairs").setup(opts)
    end,
}
