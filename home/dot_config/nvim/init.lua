vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = " "

require("config/options")
require("config/mappings")
require("config/lazy")

vim.cmd('source $HOME/.config/nvim/old.vim')
