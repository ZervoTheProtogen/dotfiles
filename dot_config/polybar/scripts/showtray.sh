#!/usr/bin/env bash

t=0
sleep_pid=0

toggle() {
    t=$(((t + 1) % 2))

      polybar traybar &

    if [ "$sleep_pid" -ne 0 ]; then
        kill $sleep_pid >/dev/null 2>&1
        kill $(pgrep polybar | tail -n 1) 
   fi
}


trap "toggle" USR1

while true; do
    if [ $t -eq 0 ]; then
      echo t
    else
      echo f
    fi
    sleep 1 &
    sleep_pid=$!
    wait
done
