#!/usr/bin/bash

DOTFILES="$(dirname "$0")"

backup() {
	if [ -d $1 ]; then
		cp $1 $1.orig
	fi
	rm $1
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

####################################
############### ZSH ################
####################################

conditional_clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
conditional_clone git://github.com/tarruda/zsh-autosuggestions ~/.zsh-autosuggestions

backup ~/.zshrc
ln -s $DOTFILES/zshrc ~/.zshrc
