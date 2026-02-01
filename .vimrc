" --- Compatibility Layer ---
" Make Neovim look into ~/.vim so it can find the packages we cloned
if has('nvim')
  set runtimepath+=~/.vim
endif

" --- Theme Configuration ---
if has('nvim')
    " 1. Load the Neovim-specific package
    packadd! onedark-nvim
    
    " 2. Use Lua to configure the 'darker' variant
    lua << EOF
    require('onedark').setup {
        style = 'darker'
    }
    require('onedark').load()
EOF
else
    " 1. Load the standard Vim package
    packadd! onedark-vim
    
    " 2. Standard Vim color setup
    if (has("termguicolors"))
        set termguicolors
    endif
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

" Search improvements
set hlsearch
set incsearch
set ignorecase
set smartcase

" Better backspace behavior
set backspace=indent,eol,start

" Clear search highlighting with Esc
nnoremap <silent> <Esc> :nohlsearch<CR><Esc>

" Highlight current line
set cursorline

" Spellcheck for markdown
autocmd FileType markdown setlocal spell spelllang=en_gb

" Show matching brackets
set showmatch
