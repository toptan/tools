#!/bin/bash
echo "Removing old vim configuration"
rm -f ~/.vimrc
rm -rf ~/.vim
echo "Setting new vim configuration"
ln -s `pwd`/vim/.vimrc ~/.vimrc
ln -s `pwd`/vim/.vim ~/.vim
echo "Done."
