#!/bin/bash

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
