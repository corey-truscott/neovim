return {
    "echasnovski/mini.comment",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        hooks = {
            pre = function()
                require("ts_context_commentstring.internal").update_commentstring({})
            end,
        },
    },
}
