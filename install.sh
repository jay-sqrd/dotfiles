#!/bin/bash

# Define paths
VIM_OPT_DIR="$HOME/.vim/pack/themes/opt"

# 1. Setup Config Symlinks
mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.vimrc ~/.config/nvim/init.vim

# 2. Create Plugin Directory
mkdir -p "$VIM_OPT_DIR"

# 3. Install Everforest (for standard Vim on work laptop)
if [ ! -d "$VIM_OPT_DIR/everforest" ]; then
    echo "Cloning Everforest for Vim..."
    git clone --depth 1 https://github.com/sainnhe/everforest.git "$VIM_OPT_DIR/everforest"
fi

# 4. Install OneDark (for Neovim on home laptop)
if [ ! -d "$VIM_OPT_DIR/onedark-nvim" ]; then
    echo "Cloning OneDark for Neovim..."
    git clone --depth 1 https://github.com/navarasu/onedark.nvim "$VIM_OPT_DIR/onedark-nvim"
fi

echo "Done! Everforest (Vim) and OneDark (NVIM) are ready."
