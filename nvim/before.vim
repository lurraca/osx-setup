let g:autosave = 1

set autowrite

:let mapleader = ","

" fzf-vim config {
nnoremap <leader>f :Files<CR>
nnoremap <leader><leader>f :GFiles<CR>
nnoremap <leader>a :Ag<CR>
" }

" testing config {
nnoremap <leader>t ::TestNearest<CR>
nnoremap <leader>. ::TestFile<CR>
" }

let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
