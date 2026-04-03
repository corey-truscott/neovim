if vim.fn.has("nvim-0.12.0") == 0 then
  vim.api.nvim_echo({
    { "Configuration requires Neovim >= 0.12.0, most stuff will probably break.\n", "ErrorMsg" },
  }, true, {})
  vim.fn.getchar()
  return {}
end

require("opt.set")
require("opt.remap")
