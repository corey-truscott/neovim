if vim.fn.has("nvim-0.10.0") == 0 then
    vim.api.nvim_echo({
        { "Configuration requires Neovim >= 0.10.0\n", "ErrorMsg" },
        { "Press any key to exit", "MoreMsg" },
    }, true, {})
    vim.fn.getchar()
    vim.cmd([[quit]])
    return {}
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local lazyrepo = "https://github.com/folke/lazy.nvim.git"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    print("Downloading lazy.nvim, please wait")
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        lazyrepo,
        lazypath,
    })
end
---
---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- require options
require("opt.set")
require("opt.remap")

-- start lazy
require("lazy").setup({ import = "plugin" }, {
    change_detection = {
        notify = false,
    },
})
