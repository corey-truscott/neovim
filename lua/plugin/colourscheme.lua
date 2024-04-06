return {
    "sainnhe/everforest",
    config = function()
        vim.cmd [[
        let g:everforest_background = 'hard'
        let g:everforest_better_performance = 1
        ]]

        Colour = Colour or "everforest"
        vim.cmd.colorscheme(Colour)
    end,
}
