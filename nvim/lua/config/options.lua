-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here


-- Display settings
-- vim.opt.nu = true  -- Enable line numbers
-- vim.opt.relativenumber = true  -- Enable relative line numbers
-- vim.opt.termguicolors = true  -- Enable True color support
-- vim.opt.hlsearch = true  -- Highlight all matches of the search pattern
-- vim.opt.incsearch = true  -- Incrementally highlight search results as pattern is typed
-- vim.opt.list = true  -- Show some invisible characters (tabs, trailing spaces, etc.)
-- vim.opt.listchars = "tab:▸ ,space:·"  -- Define the characters to show as tabs and spaces
-- vim.opt.colorcolumn = "100"  -- Highlight column 100
-- vim.opt.wrap = false  -- Disable line wrap
-- vim.opt.signcolumn = "yes"  -- Always show the signcolumn, needed for GitGutter and other plugins

-- Indentation settings
-- vim.opt.tabstop = 2  -- Set tab stops every 2 spaces
-- vim.opt.softtabstop = 2  -- Make a tab or backspace in insert mode behave like it inserted or deleted 2 spaces
-- vim.opt.shiftwidth = 2  -- Set indentation level for >, <, = commands and auto-indentation to 2 spaces
-- vim.opt.expandtab = true  -- Convert tabs to spaces
-- vim.opt.smartindent = true  -- Enable smart auto-indent

-- File and directory settings
-- vim.opt.swapfile = false  -- Disable swap file creation
-- vim.opt.backup = false  -- Disable backup file creation
-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"  -- Set directory for undo files
-- vim.opt.undofile = true  -- Enable persistent undo
-- vim.opt.autochdir = false  -- Disable automatic directory change to current file

-- Mouse and window settings
-- vim.opt.mouse = ""  -- Disable mouse mode
-- vim.opt.splitright = true  -- When splitting a window, put the new window to the right of the current one
-- vim.opt.splitbelow = true  -- When splitting a window, put the new window below the current one

-- Other settings
vim.g.autoformat = false  -- Disable autoformat on save
-- vim.opt.errorbells = false  -- Disable error bells
-- vim.opt.scrolloff = 8  -- Keep 8 lines above and below the cursor when scrolling
-- vim.opt.isfname:append("@-@")  -- Add @-@ to the list of characters that can be part of a filename
-- vim.opt.updatetime = 50  -- Lower updatetime to 50ms for a better 'cursorhold' experience

