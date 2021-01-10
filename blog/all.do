for d in *-*; do
    if [ -d $d ]; then
        for f in $d/*.slw; do
            [ -r $f ] && echo $d/$(basename -s.slw $f).slt
            [ -r $f ] && echo $d/$(basename -s.slw $f).html
        done | xargs redo-ifchange
    fi
done
redo-ifchange index.html

