" nvimrc - Startup script for Neovim Editor

filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim

call vundle#begin('~/.config/nvim/bundle/')

Plugin 'gmarik/Vundle.vim'

" Plugin 'majutsushi/tagbar'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'easymotion/vim-easymotion'
Plugin 'mhinz/vim-startify'
Plugin 'airblade/vim-gitgutter'
Plugin 'benekastah/neomake'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ntpeters/vim-airline-colornum'
Plugin 'cespare/vim-toml'
Plugin 'godlygeek/tabular'
Plugin 'mikewest/vimroom'
Plugin 'rust-lang/rust.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'
Plugin 'vim-scripts/ReplaceWithRegister'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'whatyouhide/vim-gotham'

call vundle#end()

set list                            " show whitespace
set hidden
set smartcase                       " Enable smartcase in search
set nottimeout                      " Fix problem with <ESC>+<char>
set autowrite                       " Write automatically when switching buffers
set hlsearch                        " Highlight search matches
set title                           " Set terminal title
set showmatch                       " Show matching paren/brace/bracket etc.
set number                          " show line number
set relativenumber                  " line numbering is relative to current line
set ts=2                            " tab spacing is 2 characters
set mouse=a                         " Enable all mouse features
set foldmethod=indent               " Enable code folding
set foldlevel=99                    " Bigtime folding for great fun!
" set clipboard+=unnamedplus          " Set default yank register to use desktop copy/paste
filetype plugin indent on           " Enable file-specific plugins and indents
syntax enable                       " Set syntax highlighting on
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1 " Set thin cursor in insert mode

set t_Co=256
set background=light                  " Set background
colorscheme PaperColor                " Set colorscheme to solarized


" Setup persistent undo
set undofile
set undodir=$HOME/.config/nvim/undo
set undolevels=500
set undoreload=500

" Setup backup. Put backup in specialized directory
set backupdir=$HOME/.config/nvim/backup " for backup files
set directory=$HOME/.config/nvim/backup " for .swp files

"" Airline setup
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='PaperColor'
let g:airline_inactive_collapse=1
let g:airline_mode_map = {
        \ '__' : '-',
        \ 'n'  : 'N',
        \ 'i'  : 'I',
        \ 'R'  : 'R',
        \ 'c'  : 'C',
        \ 'v'  : 'V',
        \ 'V'  : 'V',
        \ '' : 'V',
        \ 's'  : 'S',
        \ 'S'  : 'S',
        \ '' : 'S',
        \ }

"" LaTeX Box Setup
let g:LatexBox_latexmk_async=1
let g:LatexBox_build_dir="./build/"

"" Neomake Setup
autocmd! BufWritePost * Neomake
let g:neomake_python_enabled_makers = ['pyflakes']

"" YouCompleteMe Setup
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

"" Tagbar setup
" nmap <F8> :TagbarToggle<CR>

"" VimRoom setup
let g:vimroom_sidebar_height=0

"" CtrlSpace Setup
let g:CtrlSpaceFileEngine = "auto"

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


"" Custom Mappings
nnoremap Q @q
noremap z :noh<esc>
" Set space in normal mode to do folding
nnoremap <space>  za

" A map that reverses a visual selection
vmap <Leader>fR c<C-O>:set ri<CR><C-R>"<Esc>:set nori<CR>
" A map that reverses the sequence of lines (again, visual mode):
vmap <Leader>fr :<c-u>set lz<CR>'>o<Esc>'<O<Esc>V'>j:<c-u>'<+1,'>-1g/^/m '<<CR>' dd:set nolz<CR>

