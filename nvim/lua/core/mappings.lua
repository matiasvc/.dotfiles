local map = require('core.functions').map

-- Map leader to Space
map('n', '<Space>', '<NOP>')
vim.g.mapleader = ' '

map('v', '.', ':norm.<CR>')

-- Telescope finder
map('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<CR>]])
map('n', '<leader>fe', [[<cmd>lua require('telescope.builtin').file_browser({hidden=true})<CR>]])
map('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]])
map('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
map('n', '<leader>fr', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]])
map('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]])
map('n', '<leader>fa', [[<cmd>lua require('telescope.builtin').lsp_code_actions()<CR>]])
map('n', '<leader>fo', [[<cmd>lua require('telescope.builtin').vim_options()<CR>]])
map('n', '<leader>fc', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]])
map('n', '<leader>fm', [[<cmd>lua require('telescope.builtin').man_pages()<CR>]])
map('n', '<leader>ft', [[<cmd>lua require('telescope.builtin').treesitter()<CR>]])
