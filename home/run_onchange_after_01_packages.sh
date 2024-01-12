#!/usr/bin/env bash

set  -euo pipefail

echo -e "\033[0;32m>>>>> Installing packages <<<<<\033[0m"

please=
if [[ $(uname) != Darwin ]]; then
  if command -v sudo &>/dev/null; then
    please=sudo
  fi
fi

if [[ $(uname) != Darwin ]]; then
  $please apt-get install -y \
    ack-grep \
    atop \
    axel \
    bar \
    bat \
    build-essential \
    curl \
    dstat \
    editorconfig \
    exa \
    exuberant-ctags \
    fd-find \
    fzf \
    git \
    git-extras \
    grc \
    htop \
    ioping \
    iotop \
    keychain \
    neovim \
    nodejs \
    npm \
    pv \
    python3-dev \
    python3-neovim \
    python3-pip \
    ranger \
    ripgrep \
    ruby \
    ruby-dev \
    shellcheck \
    silversearcher-ag \
    stow \
    tmux \
    tree \
    vim-nox \
    wget \
    zsh
fi

if [[ $(uname) == Darwin ]]; then
  if command -v brew &>/dev/null; then
    brew install \
      ack \
      axel \
      bar \
      bat \
      coreutils \
      cscope \
      curl \
      diff-so-fancy \
      editorconfig \
      eza \
      fd \
      findutils \
      fzf \
      git \
      git-extras \
      gnu-getopt \
      gnu-indent \
      gnu-sed \
      gnu-tar \
      gnu-time \
      gnu-which \
      gnupg \
      gnutls \
      gpg \
      gpg2 \
      grc \
      grep \
      htop-osx \
      hub \
      keychain \
      macvim \
      ncdu \
      neofetch \
      neovim \
      node \
      npm \
      openssl \
      pinentry-mac \
      pv \
      python \
      ranger \
      readline \
      reattach-to-user-namespace \
      ripgrep \
      ruby \
      shellcheck \
      ssh-copy-id \
      stow \
      the_silver_searcher \
      tidy-html5 \
      tmux \
      trash \
      tree \
      watch \
      wget \
      wrk \
      zsh

    brew install --HEAD universal-ctags/universal-ctags/universal-ctags
    brew tap homebrew/cask-fonts
    brew install --cask font-hack-nerd-font
    brew install --cask font-droid-sans-mono-nerd-font
  fi
fi

$please gem install neovim

$please npm install -g diff-so-fancy
$please npm install -g neovim

python3 -m pip install --user --upgrade neovim
python3 -m pip install --user --upgrade pynvim

if command -v sudo &>/dev/null; then
  sudo -k
fi
