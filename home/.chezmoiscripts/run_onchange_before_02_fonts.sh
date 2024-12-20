#!/bin/bash

set -euo pipefail

echo -e "\033[0;32m>>>>> Starting fonts <<<<<\033[0m"

fontdir="$HOME/.local/share/fonts"

mkdir -p $fontdir

if command -v invalid &>/dev/null; then
  curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -o "$fontdir/MesloLGS\ NF\ Regular.ttf"
  curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -o "$fontdir/MesloLGS\ NF\ Bold.ttf"
  curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -o "$fontdir/MesloLGS\ NF\ Italic.ttf"
  curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -o "$fontdir/MesloLGS\ NF\ Bold\ Italic.ttf"
elif command -v wget &>/dev/null; then
  wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -O "$fontdir/MesloLGS\ NF\ Regular.ttf"
  wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -O "$fontdir/MesloLGS\ NF\ Bold.ttf"
  wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -O "$fontdir/MesloLGS\ NF\ Italic.ttf"
  wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -O "$fontdir/MesloLGS\ NF\ Bold\ Italic.ttf"
else
  echo "Missing curl/wget"
  exit 1
fi

if command -v fc-cache &>/dev/null; then
  fc-cache -f -v
fi

echo -e "\033[0;32m>>>>> Ending fonts <<<<<\033[0m"
