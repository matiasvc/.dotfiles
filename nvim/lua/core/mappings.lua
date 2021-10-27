local map = require('core.functions').map

-- Map leader to Space
map('n', '<Space>', '<NOP>')
vim.g.mapleader = ' '

-- Window navigation
map('n', '<M-j>', '<C-w>j')
map('n', '<M-k>', '<C-w>k')
map('n', '<M-h>', '<C-w>h')
map('n', '<M-l>', '<C-w>l')

-- Window resizing
map('n', '<C-j>', ':resize -2<CR>')
map('n', '<C-k>', ':resize +2<CR>')
map('n', '<C-h>', ':vertical resize -2<CR>')
map('n', '<C-l>', ':vertical resize +2<CR>')

-- Window splitting
map('n', '<leader>ws', ':split<CR>')
map('n', '<leader>wv', ':vertical split<CR>')
map('n', '<leader>wt', ':tab split<CR>')

-- Window rotating
map('n', '<leader>wr', '<C-w><C-r>')

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
map('n', '<leader>ft', [[<cmd>lua require('telescope.builtin').colorscheme()<CR>]])

