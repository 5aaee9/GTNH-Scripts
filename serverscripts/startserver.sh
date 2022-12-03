#!/usr/bin/env bash

while true
do
   java8 -Xms$MIN_MEN -Xmx$MAX_MEM $JAVA_OPTS -jar $SERVER nogui
    echo "If you want to completely stop the server process now, press Ctrl+C before the time is up!"
    echo "Rebooting in:"
    for i in $(seq $RESTART_TIMEOUT -1 1)
    do
        echo "$i..."
        sleep 1
    done
    echo "Rebooting now!"
done