scriptencoding utf-8

runtime before.vim
runtime plugins.vim
runtime colorscheme.vim

"let g:go_code_completion_enabled = 0
au filetype go inoremap <buffer> . .<C-x><C-o>
