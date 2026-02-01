#!/bin/bash

# Define paths
DOTFILES_DIR=~/dotfiles
VIM_OPT_DIR=~/.vim/pack/themes/opt

# 1. Backup existing vimrc if it's a real file
if [ -f ~/.vimrc ] && [ ! -L ~/.vimrc ]; then
    mv ~/.vimrc ~/.vimrc.backup
    echo "Backed up existing .vimrc"
fi

# 2. Symlink the dotfiles
mkdir -p ~/.config/nvim
ln -sf "$DOTFILES_DIR/.vimrc" ~/.vimrc
ln -sf "$DOTFILES_DIR/.vimrc" ~/.config/nvim/init.vim
echo "Linked configs for Vim and Neovim"

# 3. Create the directory for optional packages
mkdir -p "$VIM_OPT_DIR"

# 4. Install OneDark for standard Vim (joshdick)
if [ ! -d "$VIM_OPT_DIR/onedark-vim" ]; then
    echo "Cloning joshdick/onedark.vim..."
    git clone --depth 1 https://github.com/joshdick/onedark.vim "$VIM_OPT_DIR/onedark-vim"
fi

# 5. Install OneDark for Neovim (navarasu)
if [ ! -d "$VIM_OPT_DIR/onedark-nvim" ]; then
    echo "Cloning navarasu/onedark.nvim..."
    git clone --depth 1 https://github.com/navarasu/onedark.nvim "$VIM_OPT_DIR/onedark-nvim"
fi

echo "Install complete!"
