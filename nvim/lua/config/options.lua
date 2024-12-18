-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.autoformat = false -- Auto-format on save
vim.opt.colorcolumn = "120" -- Highlight column 120

-- Recommended options for `avante.nvim`
-- views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3


-- Disable the mouse
vim.opt.mouse = ""


-- Disable lsp logging
vim.lsp.set_log_level("OFF")
