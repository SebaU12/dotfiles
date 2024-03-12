#!/bin/bash

sound_data=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)

len_data=$(echo -n "$sound_data" | wc -c)

if [ $len_data -gt 15 ]; then
  wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
  echo "Haciendo mute"
else 
  wpctl set-mute @DEFAULT_AUDIO_SINK@ 1
  echo "Haciendo unmute"
fi 

