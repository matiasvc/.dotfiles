-- Set the theme style
vim.g.material_style = 'deep ocean'

require('material').setup({
	contrast = true,
	borders = false,
	italics = {
		comments = false,
		keywords = true,
		functions = true,
		strings = false,
		variables = false
	},
	contrast_windows = {
		"terminal",
		"packer"
	},
	disable = {
		background = false,
		term_colors = false,
		eob_lines = true
	}
})

-- Enable the colorscheme
vim.cmd[[colorscheme material]]

