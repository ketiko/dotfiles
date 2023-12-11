local opt = vim.opt

opt.backup = false
opt.clipboard = "unnamedplus"
opt.cmdheight = 2         -- Cmd bar 2 rows high
opt.complete = '.,w,b,u,t'
opt.completeopt = 'menu,preview'
opt.cursorline = true            -- highlight current line - slow
opt.errorbells = false        -- No noise
opt.expandtab = true           -- Use spaces not tabs
opt.exrc = true                -- allow local .vimrc files per project
opt.foldenable = false
opt.foldlevel = 1
opt.foldlevelstart = 99
opt.foldmethod = 'syntax' --even with nofoldenable foldmethod=syntax causes slow ins-completions"
opt.foldnestmax = 10
opt.guifont = 'DroidSansMono Nerd Font 11'
opt.ignorecase = true
opt.infercase = true
opt.joinspaces = false       -- Use only 1 space after "." when joining lines instead of 2
opt.linebreak = true           -- Don't wrap text in the middle of a word
opt.list = true
opt.matchtime= 2         -- for .2 seconds
opt.maxmempattern = 5000
opt.number = true              -- Show line numbers
opt.numberwidth = 1        -- Try to use only 1 col when possible
opt.scrolloff = 5          -- Keep 5 lines (top/bottom) for scope
opt.shiftwidth = 2        -- Indent level is 2 spaces wide
opt.shortmess = 'astIF'      -- The "Press ENTER or type command to continue" prompt is jarring and usually unnecessary.
opt.showmatch = true            -- Show matched paren when balanced
opt.showtabline = 2
opt.signcolumn = 'yes' -- Always show the signcolumn, otherwise it would shift the text each time diagnostics appear/become resolved. for coc
opt.smartcase  = true -- make searches case-sensitive only if they contain upper-case characters
opt.smartindent = true
opt.softtabstop = 2       -- <BS> over an autoindent deletes shiftwidth worth of spaces
opt.spell = true
opt.spelllang = { 'en_us' }
opt.splitbelow = true
opt.splitright = true
opt.startofline = false       -- Don't reset cursor to start of line when moving around
opt.swapfile = false
opt.synmaxcol = 1200      -- Syntax coloring lines that are too long just slows down the world
opt.tabstop = 2           -- Use 2 spaces for <tab>
opt.tagbsearch = true          -- use binary searching for tags
opt.tags = { "./tags", "./ruby-tags", "./.git/tags", "~/.rbenv/tags" }
opt.termguicolors = true
opt.timeout = true
opt.timeoutlen = 400
opt.ttimeout  = true
opt.ttimeoutlen = 300
opt.undofile = true
opt.undolevels = 1000
opt.undoreload = 10000
opt.updatetime = 300 -- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
opt.visualbell = false
opt.wildignore = { "*/tmp/*", "*/.git/*", "*.so", "*.swp", "*.zip", "*/log/*" }
opt.wrap = false
opt.writebackup = false
