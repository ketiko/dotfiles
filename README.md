# Ryan Hansen's dotfiles [![CI](https://github.com/ketiko/dotfiles/actions/workflows/ci.yml/badge.svg)](https://github.com/ketiko/dotfiles/actions/workflows/ci.yml)

These are my system configuration files.  Currently tested on Ubuntu Linux and OS X.
Inspired by [Ryan Bates](https://github.com/ryanb/dotfiles) dotfiles.
I didn't want a dependency on ruby for the installation,
so everything is straight bash.

## Installation

```terminal
git clone git://github.com/ketiko/dotfiles ~/.dotfiles
cd ~/.dotfiles
./install
```

## Features

The install will prompt you to override or skip any existing files.
If you override it will create .backup files for you.
When you uninstall it will restore these .backup files and remove the symlinks.

It also includes additional scripts to install other things I typically use.
Such as vim, git, Vundle, solarized color themes, rbenv, asdf, etc.
These are not required.

## Uninstall

```terminal
cd ~/.dotfiles
./uninstall
```
