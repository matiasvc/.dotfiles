#!/usr/bin/env bash

# This script with install the patched Hack font from https://github.com/ryanoasis/nerd-fonts

echo 'Installing nerd-fonts'

NERD_FONTS_VERSION='2.2.2'
git clone --depth 1 --branch v${NERD_FONTS_VERSION} https://github.com/ryanoasis/nerd-fonts.git /tmp/nerd-fonts
/tmp/nerd-fonts/install.sh Hack

