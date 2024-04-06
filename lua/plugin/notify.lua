return {
    "rcarriga/nvim-notify",
    config = function()
        vim.notify = require("notify")

        require('notify').setup {
            background_colour = "#272e33",
            render = "compact",
            max_width = 100,
        }
    end
}
