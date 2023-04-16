#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch polybar
echo "---" | tee -a /tmp/polybar_monitor1.log /tmp/polybar_monitor2.log
cd "$(dirname "$0")"
polybar --config=./polybar_config.ini monitor1 2>&1 | tee -a /tmp/polybar_monitor1.log & disown
polybar --config=./polybar_config.ini monitor2 2>&1 | tee -a /tmp/polybar_monitor2.log & disown
