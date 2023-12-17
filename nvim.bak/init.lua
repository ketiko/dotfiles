vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = " "

require("config")

vim.cmd('source $HOME/.config/nvim/old.vim')
