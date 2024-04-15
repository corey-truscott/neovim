return {
	"kdheepak/lazygit.nvim",
	event = { "VimEnter" },
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Lazy Git" })
	end,
}
