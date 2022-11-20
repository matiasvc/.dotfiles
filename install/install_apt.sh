#!/usr/bin/env bash

# Install all my programs that can be installed directly from `apt`

sudo apt update

# Install packages
# arandr: gui window layout manager
# build-essential: basic compilers and libraries
# cifs-utils: utilities for mounting SMB/CIFS shares
# cmake: build system
# feh: image viewer & desktop background
# ffmpeg: video codec and converter
# git: source control
# gnome-screenshot: screenshot utility
# gparted: disk partitioning and formatting utility
# htop, nmon & bmon: system monitors
# imagemagick: image utilities
# jq: command-line JSON parser
# lz4: compression library
# mosh: ssh alternative with better support for high latency or unstable connections
# ncdu: disk usage analyzer utility
# ninja-build: build system
# polybar: status bar
# python3 python3-pip: python along with pip package manager
# unclutter-xfixes: hide mouse when not in use
# vlc: video player
# wget & curl: HTTP file retrivers
# xautoloc: auto password lock
sudo apt-get install -y \
  arandr \
  build-essential \
  cifs-utils \
  cmake cmake-doc \
  feh \
  ffmpeg \
  git \
  gnome-screenshot \
  gparted \
  htop nmon bmon \
  imagemagick \
  jq \
  lz4 \
  mosh \
  ncdu \
  ninja-build \
  polybar \
  python3 python3-pip \
  unclutter-xfixes \
  vlc \
  wget curl \
  xautolock

