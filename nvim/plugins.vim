if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.local/share/nvim/plugged')

" Colorschemes {
Plug 'chriskempson/base16-vim'
Plug 'doums/darcula'
Plug 'sainnhe/edge'
" }

" Editing -- Text manipulation helpers {
" (Un-)comment code
Plug 'tpope/vim-commentary'

" Show trailing whitespace in red
Plug 'bronson/vim-trailing-whitespace'

" quoting/parenthesizing made simple; e.g. ysiw) to wrap word in parens
Plug 'tpope/vim-surround'

" }

" Git -- Tools for using git and github {
" Awesome git wrapper
Plug 'tpope/vim-fugitive'

" Github extension for fugitive
Plug 'tpope/vim-rhubarb'
" }

" Navigation -- Fuzzy find, searching, etc {

" - for netrw current directory
Plug 'tpope/vim-vinegar'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


" Modern performant generic finder and dispatcher for Vim and NeoVim
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
" }

" Linting {
" Asynchronous Lint Engine
Plug 'dense-analysis/ale'
" }

" Testing {
Plug 'janko/vim-test'
" }

" Go {
Plug 'fatih/vim-go'
" }

" Ruby {
Plug 'keith/rspec.vim'
Plug 'tpope/vim-rake', { 'for': ['ruby', 'rake'] }
Plug 'tpope/vim-projectionist', { 'for': ['ruby', 'rake'] }
" }

Plug 'sheerun/vim-polyglot'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()
