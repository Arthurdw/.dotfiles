#!/usr/bin/env bash

while true; do
  hour=$(date +%H)
  min=$(date +%M)
  temp=$((6000 - (((hour - 19) * 4 + (min / 15)) * 250)))
  if [ $temp -lt 2000 ]; then temp=2000; fi
  hyprsunset -t $temp
  sleep 900 # Sleep for 15 minutes before adjusting again
done
