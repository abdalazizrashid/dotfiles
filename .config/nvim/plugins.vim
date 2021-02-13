call plug#begin('~/.vim/plugged')


"Arduino 
Plug 'stevearc/vim-arduino'
" let Vundle manage Vundle, required
Plug 'lmintmate/blue-mood-vim'
"
" Plug 'vim-syntastic/syntastic'
Plug 'dracula/vim'
Plug 'ferrine/md-img-paste.vim'
" Latex
Plug 'lervag/vimtex'
" Snippets
Plug 'SirVer/ultisnips'
Plug '907th/vim-auto-save'
Plug 'abdalazizrashid/vim-snippets'
"UNDOTREE
Plug 'mbbill/undotree'
" Plug 'nvie/vim-flake8'
Plug 'lervag/vimtex'
Plug 'patstockwell/vim-monokai-tasty'
" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/diagnostic-nvim'
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-lsputils'
Plug 'bfrg/vim-cpp-modern'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'
Plug 'nvie/vim-flake8'
Plug 'cespare/vim-toml'
call plug#end() 

"lua require("lsp_config")
"lua require'lspconfig'.pyls_ms.setup{}



