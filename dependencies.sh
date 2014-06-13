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

####################################
############### ZSH ################
####################################

conditional_clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
conditional_clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
conditional_clone git://github.com/tarruda/zsh-autosuggestions ~/.zsh-autosuggestions
