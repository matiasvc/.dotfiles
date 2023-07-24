vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.wrap = false

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.errorbells = false
vim.opt.autochdir = false

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- Show line at column 80
vim.opt.colorcolumn = "100"

-- Show whitespace
vim.opt.list = true
vim.opt.listchars = "tab:▸ ,space:·"

-- Disable mouse
vim.opt.mouse = ""

-- Window splitting settings
vim.opt.splitright = true
vim.opt.splitbelow = true

