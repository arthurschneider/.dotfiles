" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" Show invisible characters
set list
set listchars=tab:›\ ,eol:¬,trail:⋅

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 80 characters
set lbr
set tw=101

" show vertical red line to show the 81st character
set colorcolumn=101

" Set Linenumber by default
set number relativenumber

" Better command-line completion
set wildmenu

" Enable syntax highlighting
syntax on

" shows statusline
set laststatus=2

" Show partial commands in the last line of the screen
set showcmd

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" press <Enter> to continue
set cmdheight=2

" Show the line and column number of the cursor position,
" separated by a comma.
set ruler

" When set to "dark", Vim will try to use colors that look
" good on a dark background. When set to "light", Vim will
" try to use colors that look good on a light background.
" Any other value is illegal.
set background=dark

" Enable markdown plugin
" https://github.com/suan/vim-instant-markdown
filetype plugin on

" Set title
set title
set titleold=""
set fileformats="unix,dos,mac"

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

" With STRG+n will toggle nerdtree
map <C-n> :NERDTreeToggle<CR>

" The file endings will be ignored by nerdtree
let NERDTreeIgnore = ['\.swp$']

" Nerdtree will always show hidden files by launch
let NERDTreeShowHidden=1
