#!/bin/sh

max=$1
while read -r line; do
    echo -ne $( (/usr/bin/time -f "%U+%S" ./repeat.sh $max $line ) 2>&1 | bc )
    echo -e "\t$line"
done

