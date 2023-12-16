-- Stay in visual mode after >>
vim.keymap.set('v', '<<', '<gv', { noremap = true })
vim.keymap.set('v', '>>', '>gv', { noremap = true })
vim.keymap.set('n', ',gf', 'magg<S-v>G=`a', { noremap = true })

-- Navigate panes vim style
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

vim.keymap.set('n', '<Left>', '<C-w><')
vim.keymap.set('n', '<Down>', '<C-w>+')
vim.keymap.set('n', '<Up>', '<C-w>-')
vim.keymap.set('n', '<Right>', '<C-w>>')

-- Yank/Paste to system clipboard settings
vim.keymap.set('v', ',p', '"+p')
vim.keymap.set('v', ',P', '"+P')
vim.keymap.set('v', ',y', '"+y')
vim.keymap.set('v', ',Y', '"+Y')
vim.keymap.set('n', ',p', '"+p')
vim.keymap.set('n', ',P', '"+P')
vim.keymap.set('n', ',y', '"+y')
vim.keymap.set('n', ',Y', '"+Y')
