if vim.fn.has("nvim-0.9.0") == 0 then
  vim.api.nvim_echo({
    { "Configuration requires Neovim >= 0.9.0\n", "ErrorMsg" },
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
		lazyrepo,
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- require options
require("opt.remap")
require("opt.set")

-- start lazy
require("lazy").setup("plugin", {})
