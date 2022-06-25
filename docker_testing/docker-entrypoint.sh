#!/bin/sh
# This script will run anytime this docker image starts

cd ~/.dotfiles
./install dotfiles O

# Then exec the container's main process (what's set as CMD in the Dockerfile).
# This is needed so that the main process changes PIDs to what the new command is.
# This allows the $@ passed command to receive signals like SIGINT and SIGTERM properly
exec "$@"
