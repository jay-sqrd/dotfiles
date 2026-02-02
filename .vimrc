" --- 1. Path Fixes for Neovim ---
if has('nvim')
    set runtimepath+=~/.vim
    set packpath+=~/.vim
endif

" --- 2. Strict Terminal Capability Detection ---
" We will only enable TrueColor if we are CERTAIN the terminal supports it.
" Standard Apple Terminal (Apple_Terminal) usually fails this check.
let s:is_modern_term = ($COLORTERM == 'truecolor' || $COLORTERM == '24bit' || $ITERM_PROGRAM == 'iTerm.app')
let s:is_apple_terminal = ($TERM_PROGRAM == 'Apple_Terminal')

" --- 3. Theme Selection Logic ---
if s:is_modern_term && !s:is_apple_terminal
    " HIGH-END: OneDark (requires TrueColor)
    set termguicolors
    if has('nvim')
        packadd! onedark-nvim
        lua << EOF
            require('onedark').setup({ style = 'darker' })
            require('onedark').load()
EOF
    else
        packadd! onedark-vim
        syntax on
        colorscheme onedark
    endif
else
    " STABLE FALLBACK: Everforest (optimized for 256-color/Apple Terminal)
    " We explicitly DO NOT 'set termguicolors' here to avoid the blue tint
    packadd! everforest
    
    " Everforest config
    let g:everforest_background = 'medium'
    let g:everforest_enable_italic = 1
    
    syntax on
    colorscheme everforest
endif

" --- 4. Quality of Life ---
set background=dark
set number
set relativenumber
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set cursorline
set hlsearch
nnoremap <silent> <Esc> :nohlsearch<CR><Esc>
