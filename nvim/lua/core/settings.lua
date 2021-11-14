vim.o.hidden = true                                 -- hidden buffers
vim.o.swapfile = false                              -- swap files
vim.o.errorbells = false                            -- error sound
vim.o.backup = false                                -- backup file
vim.o.writebackup = false                           -- writing backup file
vim.o.autochdir = true                              -- change directory
vim.o.encoding = "UTF-8"                            -- encoding
vim.o.clipboard = "unnamedplus"                     -- clipboard

vim.o.smarttab = true                               -- smart tabs
vim.o.expandtab = true                              -- expand tabs to spaces
vim.o.autoindent = true
vim.o.expandtab = true
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.smartindent = true
vim.o.modeline = false


vim.cmd('set colorcolumn=999')                      -- color column
vim.wo.number = true                                -- line numbers
vim.wo.relativenumber = true                        -- relative line numbers
vim.wo.wrap = true                                  -- word wrapping
vim.wo.linebreak = true                             -- break at word boundary
vim.wo.cursorline = true                            -- cursor line
vim.o.incsearch = true                              -- incremental search
vim.o.splitright = true                             -- split vertical windows right
vim.o.splitbelow = true                             -- split horizontal windows below
vim.o.updatetime = 250                              -- update time
vim.o.timeoutlen = 300                              -- timeout length
vim.o.showmode = false                              -- mode message
vim.o.mouse = "a"                                   -- mouse
vim.g.tex_flavor = "latex"                          -- tex flavor
vim.o.scrolloff = 12                                -- start scrolling before end of buffer

vim.o.list = true                                   -- show whitespace
vim.o.listchars = "tab:▸ ,space:·"                  -- set whitespace character

