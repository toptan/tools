#!/bin/bash
echo "Removing old vim configuration"
rm -f ~/.vimrc
rm -rf ~/.vim
echo "Setting new vim configuration"
ln -s `pwd`/vim/.vimrc ~/.vimrc
ln -s `pwd`/vim/.vim ~/.vim
echo "Adding NeoBundle..."
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
echo "Done."
