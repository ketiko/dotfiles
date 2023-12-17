set nocompatible " vim > vi mode.
" set shell=bash\ --login
set viminfo+=n$HOME/.config/ovim/ninfo
set tags+=./tags,./ruby-tags,./.git/tags,~/.rbenv/tags;
set backupdir=$HOME/.config/ovim/backup//

set encoding=UTF-8

" Add let g:ale_disable_lsp = 1 to your vimrc file, before plugins are loaded.
" See https://github.com/dense-analysis/ale#5iii-how-can-i-use-ale-and-cocnvim-together
let g:ale_disable_lsp = 1
source $HOME/.config/ovim/bundles.vim

set runtimepath+=~/.fzf

syntax enable
syntax sync fromstart

" BASIC EDITING CONFIGURATION
set directory=$HOME/.vim/swap//
set autoindent          " Copy indent from current line when starting a new line
set backspace=2         " makes backspace work normally
set cmdheight=2         " Cmd bar 2 rows high
set complete=.,w,b,u,t
set completeopt=menu,preview
set cursorline            " highlight current line - slow
set expandtab           " Use spaces not tabs
set exrc                " allow local .vimrc files per project
set hidden              " allow unsaved background buffers and remember marks/undo for them
set history=10000       " remember more commands and search history
set hlsearch              " Highlight searches and search results
set ignorecase smartcase infercase  " make searches case-sensitive only if they contain upper-case characters
set incsearch             " Show best match while typing a search
set laststatus=2          " Always show the status line
set lazyredraw
set linebreak           " Don't wrap text in the middle of a word
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set matchtime=2         " for .2 seconds
set nobackup
set noerrorbells        " No noise
set nojoinspaces        " Use only 1 space after "." when joining lines instead of 2
set nostartofline       " Don't reset cursor to start of line when moving around
set novisualbell        " No blinking
set nowrap
set nowritebackup
set number              " Show line numbers
set numberwidth=1       " Try to use only 1 col when possible
set report=0            " : commands always print changed line count
set ruler               " Display position in the file
set scrolloff=5         " Keep 5 lines (top/bottom) for scope
set shiftwidth=2        " Indent level is 2 spaces wide
set shortmess=atIF       " The "Press ENTER or type command to continue" prompt is jarring and usually unnecessary.
set showcmd             " Show partial command in the last line of the screen
set showmatch            " Show matched paren when balanced
set showtabline=2
set smartindent
set smarttab            " Insert blanks properly at beginning of a line
set softtabstop=2       " <BS> over an autoindent deletes shiftwidth worth of spaces
set splitbelow
set splitright
set noswapfile
set switchbuf=""        " do not move focus/cursor to where the buffer is already open
set synmaxcol=1200      " Syntax coloring lines that are too long just slows down the world
set t_ti= t_te=         " Prevent Vim from clobbering the scrollback buffer
set tabstop=2           " Use 2 spaces for <tab>
set tagbsearch          " use binary searching for tags
set ttyfast
" set ttyscroll=3
if v:version > 702
  set undofile
  set undodir=$HOME/.config/ovim/undo//
  set undoreload=10000
