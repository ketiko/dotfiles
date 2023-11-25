
local opt = vim.opt
opt.autoindent = true          -- Copy indent from current line when starting a new line
opt.autoread = true -- If a file is changed outside of vim, automatically reload it without asking
opt.background = dark
opt.backspace = 'indent'         -- makes backspace work normally
opt.backup = false
opt.backupdir = '~/.config/nvim/backup//'
opt.cmdheight = 2         -- Cmd bar 2 rows high
opt.compatible = false -- vim > vi mode.
opt.complete = '.,w,b,u,t'
opt.completeopt = 'menu,preview'
opt.cursorline = true            -- highlight current line - slow
opt.directory = '~/.config/nvim/swap//'
opt.encoding = 'UTF-8'
opt.errorbells = false        -- No noise
opt.expandtab = true           -- Use spaces not tabs
opt.exrc = true                -- allow local .vimrc files per project
opt.foldenable = false
opt.foldlevel = 1
opt.foldlevelstart = 99
opt.foldmethod = 'syntax' --even with nofoldenable foldmethod=syntax causes slow ins-completions"
opt.foldnestmax = 10
opt.guifont = 'DroidSansMono Nerd Font 11'
opt.hidden = true              -- allow unsaved background buffers and remember marks/undo for them
opt.history = 10000       -- remember more commands and search history
opt.hlsearch = true              -- Highlight searches and search results
opt.ignorecase = true
opt.incsearch = true             -- Show best match while typing a search
opt.infercase = true
opt.joinspaces = false       -- Use only 1 space after "." when joining lines instead of 2
opt.laststatus = 2          -- Always show the status line
opt.lazyredraw = true
opt.linebreak = true           -- Don't wrap text in the middle of a word
opt.list = true
opt.listchars = { tab = ':>.', trail = '.', extends = '#', nbsp = '.' }
opt.matchtime= 2         -- for .2 seconds
opt.maxmempattern = 5000
opt.number = true              -- Show line numbers
opt.numberwidth = 1        -- Try to use only 1 col when possible
opt.report = 0            -- : commands always print changed line count
opt.ruler = true               -- Display position in the file
opt.runtimepath:append({ '~/.fzf' })
opt.scrolloff = 5          -- Keep 5 lines (top/bottom) for scope
opt.shiftwidth = 2        -- Indent level is 2 spaces wide
opt.shortmess = 'atIF'      -- The "Press ENTER or type command to continue" prompt is jarring and usually unnecessary.
opt.showcmd  = true            -- Show partial command in the last line of the screen
opt.showmatch = true            -- Show matched paren when balanced
opt.showtabline = 2
opt.signcolumn = 'yes' -- Always show the signcolumn, otherwise it would shift the text each time diagnostics appear/become resolved. for coc
opt.smartcase  = true -- make searches case-sensitive only if they contain upper-case characters
opt.smartindent = true
opt.smarttab  = true           -- Insert blanks properly at beginning of a line
opt.softtabstop = 2       -- <BS> over an autoindent deletes shiftwidth worth of spaces
opt.splitbelow = true
opt.splitright = true
opt.startofline = false       -- Don't reset cursor to start of line when moving around
opt.swapfile = false
opt.switchbuf = 'useopen'        -- do not move focus/cursor to where the buffer is already open
opt.synmaxcol = 1200      -- Syntax coloring lines that are too long just slows down the world
opt.tabstop = 2           -- Use 2 spaces for <tab>
opt.tagbsearch = true          -- use binary searching for tags
opt.tags:append({ './tags', './ruby-tags', './.git/tags', '~/.rbenv/tags' })
opt.ttyfast = true
opt.undodir = '~/.config/nvim/undo'
opt.undofile = true
opt.undolevels = 1000
opt.undoreload = 10000
opt.updatetime = 300 -- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
opt.vb = true
opt.visualbell = false        -- No blinking
opt.wildignore:append( {'*/tmp/*', '*/.git/*', '*.so', '*.swp', '*.zip', '*/log/*' })
opt.wildmenu = true                    -- make tab completion for files/buffers act like bash
opt.wildmode = 'longest,list,full'  -- First list the available options and complete the longest common part, then have further <Tab>s cycle through the possibilities:
opt.wrap = false
opt.writebackup = false
opt.timeout = false
opt.ttimeout  = false
opt.ttimeoutlen = 100
opt.background = 'dark'

if vim.fn.has('+colorcolumn') then
  opt.colorcolumn = '100'
end

if vim.fn.has('termguicolors') then
  opt.termguicolors = true
end

vim.cmd("let $NVIM_TUI_ENABLE_TRUE_COLOR=1")
