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
    (
    cd
    wget -O zsh-5.0.2.tar.gz http://downloads.sourceforge.net/project/zsh/zsh/5.0.2/zsh-5.0.2.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fzsh%2Ffiles%2Fzsh%2F5.0.2%2F
    tar -xvf zsh-5.0.2.tar.gz
    rm zsh-5.0.2.tar.gz
    cd zsh-5.0.2
    ./configure --enable-pcre
    make
    sudo make install
    )
    check_status
  fi
fi

conditional_clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
conditional_clone https://github.com/zsh-users/zsh-history-substring-search.git ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search
conditional_clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
conditional_clone git://github.com/tarruda/zsh-autosuggestions ~/.zsh-autosuggestions

relink $DOTFILES/sahil.zsh-theme ~/.oh-my-zsh/themes/sahil.zsh-theme
