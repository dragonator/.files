call plug#begin('~/.vim/plugs')                         " vim-plug: start of install plugins section
Plug 'christoomey/vim-tmux-navigator'                   " navigate vim and tmux with consistent set of mappings
Plug 'vim-airline/vim-airline'                          " pretty status line
Plug 'tpope/vim-endwise'                                " close code blocks for you: 'end' keyword, brakcets, etc.
Plug 'tpope/vim-fugitive'                               " use GIT in VIM
Plug 'tpope/vim-cucumber'                               " for opening step definitions out of feature files
Plug 'vim-ruby/vim-ruby'                                " ruby support
Plug 'janko-m/vim-test'                                 " run your tests inside VIM
Plug 'vim-syntastic/syntastic'                          " run code quality checkers on open file
Plug 'AndrewRadev/linediff.vim'
"Plug 'KitN/nand2-vim-syn'                              " syntax coloring for nand2tetris course
"Plug 'fatih/vim-go'                                    " syntax coloring for GO langiage
call plug#end()                                         " vim-plug: end of install plugins section

map <Leader>tn :TestNearest<cr>|                        " vim-test: perform only the nearest test
map <Leader>tf :TestFile<cr>|                           " vim-test: perform all tests in current file
map <Leader>ts :TestSuite<cr>|                          " vim-test: perform all tests of current type
map <Leader>tl :TestLast<cr>|                           " vim-test: perform last executed test
map <Leader>tv :TestVisit<cr>|                          " vim-test: open the file with tests

map [f <C-W><C-d>|                                      " vim-cucumber: open step-definition in split below
map ]f <C-W><C-d><C-W>L|                                " vim-cucumber: open step-definition in split to the right

set statusline+=%#warningmsg#                           " TODO
set statusline+=%{SyntasticStatuslineFlag()}            " TODO
set statusline+=%*                                      " TODO

let g:syntastic_always_populate_loc_list = 1            " syntastic: add all valuations to the location list
let g:syntastic_auto_loc_list = 1                       " syntastic: show list of valuations in a pane below
let g:syntastic_check_on_open = 0                       " syntastic: don't execute syntastic on file opening
let g:syntastic_check_on_wq = 0                         " syntastic: don't execute syntastic on save&exit
let g:syntastic_mode_map = { "mode": "passive" }        " syntastic: don't execute syntastic automatically
let g:syntastic_ruby_checkers = ['mri', 'rubocop']      " syntastic: checkers for Ruby code
nnoremap <Leader>c  :SyntasticCheck<CR>|                " syntastic: manually execute syntastic checkers

map <Leader>v <C-W>v<C-W><Right>|                       " \s to open split window below
map <Leader>s <C-W>s<C-W><Down>|                        " \v to open split window to the right
map <Leader>1  :!!<CR>|                                 " \1 to rerun last shell command

