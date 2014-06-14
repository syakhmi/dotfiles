#!/bin/bash

backup() {
  if [ -f $1 ] && [ ! -h $1 ]; then
    cp $1 $1.orig
    rm $1
  fi
}

check_status() {
  if [ $? -ne 0 ]; then exit 1; fi
}

command_exists() {
  type "$1" &> /dev/null
}

conditional_clone() {
  if [ ! -d $2 ]; then
    git clone $1 $2;
  elif [ -d $2/.git ]; then
    ( cd $2 ; git pull )
  fi
}

relink() {
  if [ -h $2 ]; then
    rm $2
  fi
  ln -s $1 $2
}
