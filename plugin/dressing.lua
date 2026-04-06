-- WARN:
-- i know this plugin is archived, but i havent found a great replacment for it
-- snacks.nvim doesnt work as well in my opinion, plus it adds a bunch of extra
-- stuff i dont want
vim.pack.add({
    "https://github.com/stevearc/dressing.nvim",
})

require("dressing").setup()
