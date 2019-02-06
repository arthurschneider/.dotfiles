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
set shiftwidth=4
set tabstop=4

" Linebreak on 120 characters
" set lbr
" set tw=121

" show vertical red line to show the 121st character
set colorcolumn=121

" Set Linenumber by default
set number relativenumber

" Better command-line completion
set wildmenu
set wildmode=full

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

" Set the history to the size of 200 instead of 20
set history=200

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" When set to "dark", Vim will try to use colors that look
" good on a dark background. When set to "light", Vim will
" try to use colors that look good on a light background.
" Any other value is illegal.
set background=dark

" User the solorized theme
" https://github.com/altercation/vim-colors-solarized
colorscheme solarized

" Enable default plugins
set nocompatible
filetype plugin on


" Enable matchit default vim plugin
runtime macros/matchit.vim

" Set title
set title
set titleold=""
set fileformats="unix,dos,mac"

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-unimpaired'
call plug#end()

" The combination Ctrl+n will toggle nerdtree
map <C-n> :NERDTreeToggle<CR>

" The file endings will be ignored by nerdtree
let NERDTreeIgnore = ['\.swp$']

" Nerdtree will always show hidden files by launch
let NERDTreeShowHidden=1
