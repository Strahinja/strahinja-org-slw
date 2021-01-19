#!/bin/bash
echo tekstovi.csv tekstovi-{matematika,softver}.csv | xargs redo-ifchange
echo "index.html \
$(for d in *; do
    if [ -d $d ]; then
        for f in $d/*.slw; do
            [ -r $f ] && echo $d/$(basename -s.slw $f).slt
            [ -r $f ] && echo $d/$(basename -s.slw $f).html
        done
    fi
done)" | xargs redo-ifchange

