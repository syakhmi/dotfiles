#!/bin/bash

DOTFILES=$(dirname $0)
if [[ $DOTFILES != /* ]]; then
  if [ $DOTFILES == "." ]; then
    DOTFILES=$(pwd)
  else
    DOTFILES=$(pwd)/$DOTFILES
  fi
fi

backup() {
  if [ -f $1 ] && [ ! -h $1 ]; then
    cp $1 $1.orig
  fi
  if [ -f $1 ] || [ -h $1 ]; then
    rm $1
  fi
}

conditional_clone() {
  if [ ! -d $2 ]; then
    git clone $1 $2
  fi
}

####################################
############### BASH ###############
####################################

backup ~/.bashrc
ln -s $DOTFILES/bashrc ~/.bashrc
echo $DOTFILES

####################################
############### ZSH ################
####################################

conditional_clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
conditional_clone git://github.com/tarruda/zsh-autosuggestions ~/.zsh-autosuggestions

backup ~/.zshrc
ln -s $DOTFILES/zshrc ~/.zshrc
