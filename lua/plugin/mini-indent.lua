return {
	"echasnovski/mini.indentscope",
	version = "*",
	config = function()
		require("mini.indentscope").setup({
			draw = {
				delay = 0,
				priority = 2,
			},

			options = {
				border = "both",
				indent_at_cursor = true,
				try_as_border = false,
			},

			symbol = "|",
		})
	end,
}
