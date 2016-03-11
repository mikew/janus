#!/usr/bin/env bash

cd ~/.vim/
git fetch --all
git pull origin $(git symbolic-ref --short -q HEAD)

vim="vim"
if which mvim; then
  vim="mvim"
elif which nvim; then
  vim="nvim"
fi

"${vim}" +'PlugUpdate | PlugClean! | PlugUpgrade'
