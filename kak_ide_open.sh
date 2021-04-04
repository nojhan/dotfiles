#!/bin/bash

# Forget the Oth argument (name of the script).
if [[ $# > 0 ]] ; then
    files="$@"
else
    files=""
    while read line
    do
      files="$files $line"
    done < /dev/stdin
fi

if kak -l | grep -q "ide" ; then
    # Open files in the `main` window of the `ide` session of kakoune.
    for file in "${files}"; do
        echo "evaluate-commands -client main edit ${file}" | kak -p ide
    done
else
    terminator -p kakoune -e kak -s ide ${files}
fi

