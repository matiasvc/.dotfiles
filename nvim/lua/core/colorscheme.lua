-- Set the theme style
vim.g.material_style = 'deep ocean'

local colors = require('material.colors')

require('material').setup({
  custom_highlights = {
    TreesitterContext = { bg = colors.selection }
  }
})

-- Enable the colorscheme
vim.cmd[[colorscheme material]]

