-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Leader Key
vim.g.mapleader = " "  -- Set leader key to space

-- Line Manipulation
vim.keymap.set("n", "J", "mzJ`z")  -- Append line below with a space, without moving the cursor
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")  -- Move selected lines down in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")  -- Move selected lines up in visual mode

-- Navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz")  -- Half-page down while keeping cursor in center
vim.keymap.set("n", "<C-u>", "<C-u>zz")  -- Half-page up while keeping cursor in center
vim.keymap.set("n", "n", "nzzzv")  -- Jump to next search term while keeping cursor in center
vim.keymap.set("n", "N", "Nzzzv")  -- Jump to previous search term while keeping cursor in center

-- Quickfix Navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")  -- Jump to next error in quickfix list
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")  -- Jump to previous error in quickfix list
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")  -- Jump to next location in location list
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")  -- Jump to previous location in location list

-- Clipboard Manipulation
vim.keymap.set("x", "<leader>p", "\"_dP")  -- Paste in visual mode without overwriting paste buffer
vim.keymap.set("n", "<leader>y", "\"+y")  -- Yank into system clipboard in normal mode
vim.keymap.set("v", "<leader>y", "\"+y")  -- Yank into system clipboard in visual mode
vim.keymap.set("n", "<leader>Y", "\"+Y")  -- Yank whole line into system clipboard in normal mode
vim.keymap.set("n", "<leader>p", "\"+p")  -- Paste from system clipboard in normal mode
vim.keymap.set("v", "<leader>p", "\"+p")  -- Paste from system clipboard in visual mode

-- Miscellaneous
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")  -- Switch project with tmux session
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])  -- Perform a case-insensitive regex substitution of the word under the cursor
vim.keymap.set("n", "<leader>h", ":ClangdSwitchSourceHeader<CR>")  -- Switch between source and header files with clangd (LSP specific)

-- Buffer Navigation
vim.keymap.set("n", "<leader>bn", ":bnext<CR>")  -- Go to next buffer
vim.keymap.set("n", "<leader>bp", ":bprev<CR>")  -- Go to previous buffer
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>")  -- Delete current buffer

-- Visual Mode
vim.keymap.set("v", "<", "<gv")  -- Indent text to the left and reselect in visual mode
vim.keymap.set("v", ">", ">gv")  -- Indent text to the right and reselect in visual mode
