FROM ubuntu:latest as base

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Denver

RUN apt-get update

RUN apt-get install -y --install-recommends \
  ack \
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
  libffi-dev\
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
  sudo \
  tmux \
  tree \
  vim-nox \
  wget \
  zsh

RUN useradd --create-home --home-dir /home/tester --shell /usr/bin/bash -p $(perl -e 'print crypt($ARGV[0], "password")' 'testing') tester
RUN adduser tester sudo

WORKDIR /home/tester

RUN mkdir -p /home/tester/.dotfiles
COPY . /home/tester/.dotfiles
RUN chown -R tester:tester /home/tester/.dotfiles

USER tester

WORKDIR /home/tester/.dotfiles

CMD "/usr/bin/bash"
