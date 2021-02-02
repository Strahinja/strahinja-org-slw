redo-ifchange template.slw.in
TITLE=$(sed -e '0,/^---/d' -e '/^---/,$d' $2.slw | grep title: | sed -e 's/title: \+//g')
sed -e "s#%TITLE%#${TITLE}#g" \
    -e "s#%BASEDIR%#blog/$(dirname $2)#g" \
    -e "s#%FILENAME%#$(basename $2)#g" < template.slw.in > $3

