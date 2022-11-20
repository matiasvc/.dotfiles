#!/usr/bin/env bash

# Install zsh if it isn't already installed

# install zsh with oh-my-zsh and change shell
if ! [ -x "$(command -v zsh)" ]; then
	echo ">>>> Installing zsh <<<<"
	sudo apt update
	sudo apt install -y zsh zsh-doc
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
	echo ">>>> zsh is already installed <<<<"
fi
./
