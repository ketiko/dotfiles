filetype off

if empty(glob("~/.config/ovim/autoload/plug.vim"))
  silent! execute '!curl --create-dirs -fsSLo ~/.config/ovim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * silent! PlugInstall
endif

silent! if plug#begin()
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
  Plug 'jeetsukumaran/vim-pythonsense'
  Plug 'Vimjas/vim-python-pep8-indent'
  Plug 'davidhalter/jedi-vim'
  Plug 'nvie/vim-flake8'
  Plug 'sheerun/vim-polyglot'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'antoinemadec/coc-fzf'
  Plug 'kevinoid/vim-jsonc'
  Plug 'rakr/vim-two-firewatch'
  Plug 'joshdick/onedark.vim'
  Plug 'KeitaNakamura/neodark.vim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'neovim/nvim-lspconfig'
  Plug '/tfnico/vim-gradle'
  Plug 'Glench/Vim-Jinja2-Syntax'
  Plug 'Konfekt/FastFold'
  Plug 'Lokaltog/vim-easymotion'
  Plug 'MaxMEllon/vim-jsx-pretty'
  Plug 'Quramy/tsuquyomi',
  Plug 'Quramy/vim-dtsm',
  Plug 'Quramy/vim-js-pretty-template',
  Plug 'Raimondi/delimitMate'
  Plug 'Shougo/neco-syntax'
  Plug 'Shougo/vimproc.vim', { 'do': 'make' }
  Plug 'Valloric/ListToggle'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'altercation/vim-colors-solarized'
  Plug 'drewtempelmeyer/palenight.vim'
  Plug 'alvan/vim-closetag'
  Plug 'ap/vim-css-color'
  Plug 'austintaylor/vim-indentobject'
  Plug 'bkad/CamelCaseMotion'
  Plug 'bootleq/vim-textobj-rubysymbol'
  Plug 'burnettk/vim-angular'
  Plug 'chase/vim-ansible-yaml'
  Plug 'christianrondeau/vim-base64'
  Plug 'coderifous/textobj-word-column.vim'
  Plug 'corntrace/bufexplorer'
  Plug 'dbakker/vim-projectroot'
  Plug 'derekwyatt/vim-scala'
  Plug 'ecomba/vim-ruby-refactoring'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'ekalinin/Dockerfile.vim'
  Plug 'elixir-lang/vim-elixir'
  Plug 'gisphm/vim-gradle'
  Plug 'godlygeek/tabular'
  Plug 'ingydotnet/yaml-vim'
  Plug 'jamessan/vim-gnupg'
  Plug 'jason0x43/vim-js-indent',
  Plug 'jelera/vim-javascript-syntax'
  Plug 'jparise/vim-graphql'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'kana/vim-textobj-datetime'
  Plug 'kana/vim-textobj-entire'
  Plug 'kana/vim-textobj-function'
  Plug 'kana/vim-textobj-user'
  Plug 'kchmck/vim-coffee-script'
  Plug 'keith/swift.vim'
  Plug 'leafgarland/typescript-vim'
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'lucapette/vim-textobj-underscore'
  Plug 'majutsushi/tagbar'
  Plug 'hashivim/vim-terraform'
  Plug 'hashivim/vim-vagrant'
  Plug 'maxbrunsfeld/vim-yankstack'
  Plug 'mbbill/undotree'
  Plug 'mhartington/vim-typings',
  Plug 'mhinz/vim-hugefile'
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'mileszs/ack.vim'
  Plug 'mxw/vim-jsx'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'nelstrom/vim-textobj-rubyblock'
  Plug 'nginx/nginx'
  Plug 'othree/html5.vim'
  Plug 'othree/javascript-libraries-syntax.vim'
  Plug 'pangloss/vim-javascript'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
  Plug 'ruanyl/vim-sort-imports'
  Plug 'ryanoasis/vim-devicons'
  Plug 'scrooloose/nerdtree'
  Plug 'sidorares/node-vim-debugger'
  Plug 'sjl/gundo.vim'
  Plug 'slashmili/alchemist.vim'
  Plug 'slim-template/vim-slim'
  Plug 'tomtom/tcomment_vim'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-bundler'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-haml'
  Plug 'tpope/vim-markdown'
  Plug 'tpope/vim-obsession'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-rake'
  Plug 'tpope/vim-rbenv'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-vinegar'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'vim-ruby/vim-ruby'
  Plug 'vim-scripts/JavaScript-Indent'
  Plug 'vim-scripts/argtextobj.vim'
  Plug 'vim-scripts/dbext.vim'
  Plug 'vim-scripts/matchit.zip'
  Plug 'vim-scripts/sudo.vim'
  Plug 'dense-analysis/ale'
  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-notes'
  Plug 'camspiers/animate.vim'
  Plug 'camspiers/lens.vim'

  Plug 'mikelue/vim-maven-plugin'

  " Images
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-media-files.nvim'

  " PlantUML
  Plug 'aklt/plantuml-syntax'
  Plug 'weirongxu/plantuml-previewer.vim'
  Plug 'tyru/open-browser.vim'

  if isdirectory(expand("~/go"))
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  endif

  Plug 'justinmk/vim-sneak'
  Plug 'github/copilot.vim'
  Plug 'edkolev/tmuxline.vim'

  Plug 'rhaiscript/vim-rhai'
  Plug 'rust-lang/rust.vim'

  " coc-java-dependency
  " https://github.com/uzxmx/coc-java-dependency
  Plug 'uzxmx/vim-widgets'

  call plug#end()
endif
