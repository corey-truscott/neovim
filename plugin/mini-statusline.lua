vim.pack.add({
    "https://github.com/nvim-mini/mini.icons",
    "https://github.com/nvim-mini/mini.statusline",
})

require('mini.statusline').setup()

-- make the statusline background the same as the vanilla statusline
local StatusLine = vim.api.nvim_get_hl(0, { name = "StatusLine" }).bg

vim.api.nvim_set_hl(0, "MiniStatuslineFilename", { bg = StatusLine })
vim.api.nvim_set_hl(0, "MiniStatuslineDevinfo",  { bg = StatusLine })
vim.api.nvim_set_hl(0, "MiniStatuslineFileinfo", { bg = StatusLine })
vim.api.nvim_set_hl(0, "MiniStatuslineInactive", { bg = StatusLine })
