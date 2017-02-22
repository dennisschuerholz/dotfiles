#!/usr/bin/env bash
# shows external ip address and allow to copy it to the system clipboard using
# the right and middle button of the mouse, also left click toggles between the
# ip v4 and ip v6 addresses
# adapted from Alexander Keller https://github.com/vivien/i3blocks/wiki/Writing-Your-Own-Blocklet#my-external-ip
# 2017 Dennis Schürholz - https://dennisschuerholz.de

LOCKFILE="/tmp/externalip.v6.lock"
if [[ $BLOCK_BUTTON -eq 1 ]]; then
  if [ -f $LOCKFILE ]; then
    rm $LOCKFILE
  else
    touch $LOCKFILE
  fi
fi
IP_VERSION=4
if [ -f $LOCKFILE ]; then
  IP_VERSION=6
fi
IP_FILE="/tmp/externalip.v$IP_VERSION.address"
IP_ADDRESS=`cat $IP_FILE 2>/dev/null`
if [ -z `find $IP_FILE -mmin 1` ] || [ -z $IP_ADDRESS ]; then
  IP_ADDRESS=$(curl -m 10 https://v$IP_VERSION.ifconfig.co)
  echo "$IP_ADDRESS">$IP_FILE
fi
if [ -z $IP_ADDRESS ]; then
  echo "no public v$IP_VERSION address"
  exit 33
fi
case $BLOCK_BUTTON in
  [2-3]) echo -n "$IP_ADDRESS" | xsel -b -i ;;
  *) ;;
esac
echo "$IP_ADDRESS"
