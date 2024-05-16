return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	build = function()
		vim.fn["mkdp#util#install"]()
	end,
	keys = {
		{
			"<leader>mt",
			"<CMD>MarkdownPreviewToggle<CR>",
			desc = "Toggle markdown preview",
		},
	},
}
