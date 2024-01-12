#!/bin/bash

set  -euo pipefail

echo -e "\033[0;32m>>>>> Making symlinks <<<<<\033[0m"

ln -vnsf "$HOME/.profile" "$HOME/.zprofile"
ln -vnsf "$HOME/.dir_colors" "$HOME/.dircolors"
