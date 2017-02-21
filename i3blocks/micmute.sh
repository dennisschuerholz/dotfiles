#!/usr/bin/env bash
# toggle microphone muting using `pactl`, no need for e.g. alsamixer
# 2017 Dennis Schürholz - https://dennisschuerholz.de

SINK=0
if [ $BLOCK_INSTANCE ]; then
  SINK="$BLOCK_INSTANCE"
fi

case $BLOCK_BUTTON in
  [1,3]) pactl set-source-mute $SINK toggle ;;
esac


MUTED=`pactl list sources | grep -A15 -P "(\#|№)$SINK" | \
  grep -B1 -P "\d+\s*\/\s*\d+\%" | head -1 | grep -e "\(yes\|ja\)"`
if [ "$MUTED" ]; then
  echo -e "\n\n$1"
else
  echo -e "\n"
fi
