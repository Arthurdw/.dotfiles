vim.opt.termguicolors = true
vim.cmd([[highlight IndentBlanklineIndent1 guibg=#212536 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent2 guibg=#24283B gui=nocombine]])

require("indent_blankline").setup({
	buftype_exclude = { "terminal" },
	filetype_exclude = { "dashboard" },

	char = "",
	char_highlight_list = {
		"IndentBlanklineIndent1",
		"IndentBlanklineIndent2",
	},
	space_char_highlight_list = {
		"IndentBlanklineIndent1",
		"IndentBlanklineIndent2",
	},
	show_trailing_blankline_indent = false,
})
