vim.opt.tags:append("./tags")

vim.opt.autoindent = true          -- Copy indent from current line when starting a new line
vim.opt.autoread = true -- If a file is changed outside of vim, automatically reload it without asking
vim.opt.backspace = 2         -- makes backspace work normally
vim.opt.cmdheight = 2         -- Cmd bar 2 rows high
vim.opt.complete = .,w,b,u,t
vim.opt.completeopt = menu,preview
vim.opt.cursorline = true            -- highlight current line - slow
vim.opt.encoding = "utf-8"
vim.opt.expandtab = true           -- Use spaces not tabs
vim.opt.exrc = true                -- allow local .vimrc files per project
vim.opt.hidden  = true             -- allow unsaved background buffers and remember marks/undo for them
vim.opt.history = 10000       -- remember more commands and search history
vim.opt.hlsearch = true              -- Highlight searches and search results
vim.opt.ignorecase smartcase infercase  -- make searches case-sensitive only if they contain upper-case characters
vim.opt.incsearch = true             -- Show best match while typing a search
vim.opt.laststatus = 2          -- Always show the status line
vim.opt.lazyredraw = true
vim.opt.linebreak = true           -- Don't wrap text in the middle of a word
vim.opt.list = true
vim.opt.listchars = tab:>.,trail:.,extends:#,nbsp:.
vim.opt.matchtime = 2         -- for .2 seconds
vim.opt.maxmempattern = 5000
vim.opt.backup = false
vim.opt.errorbells = false        -- No noise
vim.opt.joinspaces = false        -- Use only 1 space after "." when joining lines instead of 2
vim.opt.startofline = false       -- Don't reset cursor to start of line when moving around
vim.opt.swapfile = false
vim.opt.visualbell = false        -- No blinking
vim.opt.wrap = false
vim.opt.writebackup = false
vim.opt.number = true              -- Show line numbers
vim.opt.numberwidth = 1       -- Try to use only 1 col when possible
vim.opt.report = 0            -- : commands always print changed line count
vim.opt.ruler = true               -- Display position in the file
vim.opt.scrolloff = 5         -- Keep 5 lines (top/bottom) for scope
vim.opt.shiftwidth = 2        -- Indent level is 2 spaces wide
vim.opt.shortmess = atIF       -- The "Press ENTER or type command to continue" prompt is jarring and usually unnecessary.
vim.opt.showcmd = true             -- Show partial command in the last line of the screen
vim.opt.showmatch = true            -- Show matched paren when balanced
vim.opt.showtabline = 2
vim.opt.signcolumn = yes -- Always show the signcolumn, otherwise it would shift the text each time diagnostics appear/become resolved. for coc
vim.opt.smartindent = true
vim.opt.smarttab = true            -- Insert blanks properly at beginning of a line
vim.opt.softtabstop = 2       -- <BS> over an autoindent deletes shiftwidth worth of spaces
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.switchbuf = ""        -- do not move focus/cursor to where the buffer is already open
vim.opt.synmaxcol = 1200      -- Syntax coloring lines that are too long just slows down the world
vim.opt.t_ti =  ""         -- Prevent Vim from clobbering the scrollback buffer
vim.opt.t_te = ""        -- Prevent Vim from clobbering the scrollback buffer
vim.opt.tabstop = 2           -- Use 2 spaces for <tab>
vim.opt.tagbsearch = true          -- use binary searching for tags
vim.opt.ttyfast = true
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000
vim.opt.updatetime = 300 -- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
vim.opt.vb t_vb =             -- No bells. Period.
vim.opt.wildignore+ = */tmp/*,*/.git/*,*.so,*.swp,*.zip,*/log/*
vim.opt.wildmenu = true                    -- make tab completion for files/buffers act like bash
vim.opt.wildmode = longest,list,full  -- First list the available options and complete the longest common part, then have further <Tab>s cycle through the possibilities:

vim.opt.termguicolors = true
vim.opt.background = dark
vim.opt.colorcolumn = 100
vim.opt.cursorline = true

vim.opt.runtimepath:append("~/..fzf") -- Add local config to runtime path

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter = blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch = stable", -- latest stable release
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

require"-lazy").setup({
  "folke/which-key.nvim",
})
