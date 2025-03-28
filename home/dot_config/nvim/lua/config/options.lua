-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.shortmess:append({
  F = true, -- don't show X fewer lines in the file etc on modifications
  s = true, -- don't show "search hit BOTTOM, continuing at TOP"
})
vim.opt.spell = true
vim.opt.spelllang = { "en_us" }

-- enable lazyvim autoformatting
vim.g.autoformat = true

vim.opt.termguicolors = true

vim.opt.relativenumber = false
