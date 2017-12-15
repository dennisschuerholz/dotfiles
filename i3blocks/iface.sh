#!/usr/bin/env bash
# wrapper script for the predefined i3block "iface" which enables toggling
# between ip v4 and v6 and copies them to the clipboard
# 2017 Dennis Schürholz - https://dennisschuerholz.de


VERBOSE=false
if [[ "$@" == "-v" ]]; then
    VERBOSE=true
fi
LOCKFILE="/tmp/iface.$BLOCK_INSTANCE.v6.lock"
if [[ $BLOCK_BUTTON -eq 1 ]]; then
  if [ -f $LOCKFILE ]; then
    rm $LOCKFILE
  else
    touch $LOCKFILE
  fi
fi
IP_VERSION=4
OTHER_IP_VERSION=6
if [ -f $LOCKFILE ]; then
  IP_VERSION=6
  OTHER_IP_VERSION=4
fi
IP_ADDRESS=`BLOCK_BUTTON=0 /usr/lib/i3blocks/iface -$IP_VERSION`
OTHER_IP_ADDRESS=`BLOCK_BUTTON=0 /usr/lib/i3blocks/iface -$OTHER_IP_VERSION`
if [[ -z $IP_ADDRESS || "$IP_ADDRESS" =~ ^down.* ]]; then
  if $VERBOSE || [[ $OTHER_IP_ADDRESS && "$OTHER_IP_ADDRESS" =~ ^((?!down).)*$ ]]; then
    echo "no v$IP_VERSION address"
  else
    echo ""
  fi
  echo ""
  echo "#FF0000"
else
  IP=(${IP_ADDRESS[@]})
  case $BLOCK_BUTTON in
    [2-3]) echo -n "$IP" | xsel -b -i ;;
    *) ;;
  esac
  echo "$IP_ADDRESS"
fi
