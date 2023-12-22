#!/bin/bash

set -e

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

if ! command_exists zsh; then
  if [ "$(uname)" == "Darwin" ]; then
    if ! command_exists brew; then
      echo "Please install Homebrew:"
      echo "ruby -e \"\$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)\""
      false
    else
      brew install zsh
    fi
  else
    echo "Please install zsh:"
    false
  fi
fi

conditional_clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
conditional_clone https://github.com/zsh-users/zsh-history-substring-search.git ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search
conditional_clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
conditional_clone https://github.com/tarruda/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

relink $DOTFILES/sahil.zsh-theme ~/.oh-my-zsh/themes/sahil.zsh-theme
