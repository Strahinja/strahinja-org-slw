for d in *; do
    [ -r $d/clean.do ] && redo $d/clean
done
rm -f *~ *.html */*.html

