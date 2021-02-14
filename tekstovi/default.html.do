#!/bin/bash
if [ "$2" == "index" ]; then
    echo "template.slw.in tekstovi.csv $(for d in *-*; do
        if [ -d $d ]; then
            for f in $d/*.slw; do
                [ -r $f ] && echo $f
            done
        fi
    done)" | xargs redo-ifchange
fi
if [ "$(dirname $2)" != "." ]; then
    redo-ifchange $2.slt
    slweb $2.slt > $3
else
    redo-ifchange $2.slw
    slweb $2.slw > $3
fi

