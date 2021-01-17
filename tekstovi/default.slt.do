redo-ifchange template.slw.in
sed -e "s#%BASEDIR%#tekstovi/$(dirname $2)#g" \
    -e "s#%FILENAME%#$(basename $2)#g" < template.slw.in > $3

