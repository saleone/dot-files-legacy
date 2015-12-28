" Install plugins with 'junegunn/vim-plug'
call plug#begin("~/.vim/plugged")
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'Lokaltog/vim-easymotion'
Plug 'rstacruz/sparkup'
Plug 'klen/python-mode'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-expand-region'
Plug 'jimsei/winresizer'
Plug 'ctrlpvim/ctrlp'
Plug 'editorconfig/editorconfig-vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
call plug#end()

" ======================
"  VIM BUILDIN SETTINGS
" ======================

" Regular copy and paste
set pastetoggle=<F2>
set clipboard=unnamed

" Automatic reloading of .vimrc file
autocmd! bufwritepost .vimrc source %

" Show line numbers
set number

" Show current position
set ruler

" Make backspace work as it should
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Height of the command bar
set cmdheight=2

" Ignore case when doing searches
set ignorecase

" When I type upper letter in search disable ignorecase
set smartcase

" Highlight search results
set hlsearch

" Show search results as I type
set incsearch

" Don't redraw screen when executing macros
set lazyredraw

" Blink to matching bracket when it can be seen on screen
set showmatch
set mat=2

" Disable error sounds
set noerrorbells

" Enable syntax highlighting
syntax enable

" Show whitespace
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Color theme
colorscheme ron

" Set UTF-8 encoding
set encoding=utf8

" Use Unix file type
set ffs=unix,dos,mac

" Disable backup and autosave files
set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab
set smarttab

" Disable use of spaces in make files
autocmd FileType make setlocal noexpandtab

" Set four spaces as one tab
set shiftwidth=4
set tabstop=4

" Set autoindent, smart indent and wrap lines
set ai
set si
set wrap

" Reselect code after indentation
vnoremap < <gv
vnoremap > >gv

" It looks strange when skipping broken lines so treat them as regular lines
map j gj
map k gk

" Remap 0 to first non-blank character
map 0 ^

" Enable mouse
set mouse=a

" Bind window movement keys to save some keystrokes
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Rebind the leader key
let mapleader = "\<Space>"

" Visual line mode
nmap <Leader>v V

" No highlights of searches
nnoremap <Leader>n :noh<CR>

" Better tab navigation
map <Leader>h :tabprevious<CR>
map <Leader>l :tabnext<CR>
map <Leader>j :tabclose<CR>
map <Leader>k :tabnew<CR>

" Quit with <Leader>q
map <Leader>q :q!<CR>
map <Leader>Q :qall!<CR>

" Save with <Leader>w
map <Leader>w :w<CR>


" =============
"  CUSTOM CODE
" =============

" Delete trailing white space on save.
func! DeleteTrailingWhiteSpace()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWhiteSpace()
autocmd BufWrite *.coffee :call DeleteTrailingWhiteSpace()
autocmd BufWrite .vimrc :call DeleteTrailingWhiteSpace()


" =================
"  PLUGIN SETTINGS
" =================

"  Region expand binds
" ---------------------
map <Leader>e <Plug>(expand_region_expand)
map <Leader>s <Plug>(expand_region_shrink)

"  Pymode
" --------

" Enable virtualenv support
let g:pymode_virtualenv = 1

" Python code linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_write = 0

" Disable folding
let g:pymode_folding = 0
let g:pymode_indent = 0

"
" Winresizer
" -----------
"
"  Nice way to resize windows by pressing C-e and using hjkl.
