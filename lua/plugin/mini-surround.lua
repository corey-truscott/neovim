return {
	"echasnovski/mini.surround",
	version = "*",

	config = function()
		require("mini.surround").setup({
			custom_surroundings = nil,

			highlight_duration = 500,

			mappings = {
				add = "ca",
				delete = "cd",
				replace = "cs",
			},

			n_lines = 30,
			respect_selection_type = false,
			search_method = "cover",
			silent = false,
		})
	end,
}
