#!/usr/bin/env bash
# Backlight control
# 2017 Dennis Schürholz - https://dennisschuerholz.de

case $BLOCK_BUTTON in
  4) xbacklight -inc 10 ;; # scroll up, increase
  5) xbacklight -dec 10 ;; # scroll down, decrease
esac

LEVEL=`xbacklight | sed -e "s/\..*//"`
echo -e "$LEVEL%\n$LEVEL"
