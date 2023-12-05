set viminfo+=n$HOME/.config/rvim/ninfo
set tags+=./tags,./ruby-tags,./.git/tags,~/.rbenv/tags;
set backupdir=$HOME/.config/rvim/backup//

source $HOME/.config/rvim/bundles.vim

set runtimepath+=~/.fzf

syntax enable
syntax sync fromstart

set backspace=2         " makes backspace work normally

" BASIC EDITING CONFIGURATION
set listchars=tab:>.,trail:.,extends:#,nbsp:.
if v:version > 702
  set undofile
  set undodir=$HOME/.config/rvim/undo
  set undoreload=10000
endif
set vb t_vb=            " No bells. Period.
set wildignore+=*/tmp/*,*/.git/*,*.so,*.swp,*.zip,*/log/*
set wildmode=longest,list,full  " First list the available options and complete the longest common part, then have further <Tab>s cycle through the possibilities:

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

if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
end
colorscheme palenight
" Italics for my favorite color scheme
let g:palenight_terminal_italics=1


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

" ListToggle
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'

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


" vim-stay
set viewoptions=cursor,folds,slash,unix

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
nmap <silent> ,eb :vsplit $HOME/.config/rvim/bundles.vim<CR>
nmap <silent> ,sv :source $MYVIMRC<CR>

if filereadable(expand("$HOME/.config/rvim/local.vim"))
  source $HOME/.config/rvim/local.vim
endif
