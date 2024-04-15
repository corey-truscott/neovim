return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		vim.keymap.set("n", "<leader>mv", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)
		vim.keymap.set("n", "<leader>ma", function()
			harpoon:list():add()
		end)

		vim.keymap.set("n", "<leader>mq", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<leader>mw", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<leader>me", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<leader>mr", function()
			harpoon:list():select(4)
		end)

		vim.keymap.set("n", "<M-q>", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<M-w>", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<M-e>", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<M-r>", function()
			harpoon:list():select(4)
		end)
	end,
}
