#!/usr/bin/env bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
dotfiles_dir="$(dirname "${script_dir}")"

mkdir -p "${dotfiles_dir}/miniconda"
