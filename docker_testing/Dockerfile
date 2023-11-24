FROM ubuntu:latest as base

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive TZ=America/Denver apt-get install -y --no-install-recommends \
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
    fasd \
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
    python3-pip \
    ranger \
    ripgrep \
    silversearcher-ag \
    stow \
    sudo \
    tmux \
    tree \
    vim-nox \
    wget \
    zsh

RUN useradd --create-home --home-dir /home/tester --shell /usr/bin/bash -p $(perl -e 'print crypt($ARGV[0], "password")' 'test') tester
RUN adduser tester sudo

WORKDIR /home/tester

RUN mkdir -p /home/tester/.dotfiles
COPY . /home/tester/.dotfiles
RUN chown -R tester:tester /home/tester/.dotfiles

USER tester

WORKDIR /home/tester/.dotfiles


CMD "/usr/bin/bash"
