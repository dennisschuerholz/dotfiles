#!/usr/bin/env bash
# toggles the DPMS energy settings (screen blanking)
# based on a script by rikn00 https://www.reddit.com/r/archlinux/comments/2jehwx/black_screen_screensaver_after_10_minutes/clazrli/
# 2017 Dennis Schürholz - https://dennisschuerholz.de

if [ -z $BLOCK_NAME ] || [ $BLOCK_BUTTON -eq 1 ]; then
  ENABLED=$(xset q | sed -n 's/.*DPMS is \(Enabled\).*/\1/p')
  if [ $ENABLED ]; then
    xset -dpms && xset s off
  else
    xset +dpms && xset s on
  fi
  if [ -z $BLOCK_NAME ]; then
    pkill -SIGRTMIN+12 i3blocks
  fi
fi

ENABLED=$(xset q | sed -n 's/.*DPMS is \(Enabled\).*/\1/p')
#if [ $BLOCK_NAME ]; then
  if [ "$1" ] && [ "$2" ]; then
      echo -e "\n"
    if [ $ENABLED ]; then
      echo "$2"
    else
      echo "$1"
    fi
  else
    if [ $ENABLED ]; then
      echo -e "\n"
    else
      echo -e "\n"
    fi
  fi
#fi
