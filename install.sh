#!/bin/bash
# Script d'instalació de configuracions de vim

echo "=================================================="
echo "Decarregant vundle"
echo "=================================================="
git submodule add -f http://github.com/gmarik/vundle.git bundle/Vundle.vim
git submodule update --init

echo "=================================================="
echo "Instal·lant ctags per a tagbar"
echo "=================================================="
sudo apt-get install exuberant-ctags

echo "=================================================="
echo "Linkant configuracions"
echo "=================================================="
mkdir ~/.vim
ln -s $PWD/bundle ~/.vim/bundle
ln -s $PWD/vimrc ~/.vimrc
ln -s $PWD/gvimrc ~/.gvimrc

echo "=================================================="
echo "Instal·lant plugins amb vundle"
echo "=================================================="
vim +PluginInstall +qall


echo "=================================================="
echo "Fet!"
echo "=================================================="

