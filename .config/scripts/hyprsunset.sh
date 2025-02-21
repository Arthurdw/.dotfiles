#!/usr/bin/env bash

while true; do
  hour=$(date +%H)
  min=$(date +%M)
  temp=6000

  if [ "$hour" -ge 6 ] && [ "$hour" -lt 19 ]; then
    hyprsunset -i &
  elif [ "$hour" -ge 19 ] && [ "$hour" -lt 23 ]; then
    temp=$((6000 - (((hour - 19) * 4 + (min / 15)) * 250)))
    if [ "$temp" -lt 2000 ]; then
      temp=2000
    fi
    hyprsunset -t "$temp" &
  fi

  sleep 5 # We sleep here to give the hyprsunset time to do its thing
  echo "┣ Current temperature: $temp"
  time_in_5_minutes="$(date -d "+5 minutes" +%H:%M)"
  echo "┣ Sleeping for 5 minutes... ($time_in_5_minutes)"
  sleep 295
done
