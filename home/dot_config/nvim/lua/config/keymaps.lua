-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--- Clear search with <esc>
vim.keymap.set({ "i", "n" }, "\\", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- vim.keymap.set({ "n" }, "<Left>", "<C-w><", { desc = "Resize pane left" })
-- vim.keymap.set({ "n" }, "<Down>", "<C-w>+", { desc = "Resize pane down" })
-- vim.keymap.set({ "n" }, "<Up>", "<C-w>-", { desc = "Resize pane up" })
-- vim.keymap.set({ "n" }, "<Right>", "<C-w>>", { desc = "Resize pane right" })
