set nocompatible " vim > vi mode.
set shell=bash\ --login
set runtimepath+=$HOME/.vim
set viminfo+=n$HOME/.viminfo

call pathogen#runtime_append_all_bundles()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC EDITING CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
" allow unsaved background buffers and remember marks/undo for them
set hidden
" remember more commands and search history
set history=10000
set tabstop=2           " Use 2 spaces for <tab>
set shiftwidth=2        " Indent level is 2 spaces wide
set softtabstop=2       " <BS> over an autoindent deletes shiftwidth worth of spaces
set smarttab            " Insert blanks properly at beginning of a line
set autoindent          " Copy indent from current line when starting a new line
set expandtab           " Use spaces not tabs
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set list
set smartindent
set laststatus=2        " Always show the status line
set showmatch           " Show matched paren when balanced
set incsearch           " Show best match while typing a search
set hlsearch            " Highlight searches and search results
set gdefault            " Default to /g global replace
" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase
" highlight current line
set cursorline
set cmdheight=2         " Cmd bar 2 rows high
set switchbuf=useopen
set numberwidth=5
set showtabline=2
" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=
set scrolloff=5         " Keep 5 lines (top/bottom) for scope
" Store temporary files in a central spot
"set backup
"set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
"set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backspace=2         " makes backspace work normally
" display incomplete commands
set showcmd             " Show partial command in the last line of the screen
" Enable highlighting for syntax
syntax on
" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on
" First list the available options and complete the longest common part, then have further <Tab>s cycle through the possibilities:
set wildmode=list:longest,full
" make tab completion for files/buffers act like bash
set wildmenu            " Menu completion in command mode on <Tab>
" change <leader> from \ to ,
let mapleader = ","
" search first in current directory then file directory for tag file
:set tags+=./tags;
set nostartofline       " Avoid moving cursor to BOL when moving
set matchtime=2         " for .2 seconds
set linebreak           " Don't wrap text in the middle of a word
set mouse+=a             " Always enable mouse
set clipboard+=unnamed  " Makes using clipboard easier
set ai                  " Auto indent
set si                  " Smart indent
" Stay in visual mode after >>
vnoremap << <gv
vnoremap >> >gv
nmap ,gf magg<S-v>G=`a
" clear highlighted search using the space bar
nnoremap <Space> :nohlsearch<CR>
set number              " Show line numbers
set numberwidth=1       " Try to use only 1 col when possible
"set textwidth=110       " Sets the max width text can be before vim inserts a linebreak
" Highlights text after going over the max text width
set nowrap  " Line wrapping off
set guioptions+=c       " Use console dialogs instead of popup dialogs for simple choices
set guioptions-=T       " Remove toolbar
set guioptions-=r       " Remove right-hand scroll bar
set guioptions-=m       " Removes the menu
set vb t_vb=            " No bells. Period.
set novisualbell        " No blinking
set noerrorbells        " No noise
set report=0            " : commands always print changed line count
set shortmess+=a        " Use [+]/[RO]/[w] for modified/readonly/written
set ruler               " Display position in the file

" Set vim working dir to the files current directory
autocmd BufEnter * silent! lcd %:p:h
autocmd BufRead *.rst silent! set textwidth=80

"
" Reading/Writing
"
set noautowrite         " Never write a file unless requested to
set noautowriteall      " Seriously.
set modeline            " Let vim options be embedded in files;
set modelines=5         " when in first or last 5 lines
set ffs=unix,dos,mac    " Try and recognize line endings in that order

"
" Backup / Swap files
"
set nobackup
set nowritebackup
set noswapfile

"
" Per-Filetype Scripts
"
filetype on             " File type detection on
filetype indent on      " Use filetype-specific indenting when available
filetype plugin on      " Load filetype plugins
set ofu=syntaxcomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType sql set omnifunc=sqlcomplete#CompleteSQL
autocmd BufRead *.spark set filetype=html

"
" Key Mappings
"
map th :tabfirst<CR>
map tk :tabnext<CR>
map <C-Tab> :tabnext<CR>
map <S-Tab> :tabprev<CR>
map tj :tabprev<CR>
map tl :tablast<CR>
map tt :tabedit<Space>
map tn :tabnext<Space>
map tm :tabm<Space>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <A-k> <C-w>+
map <A-j> <C-w>-
map <A-l> <C-w>>
map <A-h> <C-w><

map <F7> :setlocal spell! spell?<CR>

" NERD Tree Settings
map <F4> :NERDTreeFind<CR>
map <F3> :NERDTreeToggle<CR>
