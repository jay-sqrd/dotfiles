" --- Path Fixes for Neovim ---
if has('nvim')
    set runtimepath+=~/.vim
    set packpath+=~/.vim
endif

" --- 1. Detect Terminal Capabilities ---
" Check for TrueColor support (standard for modern terminals and macOS Tahoe+)
let s:has_truecolor = ($COLORTERM == 'truecolor' || $COLORTERM == '24bit' || has('termguicolors'))

" --- 2. Theme Selection Logic ---
if s:has_truecolor
    " ADVANCED TERMINAL: Use OneDark
    set termguicolors
    
    if has('nvim')
        " Use the Neovim-specific Lua version
        packadd! onedark-nvim
        lua << EOF
            require('onedark').setup({ style = 'darker' })
            require('onedark').load()
EOF
    else
        " Use the standard Vimscript version
        packadd! onedark-vim
        syntax on
        colorscheme onedark
    endif
else
    " BASIC TERMINAL (Work/Older Macs): Use Everforest
    packadd! everforest
    let g:everforest_background = 'medium'
    let g:everforest_enable_italic = 1
    syntax on
    colorscheme everforest
endif

" --- 3. Quality of Life Settings ---
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

" Clear search highlighting with Esc
nnoremap <silent> <Esc> :nohlsearch<CR><Esc>

" Spellcheck for markdown
autocmd FileType markdown setlocal spell spelllang=en_gb
