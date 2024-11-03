-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Move Lines
-- The default mapping for these conflict with i3wm
-- map("n", "J", "<cmd>m .+1<cr>==", { desc = "Move Down" })
-- map("n", "K", "<cmd>m .-2<cr>==", { desc = "Move Up" })
-- map("i", "J", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
-- map("i", "K", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
-- map("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
-- map("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- Switch between source and header using `clangd`
map("n", "<leader>ch", ":ClangdSwitchSourceHeader<CR>", { desc = "Toggle source/header file"})

-- Switch focus to the neo-tree window
map("n", "<leader>o", ":Neotree focus<CR>", { desc="Focus Neotree window"})
