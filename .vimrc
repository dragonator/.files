filetype off

set runtimepath+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/Vundle.vim'

" Plugins
Bundle 'klen/python-mode'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdcommenter'

" Syntax highlighting
Bundle 'KitN/nand2-vim-syn'
Bundle 'scrooloose/syntastic'

filetype plugin indent on

" Easy shortcuts
nnoremap <Leader>w  :w<CR>
nnoremap <Leader>q  :q<CR>
nnoremap <Leader>q1 :q!<CR>
nnoremap <Leader>x  :x<CR>

" Remap keys for managing windows
map <leader>v <C-W>v<C-W><Right>
map <leader>s <C-W>s<C-W><Down>

map <C-k> <C-W>k
map <C-j> <C-W>j
map <C-h> <C-W>h
map <C-l> <C-W>l

" ============ Python Mode =============

" Trim unused white spaces on save
let g:pymode_trim_whitespaces = 1

" Setup default python options 
" (see :help pymode for more info)
let g:pymode_options = 1

" Fast and usual python folding
let g:pymode_folding = 1

" Bind key for documentation
let g:pymode_doc_bind = '-'

" ======================================

" Set vim's working directory to the
" current file's directory automatically
autocmd BufEnter * lcd %:p:h

" Ensure vim uses bash
set shell=/bin/bash

" Automatically reload on file changes
set autoread

" Automatically attempt to set the working directory to the current
" file. This value will be superceeded by rooter if it is installed
set autochdir

" Fancy status line (required for airline))
set laststatus=2

" Make backspace work like most other apps
set backspace=2 

" Search options
set incsearch
set ignorecase
set smartcase
set hlsearch

"Enable mouse support
set mouse=a

" Command line history
set history=50

" Display incomplete commands
set showcmd

" Dont show current mode 
" It's being displayed by the powerline plugin
set noshowmode

" Minimum number of screen lines above and below the cursor
set scrolloff=4

"Command's auto completion
set wildmenu
set wildmode=longest,list

" Completion options
set completefunc=syntaxcomplete#Complete
set completeopt=longest,menuone,preview

" Matching braces
set showmatch
set matchtime=1

" Default encoding
set encoding=utf-8

" Fancy title, based on opened file
set title

" Tab stuff
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Indent stuff
set smartindent
set autoindent

" Disable the silly backups, we're not 90's
set nobackup
set noswapfile
set nowritebackup

" Show line numbers
set number

" Colors
syntax enable
set background=dark
colorscheme seoul256
autocmd BufNewFile,BufRead *.hdl   set syntax=hdl

" Disable beeping
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Diasable wrapping
set nowrap

" Removes menu bar and toolbar
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" More syntax highlighting.
let python_highlight_all = 1

" Show the cursor position all the time
set cursorline cursorcolumn
set ruler

" Use system clipboard
set clipboard=unnamedplus

" Fasting escaping out of insert mode
set ttimeout
set ttimeoutlen=100
set timeoutlen=3000
