#!/usr/bin/env bash

function die()
{
    echo "${@}"
    exit 1
}

# Add .old to any existing Vim file in the home directory
for filepath in "${HOME}/.vim" "${HOME}/.vimrc" "${HOME}/.gvimrc"; do
  if [ -e "${filepath}" ]; then
    mv "${filepath}" "${filepath}.old" || die "Could not move ${filepath} to ${filepath}.old"
    echo "${filepath} has been renamed to ${filepath}.old"
  fi
done

# Clone Janus into .vim
git clone https://github.com/mikew/janus.git "${HOME}/.vim" \
  || die "Could not clone the repository to ${HOME}/.vim"

# Create vimrc files
echo "source ~/.vim/vim/vimrc" >> ~/.vimrc
echo "source ~/.vim/vim/gvimrc" >> ~/.gvimrc

vim="vim"
if which mvim; then
  vim="mvim"
elif which nvim; then
  vim="nvim"
fi

echo "You may need to restart ${vim} to complete Janus installation." | "${vim}" -R +PlugInstall -