nnoremap <Leader>w  :w<CR>|                             " \w to save the current file
nnoremap <Leader>q  :q<CR>|                             " \q to quit the current file
nnoremap <Leader>x  :x<CR>|                             " \x to save and quit the current file
nnoremap <Leader>q1 :q!<CR>|                            " \q1 to quit without saving the current file
nnoremap [b orequire 'byebug'; byebug<ESC>|             " [b to call byebug in the line below

vnoremap // y/<C-R>"<CR>                                " // in VISUAL mode to search the selected text

nnoremap <Left>  :     echo "No left for you!"<CR>      " disable left arrow in NORMAL mode
nnoremap <Right> :     echo "No right for you!"<CR>     " disable right arrow in NORMAL mode
nnoremap <Up>    :     echo "No up for you!"<CR>        " disable up arrow in NORMAL mode
nnoremap <Down>  :     echo "No down for you!"<CR>      " disable down arrow in NORMAL mode
vnoremap <Left>  :<C-u>echo "No left for you!"<CR>      " disable left arrow in VISUAL mode
vnoremap <Right> :<C-u>echo "No right for you!"<CR>     " disable right arrow in VISUAL mode
vnoremap <Up>    :<C-u>echo "No up for you!"<CR>        " disable up arrow in VISUAL mode
vnoremap <Down>  :<C-u>echo "No down for you!"<CR>      " disable down arrow in VISUAL mode

syntax enable                                           " enable syntax highlightning
colorscheme seoul256                                    " select a colorscheme
set background=dark                                     " set dark background
set autochdir                                           " change working dir to parent of current file
set shell=/bin/bash                                     " set vim shell to bash
set autoread                                            " automatically reload on file changes
set backspace=2                                         " make backspace work like most other apps
set incsearch                                           " show match during search
set ignorecase                                          " case-insensitive search if all lowercase
set smartcase                                           " case-sensitive search if some uppercase
set hlsearch                                            " highlight all search matches
set mouse=a                                             " enable mouse in all modes
set ttymouse=sgr                                        " SGR-styled mouse input (works beyond 223 column)
set clipboard=unnamedplus                               " use system clipboard
set history=50                                          " set command-line history buffer size
"set showcmd                                            " display incomplete commands
set noshowmode                                          " dont show current mode; airline does it
set scrolloff=4                                         " minimum number of screen lines showing around the cursor
set wildmenu                                            " enable command-line completion
set wildmode=list,full                                  " command-line completion menu
set completefunc=syntaxcomplete#Complete                " insert completion function
set completeopt=longest,menuone,preview                 " insert completion menu
set showmatch                                           " show matching parenthesis (brackets)
set matchtime=1                                         " 1/10 of a second to show matching bracket
set encoding=utf-8                                      " set overal vim encoding to UTF-8
"set title                                               "
"let &titleold=getcwd()                                  "
set tabstop=2                                           " number of spaces per Tab
set shiftwidth=2                                        " number of spaces to shift
set expandtab                                           " write spaces i.s.o. tab (<C-V>Tab for real tab)
set smartindent                                         " well...smart indent
set autoindent                                          " automatically indent in certain cases
set nobackup                                            " don't create backups
set nowritebackup                                       " don't create backups when overwriting files
set noswapfile                                          " don't create swap files for buffers
"set noerrorbells                                        "
"visualbell t_vb=                                        " disable beeping
set nowrap                                              " disable line wrap
set cursorline                                          " highlight cursor line
set cursorcolumn                                        " highlight cursor column
set ruler                                               " show line and column of the cursor position
set ttimeout                                            " timeout on key codes (faster escaping of INSERT mode)
set ttimeoutlen=70                                      " timeout lenght
set splitbelow                                          " show new split window below
set splitright                                          " show new split window on the right
set ttimeoutlen=70                                      " timeout length
set number                                              " show current line number i.s.o. 0 (hybrid numbers)

" Automatic settings
autocmd BufEnter    * set relativenumber                " turn on relative numbers in the new buffer when switching buffers
autocmd FocusGained * set relativenumber                " turn on relative numbers in focused buffer
autocmd InsertLeave * set relativenumber                " turn on relative numbers when leaving INSERT mode
autocmd BufLeave    * set norelativenumber              " turn off relative numbers in the old buffer when switching buffers
autocmd FocusLost   * set norelativenumber              " turn off relative numbers when buffer is loosing focus
autocmd InsertEnter * set norelativenumber              " turn off relative numbers when entering INSERT mode
autocmd BufNewFile  *.gradle set filetype=groovy        " use groovy as filetype when creating new *.gradle files
autocmd BufRead     *.gradle set filetype=groovy        " use groovy as filetype when opening existing *.gradle files
autocmd BufNewFile  *.hdl    set syntax=hdl             " use hdl syntax when creating new *.hdl files
autocmd BufRead     *.hdl    set syntax=hdl             " use hdl syntax when opening existing *.hdl files

" map Q to exit vim with an error code in diff mode
if &diff
  map Q :cquit<CR>
endif
