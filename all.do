echo "`for sf in 404 index; do
    echo $sf.html
done;
for d in *; do
    [ -d $d -a -r $d/all.do ] && echo $d/all
done`" | xargs redo-ifchange

