#!/bin/bash
# Script d'instalació de configuracions de vim

echo "=================================================="
echo "Decarregant vundle"
echo "=================================================="
git submodule add -f http://github.com/gmarik/vundle.git bundle/Vundle.vim
git submodule update --init
echo "=================================================="
echo "Instal·lant dependencies per a YCM"
echo "=================================================="
sudo apt-get update 
sudo apt-get install build-essential cmake 
sudo apt-get install python-dev

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
echo "Compilant YCM (Beta)" 
echo "=================================================="
~/.vim/bundle/YouCompleteMe/install.sh --clang-completer

echo "=================================================="
echo "Fet!"
echo "=================================================="

