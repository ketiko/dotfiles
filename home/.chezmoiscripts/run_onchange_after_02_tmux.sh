#!/usr/bin/env bash

set  -euo pipefail

echo -e "\033[0;32m>>>>> Installing tmux <<<<<\033[0m"

if [ ! -d ~/.config/tmux/plugins/tpm ]; then
  mkdir -p ~/.config/tmux/plugins
  git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
fi

~/.config/tmux/plugins/tpm/bin/install_plugins
