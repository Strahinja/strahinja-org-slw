for sf in 404 index; do
    echo $sf.html
done | xargs redo-ifchange
for d in *; do
    [ -d $d -a -r $d/all.do ] && echo $d/all
done | xargs redo

