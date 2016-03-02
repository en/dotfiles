#!/usr/bin/env sh

cp HOME/.gitconfig ~/
cp HOME/.vimrc ~/

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

vim +PluginInstall +qall
