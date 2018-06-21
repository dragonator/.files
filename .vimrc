" Specify a directory for plugins
call plug#begin('~/.vim/plugs')

" Plugins
Plug 'bling/vim-airline'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'janko-m/vim-test'
"Plug 'fatih/vim-go'

" Syntax highlighting
Plug 'KitN/nand2-vim-syn'
Plug 'scrooloose/syntastic'

call plug#end()

" Syntax highlighting
au BufNewFile,BufRead *.gradle set filetype=groovy
autocmd BufNewFile,BufRead *.hdl   set syntax=hdl

" Normal mode remaps
nnoremap <Leader>w  :w<CR>
nnoremap <Leader>q  :q<CR>
nnoremap <Leader>q1 :q!<CR>
nnoremap <Leader>x  :x<CR>
nnoremap [b orequire 'byebug'; byebug<ESC>

" Visual mode remaps
vnoremap // y/<C-R>"<CR>

" Remap keys for managing windows
map <leader>v <C-W>v<C-W><Right>
map <leader>s <C-W>s<C-W><Down>

" Map keys for window navigation
map <C-k> <C-W>k
map <C-j> <C-W>j
map <C-h> <C-W>h
map <C-l> <C-W>l

" Disable arrow keys in all modes
nnoremap <Left> :echo "No left for you!"<CR>
vnoremap <Left> :<C-u>echo "No left for you!"<CR>
inoremap <Left> <C-o>:echo "No left for you!"<CR>
nnoremap <Right> :echo "No right for you!"<CR>
vnoremap <Right> :<C-u>echo "No right for you!"<CR>
inoremap <Right> <C-o>:echo "No right for you!"<CR>
nnoremap <Down> :echo "No down for you!"<CR>
vnoremap <Down> :<C-u>echo "No down for you!"<CR>
inoremap <Down> <C-o>:echo "No down for you!"<CR>
nnoremap <Up> :echo "No up for you!"<CR>
vnoremap <Up> :<C-u>echo "No up for you!"<CR>
inoremap <Up> <C-o>:echo "No up for you!"<CR>

" Run RSpec tests
map <Leader>rf :w<cr>:exe "!cd `git rev-parse --show-toplevel` && bundle exec rspec --format documentation " . expand('%:p')<cr>
map <Leader>rl :w<cr>:exe "!cd `git rev-parse --show-toplevel` && bundle exec rspec " . expand('%:p') . ":" . line(".")<cr>
map <Leader>rt :w<cr>:!cd `git rev-parse --show-toplevel` && bundle exec rspec --format documentation<cr>

" Run Cucumber tests
map <Leader>cf :w<cr>:exe "!cd `git rev-parse --show-toplevel` && bundle exec cucumber " . expand('%:p')<cr>
map <Leader>cl :w<cr>:exe "!cd `git rev-parse --show-toplevel` && bundle exec cucumber " . expand('%:p') . ":" . line(".")<cr>
map <Leader>ct :w<cr>:!cd `git rev-parse --show-toplevel` && bundle exec cucumber<cr>

" Generic mapping for running tests
map <Leader>tn :TestNearest<cr>
map <Leader>tf :TestFile<cr>
map <Leader>ts :TestSuite<cr>
map <Leader>tl :TestLast<cr>
map <Leader>tv :TestVisit<cr>

" Run last shell command
map <Leader>1 :!!<cr>

" Map Q to exit vim with an error code in diff mode
if &diff
  map Q :cquit<CR>
endif

" Set vim's working directory to the
" current file's directory automatically
autocmd BufEnter * lcd %:p:h

" Automatically attempt to set the working directory to the current
" file. This value will be superceeded by rooter if it is installed
set autochdir

" Ensure vim uses bash
set shell=/bin/bash

" Automatically reload on file changes
set autoread

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
"set ttymouse=sgr
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

" Command's auto completion
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
let &titleold=getcwd()

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

" Show hybrid line numbers on focused window
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Colors
syntax enable
set background=dark
colorscheme seoul256

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

" Show the cursor position all the time
set cursorline cursorcolumn
set ruler

" Use system clipboard
set clipboard=unnamedplus

" Fasting escaping out of insert mode
set ttimeout
set ttimeoutlen=100
set timeoutlen=3000

" Folding
set foldnestmax=1
set foldmethod=syntax
set nofoldenable
" set foldclose=all
