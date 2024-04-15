return {
	"stevearc/oil.nvim",

	config = function()
		require("oil").setup({})
        vim.keymap.set("n", "<leader>o", "<cmd>Oil<cr>", { desc = "Oil" })
	end,
}
