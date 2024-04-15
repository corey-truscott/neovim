return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-tree/nvim-web-devicons" },
	},
	config = function()
		require("telescope").setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})
		pcall(require("telescope").load_extension, "ui-select")

		-- see `:help telescope.builtin`
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>pv", builtin.find_files, { desc = "Search Files" })
		vim.keymap.set("n", "<leader>ps", builtin.live_grep, { desc = "Search by Grep" })
		vim.keymap.set("n", "<leader>pb", builtin.buffers, { desc = "Find existing buffers" })
		vim.keymap.set("n", "<leader>ph", builtin.help_tags, { desc = "Search Help" })
		vim.keymap.set("n", "<leader>pk", builtin.keymaps, { desc = "Search Keymaps" })
		vim.keymap.set("n", "<leader>pr", builtin.oldfiles, { desc = "Search Recent Files" })
	end,
}