endif
set undolevels=1000
set vb t_vb=            " No bells. Period.
set wildignore+=*/tmp/*,*/.git/*,*.so,*.swp,*.zip,*/log/*
set wildmenu                    " make tab completion for files/buffers act like bash
set wildmode=longest,list,full  " First list the available options and complete the longest common part, then have further <Tab>s cycle through the possibilities:
set autoread " If a file is changed outside of vim, automatically reload it without asking
set signcolumn=yes " Always show the signcolumn, otherwise it would shift the text each time diagnostics appear/become resolved. for coc
set maxmempattern=5000

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

let mapleader = " "     " change <leader> from \ to <space>

" Per-Filetype Scripts
filetype on             " File type detection on
filetype indent on      " Use filetype-specific indenting when available
filetype plugin on      " Load filetype plugins

set ofu=syntaxcomplete#Complete

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

autocmd FileType c setlocal omnifunc=ccomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType sql setlocal omnifunc=sqlcomplete#CompleteSQL
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType go setlocal omnifunc=v:lua.vim.lsp.omnifunc

let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1
let g:rubycomplete_use_bundler = 1
let g:ruby_operators = 1

let g:java_highlight_functions = 1
let g:java_highlight_all = 1

" clear highlighted search
nmap <silent> \ :nohlsearch<CR>

" make ctrl i increment numbers instead of ctrl a
" noremap <C-i> <C-a>
noremap <leader>i <C-a>

" Stay in visual mode after >>
vnoremap << <gv
vnoremap >> >gv
nnoremap ,gf magg<S-v>G=`a

set notimeout ttimeout ttimeoutlen=100

if exists('+colorcolumn')
  set colorcolumn=100
else
  match ErrorMsg '\%>100v.\+'
end

" Navigate panes vim style
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

nmap <Left> <C-w><
nmap <Down> <C-w>+
nmap <Up> <C-w>-
nmap <Right> <C-w>>

" Yank/Paste to system clipboard settings
if has('unnamedplus')
  vmap ,p "+p
  vmap ,P "+P
  vmap ,y "+y
  vmap ,Y "+Y
  nmap ,p "+p
  nmap ,P "+P
  nmap ,y "+y
  nmap ,Y "+Y
else
  vmap ,p "*p
  vmap ,P "*P
  vmap ,y "*y
  vmap ,Y "*Y
  nmap ,p "*p
  nmap ,P "*P
  nmap ,y "*y
  nmap ,Y "*Y
endif

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
"   " (happens when dropping a file on gvim).
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif

" Spelling
set spell spelllang=en_us
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

if (has("termguicolors"))
  set termguicolors
end
set t_Co=256

set background=dark
if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
end
colorscheme palenight
" Italics for my favorite color scheme
let g:palenight_terminal_italics=1

set guifont=DroidSansMono\ Nerd\ Font\ 11

" vim-rails
let g:rails_projections = {
      \  "app/controllers/*_controller.rb": {
      \      "test": [
      \        "spec/requests/{}_spec.rb",
      \        "spec/requests/{}_controller_spec.rb",
      \        "spec/controllers/{}_controller_spec.rb",
      \        "test/controllers/{}_controller_test.rb"
      \      ],
      \      "alternate": [
      \        "spec/requests/{}_spec.rb",
      \        "spec/requests/{}_controller_spec.rb",
      \        "spec/controllers/{}_controller_spec.rb",
      \        "test/controllers/{}_controller_test.rb"
      \      ],
      \   },
      \   "spec/requests/*_spec.rb": {
      \      "command": "request",
      \      "alternate": [
      \        "app/controllers/{}.rb",
      \        "app/controllers/{}_controller.rb"
      \      ],
      \      "template": "require 'rails_helper'\n\n" .
      \        "RSpec.describe '{}' do\nend",
      \   },
      \ }

" nmap <C-p> :Files<CR>
" nmap <leader>b :Buffers<CR>
let g:fzf_history_dir = '$HOME/.fzf/history'

" Ack
" Ag Settings
" Rg settings
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --hidden\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ackprg = 'ag --hidden --smart-case --vimgrep'
elseif executable('rg')
  " Use ag over grep
  set grepprg=rg\ --vimgrep\ --smart-case\ --follow
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ackprg = 'rg --smart-case --vimgrep'
endif

command! -bang -nargs=* Agc call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
command! -bang -nargs=* Rgc call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>rg :Rg <C-R><C-W><CR>

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" YankStack settings
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

" NERD Tree Settings
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>n :NERDTreeToggle %:p:h<CR>
let g:NERDTreeIgnore = ['^__pycache__$[[dir]]']

" ListToggle
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'

" Syntastic Settings

let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'
" let g:syntastic_json_checkers=['jsonlint']
let g:syntastic_html_tidy_exec = 'tidy5'
let g:syntastic_ruby_checkers = ['mri', 'rubocop', 'reek']
let g:syntastic_yaml_checkers = ['yamllint']
let g:syntastic_python_checkers = ['flake8']

let g:syntastic_aggregate_errors = 1
let g:syntastic_auto_jump = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_mode_map = { "mode": "passive" }

nmap <leader>sc :SyntasticToggleMode<CR>

" Tabgar Settings
map <leader>tb :TagbarToggle<CR>
map <leader>tc :TagbarCurrentTag s<CR>
let g:tagbar_autofocus=1
let g:tagbar_type_go = {
      \ 'ctagstype' : 'go',
      \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
        \ ],
        \ 'sro' : '.',
        \ 'kind2scope' : {
          \ 't' : 'ctype',
          \ 'n' : 'ntype'
          \ },
        \ 'scope2kind' : {
          \ 'ctype' : 't',
          \ 'ntype' : 'n'
          \ },
        \ 'ctagsbin'  : 'gotags',
        \ 'ctagsargs' : '-sort -silent'
\ }

" Tabularize Settings
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
nmap <Leader>a> :Tabularize /=><CR>
vmap <Leader>a> :Tabularize /=><CR>

" Easy Align settings
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" EasyMotion Settings
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_use_smartsign_us = 1
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ;'

" Session Settings
let g:session_autosave = 'no'


      " \ 'coc-metals',
let g:coc_global_extensions = [
      \ 'coc-actions',
      \ 'coc-css',
      \ 'coc-dictionary',
      \ 'coc-docker',
      \ 'coc-emoji',
      \ 'coc-go',
      \ 'coc-gocode',
      \ 'coc-graphql',
      \ 'coc-highlight',
      \ 'coc-html',
      \ 'coc-java',
      \ 'coc-java-dependency',
      \ 'coc-jedi',
      \ 'coc-json',
      \ 'coc-lists',
      \ 'coc-markdownlint',
      \ 'coc-omni',
      \ 'coc-python',
      \ 'coc-sh',
      \ 'coc-snippets',
      \ 'coc-solargraph',
      \ 'coc-sql',
      \ 'coc-syntax',
      \ 'coc-tag',
      \ 'coc-toml',
      \ 'coc-tsserver',
      \ 'coc-word',
      \ 'coc-yaml',
      \ 'coc-yank',
      \ ]
call coc#config('solargraph.shell', $SHELL)

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-@> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
nmap <leader>ca  <Plug>(coc-codeaction-cursor)
xmap <leader>cs  <Plug>(coc-codeaction-selected)
nmap <leader>cs  <Plug>(coc-codeaction-selected)

nmap <leader>fa  :CocFzfList actions<cr>
xmap <leader>fa  :CocFzfList actions<cr>
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>rf <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>rs  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>rs  <Plug>(coc-codeaction-refactor-selected)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)


" Run the Code Lens action on the current line
nmap <leader>wl  <Plug>(coc-codelens-action)


" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" https://github.com/neoclide/coc.nvim/issues/3473
" This is how you correctly patch a colorscheme from your .vimrc:
autocmd VimEnter,ColorScheme * hi! link CocFloating CocHintFloat

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>ld  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>le  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>lc  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>lo  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>ls  :<C-u>CocList -I symbols<cr>

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
" Run gofmt on save
" autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()

" neomake
let g:neomake_open_list = 2
let g:neomake_ruby_enabled_makers = ['mri', 'rubocop', 'reek']

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=Yellow
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=Black

" Folding
set foldmethod=syntax "even with nofoldenable foldmethod=syntax causes slow ins-completions"
set foldlevel=1
set foldlevelstart=99
set foldnestmax=10
set nofoldenable

" vim-instant-markdown
let g:instant_markdown_autostart = 1

" Airline Settings
" let g:airline_theme='solarized'
let g:airline_theme = "palenight"

" vim-go
let g:go_fmt_command = "goimports"
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_auto_type_info = 0
autocmd FileType go setlocal nolist ts=4 sw=4 sts=4
autocmd BufNewFile,BufRead *.go setlocal nolist ts=4 sw=4 sts=4

" closetag
let g:closetag_filenames = "*.html,*.html.erb,*.html,*.xhtml,*.phtml, *.jsx"

let g:gutenttags_ctags_executable_by = 'ripper-tags'
let g:gutentags_ctags_exclude = [
      \ '*.git', '*.svg', '*.hg',
      \ '*/tests/*',
      \ 'build',
      \ 'dist',
      \ '*sites/*/files/*',
      \ 'bin',
      \ 'node_modules',
      \ 'bower_components',
      \ 'cache',
      \ 'compiled',
      \ 'docs',
      \ 'example',
      \ 'bundle',
      \ 'vendor',
      \ '*.md',
      \ '*-lock.json',
      \ '*.lock',
      \ '*bundle*.js',
      \ '*build*.js',
      \ '.*rc*',
      \ '*.json',
      \ '*.min.*',
      \ '*.map',
      \ '*.bak',
      \ '*.zip',
      \ '*.pyc',
      \ '*.class',
      \ '*.sln',
      \ '*.Master',
      \ '*.csproj',
      \ '*.tmp',
      \ '*.csproj.user',
      \ '*.cache',
      \ '*.pdb',
      \ 'tags*',
      \ 'cscope.*',
      \ '*.css',
      \ '*.less',
      \ '*.scss',
      \ '*.exe', '*.dll',
      \ '*.mp3', '*.ogg', '*.flac',
      \ '*.swp', '*.swo',
      \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
      \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
      \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
      \ ]

let g:ruby_path = []

" Ale
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_virtualtext_cursor = 'disabled'
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 0
let g:ale_fixers = {
      \   'ruby': ['rubocop'],
      \   'javascript': ['prettier', 'eslint'],
      \   'typescript': ['prettier', 'eslint'],
      \   'python': ['autoflake', 'autoimport', 'flake8', 'pylint'],
      \}

" vim-stay
set viewoptions=cursor,folds,slash,unix

" javascript-libraries-syntax
let g:used_javascript_libs = 'jquery,angularjs,react'

let g:javascript_plugin_jsdoc = 1
let g:vim_jsx_pretty_highlight_close_tag = 1

" camelCaseMotion
call camelcasemotion#CreateMotionMappings('<leader>')

" These break intellij ideavim
" map <leader><leader>f <Plug>Sneak_f
" map <leader><leader>F <Plug>Sneak_F
" map <leader><leader>t <Plug>Sneak_t
" map <leader><leader>T <Plug>Sneak_T
map <leader><leader>s <Plug>Sneak_s
let g:sneak#label = 1

" Quickly edit/reload the vimrc file
nmap <silent> ,ev :vsplit $MYVIMRC<CR>
nmap <silent> ,eb :vsplit $HOME/.config/ovim/bundles.vim<CR>
nmap <silent> ,sv :source $MYVIMRC<CR>

if filereadable(expand("$HOME/.config/ovim/local.vim"))
  source $HOME/.config/ovim/local.vim
endif
