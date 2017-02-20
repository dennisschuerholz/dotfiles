#!/usr/bin/env bash
# shows external ip address and allow to copy it to the system clipboard using
# the right and middle button of the mouse
# adapted from Alexander Keller https://github.com/vivien/i3blocks/wiki/Writing-Your-Own-Blocklet#my-external-ip
# 2017 Dennis Schürholz - https://dennisschuerholz.de

IP_VERSION="v4"
if [ $BLOCK_INSTANCE -eq 6 ]; then
  IP_VERSION="v6"
fi
IP=$(curl -m 10 https://$IP_VERSION.ifconfig.co)
if [ -z $IP ]; then
  echo "no public $IP_VERSION address"
  exit 33
fi
case $BLOCK_BUTTON in
  [2-3]) echo -n "$IP" | xsel -b -i ;;
  *) echo "$IP" ;;
esac
