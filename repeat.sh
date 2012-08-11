#!/bin/sh
max=$1; shift;
for ((i=1; i <= max ; i++)); do  # --> C-like syntax
    eval "$@" &>/dev/null;
done
