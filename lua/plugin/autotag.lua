return {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require 'nvim-treesitter.configs'.setup {
            autotag = {
                enable = true,
            }
        }
    end
}
