#!/usr/bin/env bash

# Install fzf if it isn't already installed

# Install fzf
if [ ! -d "${HOME}/.fzf" ]; then
  echo ">>>> Installing fzf <<<<"
  FZF_VERSION='v0.56.2'
  git clone --depth 1 --branch ${FZF_VERSION} https://github.com/junegunn/fzf.git ${HOME}/.fzf
  ${HOME}/.fzf/install
else
  echo ">>>> fzf is already installed <<<<"
fi
