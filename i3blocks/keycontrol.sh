#!/usr/bin/env bash
# wrapper script for the predefined i3block "keyindicator" which enables
# toggling the Num-Lock/Caps-Lock from the i3bar
# 2017 Dennis Schürholz - https://dennisschuerholz.de

EXIT=0
if [ $BLOCK_BUTTON -eq 1 ]; then
  if [ $BLOCK_INSTANCE == "CAPS" ]; then
    xdotool key Caps_Lock
  elif [ $BLOCK_INSTANCE == "NUM" ]; then
    xdotool key Num_Lock
  else
    EXIT=33
  fi
fi
/usr/lib/i3blocks/keyindicator "$@"
exit $EXIT
