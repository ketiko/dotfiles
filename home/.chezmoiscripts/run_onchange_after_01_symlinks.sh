#!/bin/bash

set  -euo pipefail

echo -e "\033[0;32m>>>>> Starting symlinks <<<<<\033[0m"

ln -vnsf "$HOME/.profile" "$HOME/.zprofile"
ln -vnsf "$HOME/.dir_colors" "$HOME/.dircolors"

echo -e "\033[0;32m>>>>> Ending symlinks <<<<<\033[0m"
