let g:autosave = 1

set autowrite

set number
set ruler

filetype plugin indent on
" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" Sets the number of columns for a TAB.
set softtabstop=2
" On pressing tab, insert 2 spaces
set expandtab

let mapleader = ","

" fzf-vim config {
nnoremap <leader>f :Files<CR>
nnoremap <leader><leader>f :GFiles<CR>
nnoremap <leader>a :Ag<CR>
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
" }

" testing config {
nnoremap <leader>t ::TestNearest<CR>
nnoremap <leader>. ::TestFile<CR>
" }

let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
