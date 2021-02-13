" PYTHON
" Docstring folding for python
"syn region  pythonString matchgroup=pythonTripleQuotes 
"      \ start=+[uU]\=\z('''\|"""\)+ end="\z1" keepend fold
"      \ contains=pythonEscape,pythonSpaceError,pythonDoctest,@Spell

" LATEX
let g:tex_flavor='lualatex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" INKSCAPE-FIGURE
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>
