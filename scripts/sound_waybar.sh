#!/bin/bash

exec 3>&1
while true; do
  sound_data=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)

  len_data=$(echo -n "$sound_data" | wc -c)
  value=$(echo "$sound_data" | grep -oP 'Volume: \K[0-9]+\.[0-9]+')
  percent_value=$(awk -v decimal="$value" 'BEGIN { printf "%.0f\n", decimal * 100 }')

  if [ $len_data -gt 15 ]; then
    output="󰝟 MUTE"
    printf '{"text": "%s", "class": "white"}\n' "$output" | stdbuf -oL jq --unbuffered --compact-output . >&3
  else 
    output="󰕾 "$percent_value"%"
    printf '{"text": "%s", "class": "white"}\n' "$output" | stdbuf -oL jq --unbuffered --compact-output . >&3
  fi 
done
