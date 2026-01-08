" Set color scheme
packadd! everforest

"if has('termguicolors')
"  set termguicolors
"endif
set background=dark    " or 'light' for light variant
colorscheme everforest

" syntax higlighting
syntax on

" Show line numbers
set number

" Relative line numbers for easier motion commands
set relativenumber

" Enable auto-indents
set autoindent

"Set tab width to 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Line wrapping at boundaries
set wrap
set linebreak

" Search improvements
set hlsearch          " Highlight search results
set incsearch         " Show matches as you type
set ignorecase        " Case-insensitive search
set smartcase         " Case-sensitive if uppercase used

" Better backspace behavior
set backspace=indent,eol,start

" Clear search highlighting with Esc in normal mode
nnoremap <silent> <Esc> :nohlsearch<CR><Esc>

" Highlight current line
set cursorline

" Spellcheck for markdown GB english
autocmd FileType markdown setlocal spell spelllang=en_gb

" Show matching brackets
set showmatch

