#!/usr/bin/env bash

DOWNLOAD_URL="https://github.com/git-lfs/git-lfs/releases/download/v3.2.0/git-lfs-linux-amd64-v3.2.0.tar.gz"

TMP_PATH="/tmp/git-lfs"

mkdir -p $TMP_PATH
wget $DOWNLOAD_URL -O - | tar xvzf - -C $TMP_PATH

sudo ${TMP_PATH}/git-lfs-3.2.0/install.sh

