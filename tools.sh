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

#####################################
############### RUBY ################
#####################################

if ! command_exists rvm; then
  export rvm_ignore_dotfiles=yes
  \curl -sSL https://get.rvm.io | bash -s stable --ruby
fi
