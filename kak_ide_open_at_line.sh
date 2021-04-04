#!/bin/bash

file="$1"
line="$2"

if kak -l | grep -q "ide" ; then
    # Open files in the `main` window of the `ide` session of kakoune.
    echo "evaluate-commands -client main edit ${file} ${line}" | kak -p ide
else
    terminator -p kakoune -e kak -s ide +${line} ${file}
fi
