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
    rm $1
  fi
}

conditional_clone() {
  if [ ! -d $2 ]; then
    git clone $1 $2
  fi
}

relink() {
  if [ -h $2 ]; then
    rm $2
  fi
  ln -s $1 $2
}

####################################
############### BASH ###############
####################################

backup ~/.bashrc
relink $DOTFILES/bashrc ~/.bashrc

####################################
############### ZSH ################
####################################

conditional_clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
conditional_clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
conditional_clone git://github.com/tarruda/zsh-autosuggestions ~/.zsh-autosuggestions

relink $DOTFILES/sahil.zsh-theme ~/.oh-my-zsh/themes/sahil.zsh-theme

backup ~/.zshrc
relink $DOTFILES/zshrc ~/.zshrc
