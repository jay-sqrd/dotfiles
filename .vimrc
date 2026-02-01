" --- Path Fixes for Neovim ---
if has('nvim')
    " This fixes the E919 error by telling NVIM where the 'pack' folder is
    set runtimepath+=~/.vim
    set packpath+=~/.vim
endif

" --- Terminal Color Fix ---
" This fixes the 'blue' issue in many terminals
if (has("termguicolors"))
    set termguicolors
endif

" --- Theme Configuration ---
if has('nvim')
    " Load Neovim version
    packadd! onedark-nvim
    lua << EOF
        require('onedark').setup({ style = 'darker' })
        require('onedark').load()
EOF
else
    " Load Vim version
    packadd! onedark-vim
    syntax on
    colorscheme onedark
endif

" --- General Quality of Life ---
set background=dark
set number
set relativenumber
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set wrap
set linebreak
set hlsearch
set incsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set cursorline
set showmatch

" Clear search highlighting
nnoremap <silent> <Esc> :nohlsearch<CR><Esc>

" Spellcheck for markdown
autocmd FileType markdown setlocal spell spelllang=en_gb
