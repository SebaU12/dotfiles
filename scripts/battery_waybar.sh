#!/bin/bash

exec 3>&1

while true; do
  mode=$(upower -i "$(upower -e | grep BAT)" | grep --color=never -E "state" | awk '{print $NF}')
  power=$(upower -i "$(upower -e | grep BAT)" | grep --color=never -E "percentage" | awk '{print $NF}')

  echo $mode

  if [ "$mode" == "charging" ]; then
    output="󰂄 "$power
    printf '{"text": "%s", "class": "white"}\n' "$output" | stdbuf -oL jq --unbuffered --compact-output . >&3
  elif [ "$mode" == "fully-charged" ]; then 
    output="󱟢 "$power
    printf '{"text": "%s", "class": "white"}\n' "$output" | stdbuf -oL jq --unbuffered --compact-output . >&3
  else 
    output="󱊣 "$power
    printf '{"text": "%s", "class": "white"}\n' "$output" | stdbuf -oL jq --unbuffered --compact-output . >&3
  fi

  # Esperar 1 segundo antes de la siguiente iteración
  sleep 5
done

