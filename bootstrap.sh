#!/bin/bash

DOTFILES=$(dirname $0)
if [[ $DOTFILES != /* ]]; then
  if [ $DOTFILES == "." ]; then
    DOTFILES=$(pwd)
  else
    DOTFILES=$(pwd)/$DOTFILES
  fi
fi

source "$DOTFILES/utils.sh"

sh "$DOTFILES/dependencies.sh"

####################################
############### BASH ###############
####################################

backup ~/.bashrc
relink $DOTFILES/bashrc ~/.bashrc

####################################
############### ZSH ################
####################################

backup ~/.zshrc
relink $DOTFILES/zshrc ~/.zshrc
