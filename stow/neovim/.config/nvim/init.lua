local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath,
        })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup(
    {
        {
            'nvimdev/dashboard-nvim',
            event = 'VimEnter',
            config = function()
                require('dashboard').setup {
                    -- config
                }
            end,
            dependencies = { {'nvim-tree/nvim-web-devicons'}}
        },
        {
            'folke/which-key.nvim',
            event = "VeryLazy",
            init = function()
                vim.o.timeout = true
                vim.o.timeoutlen = 300
            end,
            opts = {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        },
        'KeitaNakamura/neodark.vim',
        'Konfekt/FastFold',
        'Lokaltog/vim-easymotion',
        'Quramy/tsuquyomi',
        'Quramy/vim-dtsm',
        'Raimondi/delimitMate',
        'Valloric/ListToggle',
        'Xuyuanp/nerdtree-git-plugin',
        'altercation/vim-colors-solarized',
        'alvan/vim-closetag',
        'austintaylor/vim-indentobject',
        'bkad/CamelCaseMotion',
        'camspiers/animate.vim',
        'camspiers/lens.vim',
        'christianrondeau/vim-base64',
        'coderifous/textobj-word-column.vim',
        'corntrace/bufexplorer',
        'dbakker/vim-projectroot',
        'drewtempelmeyer/palenight.vim',
        'editorconfig/editorconfig-vim',
        'edkolev/tmuxline.vim',
        'github/copilot.vim',
        'godlygeek/tabular',
        'jamessan/vim-gnupg',
        'joshdick/onedark.vim',
        'junegunn/fzf.vim',
        'junegunn/vim-easy-align',
        'justinmk/vim-sneak',
        'lucapette/vim-textobj-underscore',
        'majutsushi/tagbar',
        'maxbrunsfeld/vim-yankstack',
        'mbbill/undotree',
        'mhartington/vim-typings',
        'mhinz/vim-hugefile',
        'michaeljsmith/vim-indent-object',
        'jay-babu/mason-null-ls.nvim',
        'jose-elias-alvarez/null-ls.nvim',
        'mileszs/ack.vim',
        'nathanaelkane/vim-indent-guides',
        'neovim/nvim-lspconfig',
        'nvim-lua/plenary.nvim',
        'nvim-lua/popup.nvim',
        'nvim-telescope/telescope-media-files.nvim',
        'uga-rosa/cmp-dictionary',
        'williamboman/mason-lspconfig.nvim',
        'williamboman/mason.nvim',
        'nvim-telescope/telescope.nvim',
        'rakr/vim-two-firewatch',
        'hrsh7th/cmp-omni',
        'ruanyl/vim-sort-imports',
        'ryanoasis/vim-devicons',
        'scrooloose/nerdtree',
        'sheerun/vim-polyglot',
        'sjl/gundo.vim',
        'slashmili/alchemist.vim',
        'tomtom/tcomment_vim',
        'tpope/vim-abolish',
        'tpope/vim-dispatch',
        'tpope/vim-endwise',
        'tpope/vim-eunuch',
        'tpope/vim-fugitive',
        'tpope/vim-obsession',
        'tpope/vim-repeat',
        'tpope/vim-rhubarb',
        'tpope/vim-surround',
        'tpope/vim-unimpaired',
        'tpope/vim-vinegar',
        'tyru/open-browser.vim',
        'uzxmx/vim-widgets',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',
        'vim-airline/vim-airline',
        'vim-airline/vim-airline-themes',
        'vim-scripts/argtextobj.vim',
        'vim-scripts/dbext.vim',
        'vim-scripts/matchit.zip',
        'f3fora/cmp-spell',
        'hrsh7th/cmp-copilot',
        'vim-scripts/sudo.vim',
        'weirongxu/plantuml-previewer.vim',
        { 'MaxMEllon/vim-jsx-pretty', lazy = true, ft = { 'javascript' } },
        { 'Quramy/vim-js-pretty-template', lazy = true, ft = { 'javascript' } },
        { 'Shougo/vimproc.vim', build = 'make' },
        { 'Vimjas/vim-python-pep8-indent', lazy = true, ft = { 'python' } },
        { 'ap/vim-css-color', lazy = true, ft = { 'css' } },
        { 'bootleq/vim-textobj-rubysymbol', dependencies = { 'kana/vim-textobj-user' }, lazy = true, ft = { 'ruby' } },
        { 'burnettk/vim-angular', lazy = true, ft = { 'typescript' } },
        { 'chase/vim-ansible-yaml', lazy = true, ft = { 'ansible' } },
        { 'davidhalter/jedi-vim', lazy = true, ft = { 'python' } },
        { 'derekwyatt/vim-scala', lazy = true, ft = { 'scala' } },
        { 'ecomba/vim-ruby-refactoring', lazy = true, ft = { 'ruby' } },
        { 'ekalinin/Dockerfile.vim', lazy = true, ft = { 'dockerfile' } },
        { 'elixir-lang/vim-elixir', lazy = true, ft = { 'elixir' } },
        { 'fatih/vim-go', build = ':GoUpdateBinaries', lazy = true, ft = { 'go' } },
        { 'gisphm/vim-gradle', lazy = true, ft = { 'gradle' } },
        { 'hashivim/vim-terraform', lazy = true, ft = { 'terraform' } },
        { 'hashivim/vim-vagrant', lazy = true, ft = { 'vagrantfile' } },
        { 'iamcco/markdown-preview.nvim', build = 'cd app && yarn install', lazy = true, ft = { 'markdown' } },
        { 'ingydotnet/yaml-vim', lazy = true, ft = { 'yaml' } },
        { 'jason0x43/vim-js-indent', lazy = true, ft = { 'javascript' } },
        { 'jeetsukumaran/vim-pythonsense', lazy = true, ft = { 'python' } },
        { 'jparise/vim-graphql', lazy = true, ft = { 'graphql' } },
        { 'junegunn/fzf', dir = '~/.fzf', build = './install --all' },
        { 'kana/vim-textobj-datetime', dependencies = { 'kana/vim-textobj-user' } },
        { 'kana/vim-textobj-entire', dependencies = { 'kana/vim-textobj-user' } },
        { 'kana/vim-textobj-function', dependencies = { 'kana/vim-textobj-user' } },
        { 'kana/vim-textobj-indent', dependencies = { 'kana/vim-textobj-user' } },
        { 'kana/vim-textobj-line', dependencies = { 'kana/vim-textobj-user' } },
        { 'kana/vim-textobj-underscore', dependencies = { 'kana/vim-textobj-user' } },
        { 'kana/vim-textobj-user', dependencies = { 'kana/vim-textobj-line' } },
        { 'kchmck/vim-coffee-script', lazy = true, ft = { 'coffee' } },
        { 'keith/swift.vim', lazy = true, ft = { 'swift' } },
        { 'kevinoid/vim-jsonc', lazy = true, ft = { 'json' } },
        { 'leafgarland/typescript-vim', lazy = true, ft = { 'typescript' } },
        { 'mikelue/vim-maven-plugin', lazy = true, ft = { 'xml', 'java' } },
        { 'mxw/vim-jsx', lazy = true, ft = { 'javascript' } },
        { 'nelstrom/vim-textobj-rubyblock', dependencies = { 'kana/vim-textobj-user' }, lazy = true, ft = { 'ruby' } },
        { 'neoclide/jsonc.vim', lazy = true, ft = { 'json' } },
        { 'nginx/nginx', lazy = true, ft = { 'nginx' } },
        { 'nvie/vim-flake8', lazy = true, ft = { 'python' } },
        {
            'nvim-treesitter/nvim-treesitter',
            build = ':TSUpdate',
            config = function ()
                local configs = require("nvim-treesitter.configs")

                configs.setup({
                        ensure_installed = {
                            "c",
                            "css",
                            "go",
                            "html",
                            "java",
                            "javascript",
                            "lua",
                            "query",
                            "python",
                            "ruby",
                            "vim",
                            "vimdoc",
                        },
                        sync_install = false,
                        auto_install = true,
                        highlight = { enable = true },
                        indent = { enable = true },
                    })
            end
        },
        { 'othree/html5.vim', lazy = true, ft = { 'html' } },
        { 'pangloss/vim-javascript', lazy = true, ft = { 'javascript' } },
        { 'peitalin/vim-jsx-typescript', lazy = true, ft = { 'typescript' } },
        { 'prettier/vim-prettier', build = 'yarn install', lazyy = true, ft = { 'javascript' } },
        { 'rhaiscript/vim-rhai', lazy = true, ft = { 'rhai' } },
        { 'rust-lang/rust.vim', lazy = true, ft = { 'rust' } },
        { 'sidorares/node-vim-debugger', lazy = true, ft = { 'javascript' } },
        { 'slim-template/vim-slim', lazy = true, ft = { 'slim' } },
        { 'tfnico/vim-gradle', lazy = true, ft = { 'gradle' } },
        { 'tpope/vim-bundler', lazy = true, ft = { 'ruby' } },
        { 'tpope/vim-haml', lazy = true, ft = { 'haml' } },
        { 'tpope/vim-markdown', lazyy = true, ft = { 'md', 'markdown' } },
        { 'tpope/vim-rails', lazy = true, ft = { 'ruby' } },
        { 'tpope/vim-rake', lazy = true, ft = { 'ruby' } },
        { 'tpope/vim-rbenv', lazy = true, ft = { 'ruby' } },
        { 'vim-ruby/vim-ruby', lazy = true, ft = { 'rb' } },
        { 'vim-scripts/JavaScript-Indent', lazy = true, ft = { 'javascript' } },
    })

vim.cmd('source $HOME/.config/nvim/old.vim')

require("config/options")


require("mason").setup()
require("mason-lspconfig").setup({
        automatic_installation = true,
    })

local lspconfig = require('lspconfig')
lspconfig.bashls.setup {}
lspconfig.cssls.setup {}
lspconfig.docker_compose_language_service.setup {}
lspconfig.dockerls.setup {}
lspconfig.gopls.setup {}
lspconfig.graphql.setup {}
lspconfig.html.setup {}
lspconfig.jdtls.setup {}
lspconfig.jsonls.setup {}
lspconfig.lua_ls.setup {}
lspconfig.marksman.setup {}
lspconfig.pyright.setup {}
lspconfig.ruby_ls.setup {}
lspconfig.spectral.setup {}
lspconfig.sqlls.setup {}
lspconfig.taplo.setup {}
lspconfig.terraformls.setup {}
lspconfig.tflint.setup {}
lspconfig.tsserver.setup {}
lspconfig.vimls.setup {}
lspconfig.yamlls.setup {}

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
            -- Enable completion triggered by <c-x><c-o>
            vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

            -- Buffer local mappings.
            -- See `:help vim.lsp.*` for documentation on any of the below functions
            local opts = { buffer = ev.buf }
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
            vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
            vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        end,
    })

-- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
        snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            end,
        },
        window = {
            -- completion = cmp.config.window.bordered(),
            -- documentation = cmp.config.window.bordered(),
        },
        -- mapping = cmp.mapping.preset.insert({
        --         ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        --         ['<C-f>'] = cmp.mapping.scroll_docs(4),
        --         ['<C-Space>'] = cmp.mapping.complete(),
        --         ['<C-e>'] = cmp.mapping.abort(),
        --         ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        --          mapping = {
        --              ...
        --              ["<Tab>"] = cmp.mapping(function(fallback)
        --                  -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
        --                  if cmp.visible() then
        --                      local entry = cmp.get_selected_entry()
        --                      if not entry then
        --                          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        --                      else
        --                          cmp.confirm()
        --                      end
        --                  else
        --                      fallback()
        --                  end
        --              end, {"i","s","c",}),
        --          ...
        --      }
        --     }),
        mapping = {
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<C-d>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.close(),
            ["<CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                }),
            ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
        },
        sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                -- { name = 'vsnip' }, -- For vsnip users.
                -- { name = 'luasnip' }, -- For luasnip users.
                -- { name = 'ultisnips' }, -- For ultisnips users.
                -- { name = 'snippy' }, -- For snippy users.
                { name = 'dictionary' },
                { name = 'omni' },
                { name = 'spell' },
                { name = 'path' },
                { name = 'buffer' },
                { name = 'copilot' },
            }, {
                { name = 'buffer' },
            })
    })

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
                { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
            }, {
                { name = 'buffer' },
            })
    })

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer' }
        }
    })

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
                { name = 'path' }
            }, {
                { name = 'cmdline' }
            })
    })

-- -- Set up lspconfig.
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--   capabilities = capabilities
-- }
