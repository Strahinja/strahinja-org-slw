if [ "$2" == "index" ]; then
    for d in blog/*-*; do
        if [ -d $d ]; then
            for f in $d/*.slw; do
                [ -r $f ] && echo $f
            done
        fi
    done | xargs redo-ifchange
fi
redo-ifchange $2.slw
slweb $2.slw >$3

