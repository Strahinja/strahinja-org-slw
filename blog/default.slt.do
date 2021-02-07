redo-ifchange template.slw.in
YAML=$(sed -e '0,/^---/d' -e '/^---/,$d' $2.slw)
DESCRIPTION=$(echo "${YAML}" | grep description: | sed -e 's/description: \+//g')
SITENAME=$(echo "${YAML}" | grep site-name: | sed -e 's/site-name: \+//g')
TITLE=$(echo "${YAML}" | grep title: | sed -e 's/title: \+//g')
sed -e "s#%DESCRIPTION%#${DESCRIPTION}#g" \
    -e "s#%SITENAME%#${SITENAME}#g" \
    -e "s#%TITLE%#${TITLE}#g" \
    -e "s#%BASEDIR%#blog/$(dirname $2)#g" \
    -e "s#%FILENAME%#$(basename $2)#g" < template.slw.in > $3

