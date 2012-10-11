#!/bin/bash

export DISPLAY=:0
if [ "$1" == "on" ]
then
  exec hamster-cli start tukios
fi
if [ "$1" == "off" ]
then
  exec hamster-cli stop
fi

exec hamster-cli "$@"
