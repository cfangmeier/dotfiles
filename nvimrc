set nocompatible
filetype off
let vimDir = '$HOME/.nvim'
set rtp+=~/.nvim/bundle/vundle/
call vundle#rc(expand($HOME.'/.nvim/bundle'))

Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-commentary'
Bundle 'godlygeek/tabular'
Bundle 'bling/vim-airline'
Bundle 'airblade/vim-gitgutter'
Bundle 'tpope/vim-sensible'
Bundle 'vim-latex/vim-latex'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Valloric/YouCompleteMe', {'do': './install.sh --clang-completer'}
Bundle 'scrooloose/syntastic'

set shell=/bin/zsh
set number           "show line number
set list             "show whitespace
set ignorecase
set autowrite
set hlsearch
set title
set showmatch
set relativenumber
set ts=2
set mouse=a
set clipboard+=unnamedplus
set encoding=utf-8
filetype plugin indent on
syntax enable
set background=dark
colorscheme solarized

set undofile
set undodir=$HOME/.nvim/undo
set undolevels=500
set undoreload=500

set backupdir=$HOME/.nvim/backup " for backup files
set directory=$HOME/.nvim/backup " for .swp files

"" Airline setup
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" move between tabs:
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

"" alt key view switching
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

""Set a visable cursor line in current buffer
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

""vim-latex setup
let g:tex_flavor='latex'
let g:Tex_CompileRule_pdf = 'xelatex -src-specials -synctex=1 -interaction=nonstopmode $*'
let g:Tex_DefaultTargetFormat = 'pdf'

""Syntastic setup
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
