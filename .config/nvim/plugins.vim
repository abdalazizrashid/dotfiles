set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-fugitive'
Plugin 'zxqfl/tabnine-vim'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'dense-analysis/ale'
" latex plugins
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'lervag/vimtex'
Plugin 'Konfekt/FastFold'
Plugin 'matze/vim-tex-fold'
" assuming you're using vim-plug: https://github.com/junegunn/vim-plug
Plugin 'ncm2/ncm2'
Plugin 'roxma/nvim-yarp'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'ayu-theme/ayu-vim' " or other package manager
Plugin 'lifepillar/vim-gruvbox8' " or other package manager

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plugin 'ncm2/ncm2-bufword'
Plugin 'ncm2/ncm2-path'
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
