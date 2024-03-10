#!/bin/bash


# Volver mayuscula primera letra
ucfirst() {
  echo "$1" | awk '{print toupper(substr($0, 1, 1)) tolower(substr($0, 2))}'
}

while true; do
  day=$(date "+%a")
  capitalized_day=$(ucfirst "$day")
  hour=$(date "+%H" | sed 's/^0//')

  echo "$hour"

  if ((hour >= 1 && hour <= 6)); then
    day_icon=" $capitalized_day"
    printf '{"text": "%s"}\n' "$day_icon" | jq --unbuffered --compact-output .
  elif ((hour >= 6 && hour <= 12)); then
    day_icon=" $capitalized_day"
    printf '{"text": "%s"}\n' "$day_icon" | jq --unbuffered --compact-output .
  elif ((hour >= 12 && hour <= 18)); then
    day_icon=" $capitalized_day"
    printf '{"text": "%s"}\n' "$day_icon" | jq --unbuffered --compact-output .
  elif ((hour >= 18 && hour <= 24)); then
    day_icon="󰖔 $capitalized_day"
    printf '{"text": "%s"}\n' "$day_icon" | jq --unbuffered --compact-output .
  else
    day_icon=" $capitalized_day"
    printf '{"text": "%s"}\n' "$day_icon" | jq --unbuffered --compact-output .
  fi
  sleep 10000
done
