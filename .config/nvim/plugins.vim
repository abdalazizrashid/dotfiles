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
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'
Plug 'nvie/vim-flake8'
Plug 'cespare/vim-toml'
" COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" FZF
Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
Plug 'junegunn/fzf.vim' " needed for previews
Plug 'antoinemadec/coc-fzf'
" Fugitive
Plug 'tpope/vim-fugitive'

call plug#end() 

