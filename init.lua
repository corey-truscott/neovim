-- checks if neovim version is above 0.10
require("util.check_version")

-- require options
require("opt.set")
require("opt.remap")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local lazyrepo = "https://github.com/folke/lazy.nvim.git"
---@diagnostic disable-next-line: undefined-field
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    print("Downloading lazy.nvim " .. "(" .. lazyrepo .. ")")
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        lazyrepo,
        lazypath,
    })
end
---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- start lazy
require("lazy").setup({ import = "plugin" }, {
    change_detection = {
        notify = false,
    },
})
