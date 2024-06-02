if vim.fn.has("nvim-0.10.0") == 0 then
    vim.api.nvim_echo({
        { "the configuration requires neovim version >= 0.10.0\n", "ErrorMsg" },
        {
            "update to a newer version of neovim\n",
            "WarningMsg",
        },
        { "press any key to exit...",                              "MoreMsg" },
    }, true, {})

    vim.fn.getchar()
    vim.cmd.quit()
end

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

-- require options
require("opt.set")
require("opt.remap")

-- start lazy
require("lazy").setup({ import = "plugin" }, {
    change_detection = {
        notify = false,
    },
})
