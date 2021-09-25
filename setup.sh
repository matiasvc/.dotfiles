#!/usr/bin/env bash

# This script symlinks all the config files to the right location.

# Path of folder where this script is, which should be the .dotfiles folder.
DOTFILES=$(dirname $(realpath -s $0))

# .profile setup
rm -f ${HOME}/.profile
ln -s ${DOTFILES}/profile/.profile ${HOME}/.profile

# alacritty setup
rm -f ${HOME}/.config/alacritty/alacritty.yml
mkdir -p ${HOME}/.config/alacritty
ln -s ${DOTFILES}/alacritty/alacritty.yml ${HOME}/.config/alacritty/alacritty.yml

# zsh setup
rm -f ${HOME}/.zshrc
ln -s ${DOTFILES}/zsh/.zshrc ${HOME}/.zshrc

mkdir -p ${HOME}/.zsh/
rm -f ${HOME}/.zsh/antigen.zsh
ln -s ${DOTFILES}/zsh/antigen.zsh ${HOME}/.zsh/antigen.zsh
rm -f ${HOME}/.zsh/p10k.zsh
ln -s ${DOTFILES}/zsh/p10k.zsh ${HOME}/.zsh/p10k.zsh

rm -rf ${HOME}/zsh/external
ln -s ${DOTFILES}/zsh/external ${HOME}/.zsh/external

# nvim setup
rm -rf ${HOME}/.config/nvim/
ln -s ${DOTFILES}/nvim ${HOME}/.config/nvim

# git setup
rm -f ${HOME}/.gitconfig
ln -s ${DOTFILES}/git/.gitconfig ${HOME}/.gitconfig

# i3 setup
rm -rf ${HOME}/.config/i3
mkdir -p ${HOME}/.config
ln -s ${DOTFILES}/i3 ${HOME}/.config/i3

# i3status setup
rm -rf ${HOME}/.config/i3status
ln -s ${DOTFILES}/i3status ${HOME}/.config/i3status

# i3blocks setup
rm -rf ${HOME}/.config/i3blocks
ln -s ${DOTFILES}/i3blocks ${HOME}/.config/i3blocks

# ranger setup
rm -rf ${HOME}/.config/ranger
ln -s ${DOTFILES}/ranger ${HOME}/.config/ranger

# ssh config setup
mkdir -p ${HOME}/.ssh
rm -f ${HOME}/.ssh/config
ln -s ${DOTFILES}/ssh/config ${HOME}/.ssh/config

# jupyter setup
mkdir -p ${HOME}/.jupyter
rm -rf ${HOME}/.jupyter/jupyter_notebook_config.py
ln -s ${DOTFILES}/jupyter/jupyter_notebook_config.py ${HOME}/.jupyter/

