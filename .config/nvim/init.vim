runtime plugins.vim
runtime lang.vim
runtime snippets.vim
runtime netrw.vim


"Config Section
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme blue-mood "vim-monokai-tasty

set foldmethod=syntax
set relativenumber                  " line numbers
set nu rnu
syntax enable                       " syntax processing
set cursorline                      " highlinght current line
set clipboard=unnamedplus           " clipboard sharing
set autochdir
" Tab settings
set expandtab                       " spaces instead of tabs
set smarttab                        " tab in the beginning of the line acts like shift
set tabstop=4                       " <tab>=n<space>, read mode
set shiftwidth=4                    " the size of an indent
set softtabstop=4                   " <tab>=n<space>, edit mode
set backspace=indent,eol,start      " make backspace work in usual way
set termguicolors

" Better autocompletion
set wildmenu
set wildmode=full
set wildignore=".git/*,.clangd/*,build/*"
set completeopt=menuone,noinsert,noselect


" Jump outside  
inoremap <C-e> <C-o>A

" enable filetype detection:
filetype on
filetype plugin on
filetype indent on " file type based indentation
let mapleader=","                   " <leader> key
autocmd FileType markdown nmap <silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
autocmd TextChanged,TextChangedI <buffer> silent write
let g:python_host_prog = "/usr/bin/python3"
let g:python3_host_prog = "/usr/bin/python3"

" AUTO SAVE
let g:auto_save = 0
let g:auto_save_events = ["InsertLeave", "TextChanged", "TextChangedI", "CompleteDone"]

augroup ft_markdown
  au!
  au FileType markdown let b:auto_save = 1
augroup END
augroup ft_tex
  au!
  au FileType tex let b:auto_save = 1
augroup END

" SPELL CHECK
setlocal spell
set spelllang=nl,en_gb
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u


" Docstring folding for python
syn region  pythonString matchgroup=pythonTripleQuotes 
      \ start=+[uU]\=\z('''\|"""\)+ end="\z1" keepend fold
      \ contains=pythonEscape,pythonSpaceError,pythonDoctest,@Spell


