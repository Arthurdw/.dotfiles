#!/bin/sh
xrandr --output HDMI-1 --mode 1920x1080 --primary
xrandr --output eDP-1 --mode 1920x440 --left-of HDMI-1
