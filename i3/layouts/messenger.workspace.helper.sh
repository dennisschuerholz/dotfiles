#!/usr/bin/env bash

read -rsp $'Press any key to connect...\n' -n1
mosh irc -- tmux attach -t irc
