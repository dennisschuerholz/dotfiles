#!/usr/bin/env bash
# Volume control using `pactl`,no need for e.g. alsamixer
# 2017 Dennis Schürholz - https://dennisschuerholz.de

SINK=0
if [ $BLOCK_INSTANCE ]; then
  SINK=$BLOCK_INSTANCE
fi

case $BLOCK_BUTTON in
  [1,3]) pactl set-sink-mute $SINK toggle ;;  # right click, mute/unmute
  4) pactl set-sink-volume $SINK +5%; pactl set-sink-mute $SINK 0 ;; # scroll up, increase
  5) pactl set-sink-volume $SINK -5%; pactl set-sink-mute $SINK 0 ;; # scroll down, decrease
esac

VOLUME=`pactl list sinks | grep -A15 -P "(\#|№)$SINK" | \
  grep -P "\d+\s*\/\s*\d+\%" | head -1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,'`
echo -e "$VOLUME%\n$VOLUME"

MUTED=`pactl list sinks | grep -A15 -P "(\#|№)$SINK" | \
  grep -B1 -P "\d+\s*\/\s*\d+\%" | head -1 | grep -e "\(yes\|ja\)"`
if [ "$MUTED" ]; then
  echo "$1"
fi
