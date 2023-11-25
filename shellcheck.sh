#!/usr/bin/env bash

set -e

for file in $(find stow/zsh stow/bash stow/linux scripts **.sh -type f)
do
  shellcheck --format=gcc -e SC1090 -e SC1091 "$file"
done
