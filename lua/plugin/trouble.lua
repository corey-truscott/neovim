return {
	"folke/trouble.nvim",
	event = { "VimEnter" },
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	config = function()
		vim.keymap.set("n", "<leader>tt", function()
			require("trouble").toggle()
		end, { desc = "Toggle diagnosics" })
	end,
}
