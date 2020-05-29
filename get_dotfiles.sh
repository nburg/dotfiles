#!/bin/bash

git clone https://github.com/nburg/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
for i in `ls -A`; do
  if [ -e ~/$i ]; then
    rm -rf ~/$i
  fi
  ln -s ~/.dotfiles/$i ~/$i
done
