-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--- Clear search with <esc>
-- vim.keymap.set({ "i", "n" }, "\\", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Yank/Paste to system clipboard settings
vim.keymap.set("v", ",p", '"+p')
vim.keymap.set("v", ",P", '"+P')
vim.keymap.set("v", ",y", '"+y')
vim.keymap.set("v", ",Y", '"+Y')
vim.keymap.set("n", ",p", '"+p')
vim.keymap.set("n", ",P", '"+P')
vim.keymap.set("n", ",y", '"+y')
vim.keymap.set("n", ",Y", '"+Y')

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, {})

vim.keymap.set("n", ",gf", "magg<S-v>G=`a")
vim.keymap.set("n", "\\", ":nohlsearch<CR>")
