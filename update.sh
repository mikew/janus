#!/usr/bin/env bash

cd ~/.vim/
git fetch --all
git pull origin master

vim="vim"
if which mvim; then
  vim="mvim"
elif which nvim; then
  vim="nvim"
fi

"${vim}" +PlugUpdate +PlugClean! +PlugUpgrade
