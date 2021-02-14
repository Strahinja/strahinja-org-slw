#!/bin/bash
if [ "$2" == "index" ]; then
    redo-ifchange programi.csv
fi
redo-ifchange $2.slw
slweb $2.slw > $3

