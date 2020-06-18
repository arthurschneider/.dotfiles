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

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

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
"set background=dark

" User the solorized theme
" https://github.com/altercation/vim-colors-solarized
"colorscheme solarized

" Enable default plugins
set nocompatible
filetype plugin on

" Enable matchit default vim plugin
runtime macros/matchit.vim

" Set title
set title
set titleold=""
set fileformats="unix,dos,mac"

" Set python version for the powerline-vim plugin
"let g:airline_theme='powerlineish'
"let g:airline_powerline_fonts = 1
"set guifont=Space\ Mono\ for\ Powerline\ 10

" remove empty angle at the end
"let g:airline_skip_empty_sections = 1

" extension for tab line
"let g:airline#extensions#tabline#enabled = 0
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#formatter = 'unique_tail'
"set fillchars+=stl:\ ,stlnc:\

call plug#begin('~/.vim/plugged')
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-unimpaired'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
call plug#end()

