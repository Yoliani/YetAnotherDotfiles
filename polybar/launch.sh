#!/usr/bin/env bash

#killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
# polybar -c ~/.config/polybar/config -rq bar &
polybar -c ~/.config/polybar/config.ini -rq bar &

echo "Bars launched..."
