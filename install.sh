#!/bin/bash

# Define paths
VIM_OPT_DIR="$HOME/.vim/pack/themes/opt"
DOTFILES_DIR="$HOME/dotfiles"

# 1. Setup Config Symlinks
mkdir -p ~/.config/nvim
ln -sf "$DOTFILES_DIR/.vimrc" ~/.vimrc
ln -sf "$DOTFILES_DIR/.vimrc" ~/.config/nvim/init.vim
echo "Linked configs."

# 2. Create Plugin Directory
mkdir -p "$VIM_OPT_DIR"

# 3. Install Everforest (The 256-color fallback for everyone)
if [ ! -d "$VIM_OPT_DIR/everforest" ]; then
    echo "Cloning Everforest..."
    git clone --depth 1 https://github.com/sainnhe/everforest.git "$VIM_OPT_DIR/everforest"
fi

# 4. Install OneDark for Vim (The TrueColor option for standard Vim)
if [ ! -d "$VIM_OPT_DIR/onedark-vim" ]; then
    echo "Cloning onedark.vim (Vim version)..."
    git clone --depth 1 https://github.com/joshdick/onedark.vim "$VIM_OPT_DIR/onedark-vim"
fi

# 5. Install OneDark for Neovim (The TrueColor option for NVIM)
if [ ! -d "$VIM_OPT_DIR/onedark-nvim" ]; then
    echo "Cloning onedark.nvim (NVIM version)..."
    git clone --depth 1 https://github.com/navarasu/onedark.nvim "$VIM_OPT_DIR/onedark-nvim"
fi

echo "Install complete! Your setup will now auto-detect terminal capabilities."
