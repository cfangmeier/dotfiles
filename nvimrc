" nvimrc - Startup script for Neovim Editor

filetype off
" let vimDir = '$HOME/.nvim'
set rtp+=~/.nvim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-sensible'
Plugin 'godlygeek/tabular'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-latex/vim-latex'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Valloric/YouCompleteMe', {'do': './install.sh --clang-completer'}
Plugin 'benekastah/neomake'
Plugin 'majutsushi/tagbar'
Plugin 'rust-lang/rust.vim'
Plugin 'cespare/vim-toml'

call vundle#end()

set list                            " show whitespace
set smartcase                       " Enable smartcase in search
set autowrite                       " Write automatically when switching buffers
set hlsearch                        " Highlight search matches
set title                           " Set terminal title
set showmatch                       " Show matching paren/brace/bracket etc.
set number                          " show line number
set relativenumber                  " line numbering is relative to current line
set ts=2                            " tab spacing is 2 characters
set mouse=a                         " Enable all mouse features
set clipboard+=unnamedplus          " Set default yank register to use desktop copy/paste
filetype plugin indent on           " Enable file-specific plugins and indents
syntax enable                       " Set syntax highlighting on 
set background=dark                 " Set background to dark(for solarized)
colorscheme solarized               " Set colorscheme to solarized
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1 " Set thin cursor in insert mode


" Setup persistent undo
set undofile
set undodir=$HOME/.nvim/undo
set undolevels=500
set undoreload=500

" Setup backup. Put backup in specialized directory
set backupdir=$HOME/.nvim/backup " for backup files
set directory=$HOME/.nvim/backup " for .swp files

"" Airline setup
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_idx_mode = 1 " move between tabs:
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
inoremap <A-h> <esc><C-w>h
inoremap <A-j> <esc><C-w>j
inoremap <A-k> <esc><C-w>k
inoremap <A-l> <esc><C-w>l

"" Set a visable cursor line in current buffer
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

"" vim-latex setup
let g:tex_flavor='latex'
let g:Tex_CompileRule_pdf = 'xelatex -src-specials -synctex=1 -interaction=nonstopmode $*'
let g:Tex_DefaultTargetFormat = 'pdf'

"" Neomake Setup
autocmd! BufWritePost * Neomake

"" YouCompleteMe Setup
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

"" Tagbar setup 
nmap <F8> :TagbarToggle<CR>

"" Custom Mappings
nnoremap Q @q
