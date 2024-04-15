return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("todo-comments").setup()
		local todo = require("todo-comments")

		vim.keymap.set("n", "<leader>tn", function()
			todo.jump_next()
		end, { desc = "Next todo comment" })
		vim.keymap.set("n", "<leader>tp", function()
			todo.jump_prev()
		end, { desc = "Previous todo comment" })
		vim.keymap.set("n", "<leader>tf", "<cmd>TodoQuickFix<cr>", { desc = "Quickfix list of todo comments" })
	end,
}
