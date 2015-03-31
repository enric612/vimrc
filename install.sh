#!/bin/bash
# Script d'instalació de configuracions de vim

echo "Decarregant vundle"
git submodule add -f http://github.com/gmarik/vundle.git bundle/vundle.vim
 

echo "Linkant configuracions"
mkdir ~/.vim
ln -s $PWD/bundle ~/.vim/bundle
ln -s $PWD/vimrc ~/.vimrc
ln -s $PWD/gvimrc ~/.gvimrc

echo "Instal·lant plugins amb vundle"
vim +PluginInstall +qall

echo "Fet!"

