return {
	"lewis6991/gitsigns.nvim",
	event = { "VimEnter" },
	config = function()
		require("gitsigns").setup()

		vim.keymap.set("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", { desc = "Preview hunk" })
		vim.keymap.set("n", "<leader>gj", "<cmd>Gitsigns next_hunk<cr>", { desc = "Next hunk" })
		vim.keymap.set("n", "<leader>gk", "<cmd>Gitsigns prev_hunk<cr>", { desc = "Previous hunk" })
		vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>", { desc = "Toggle Blame" })
	end,
}
