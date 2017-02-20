#!/usr/bin/env bash

read -rsp $'Press any key to connect...\n' -n1
mosh d -- tmux attach -t irc
