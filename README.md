# Ryan Hansen's dotfiles

These are my system configuration files.  Currently tested on ubuntu linux.
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
Such as vim, git, Vundle, solarized color themes, rbenv, etc.
These are not required.

## Uninstall

```terminal
cd ~/.dotfiles
./uninstall
```
