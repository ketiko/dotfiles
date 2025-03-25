#!/usr/bin/env bash

set -eo pipefail

echo -e "\033[0;32m>>>>> Starting iterm2 <<<<<\033[0m"

if [ -n "$ITERM_PROFILE" ]; then
  echo "Downloading iterm2 color themes..."
  set +e
  wget -nc https://raw.githubusercontent.com/JonathanSpeek/palenight-iterm2/master/palenight.itermcolors -O ~/Downloads/palenight.itermcolors
  wget -nc https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/catppuccin-mocha.itermcolors -O ~/Downloads/catppuccin-mocha.itermcolors

  set -e
  echo "Open Iterm \`Settings, Profiles, Colors\` and import the color themes downloaded in ~/Downloads"
fi

echo -e "\033[0;32m>>>>> Ending iterm2 <<<<<\033[0m"
