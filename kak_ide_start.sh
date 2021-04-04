#!/bin/bash

kak -clear

if kak -l | grep -q "ide" ; then
    kak -c ide
else
    kak -s ide -e "rename-client main"
fi

