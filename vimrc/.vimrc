"return" 2>&- || "exit"

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
set tw=80

" show vertical red line to show the 81st character
set colorcolumn=81

" Set Linenumber by default
set number

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

" set colorschme
"colorscheme jellybeans

" Set title
set title
set titleold=""
set fileformats="unix,dos,mac"