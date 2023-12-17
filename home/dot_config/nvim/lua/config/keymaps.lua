-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--- Clear search with <esc>
vim.keymap.set({ "i", "n" }, "\\", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
