redo-ifchange template.slw.in
YAML=$(sed -e '0,/^---/d' -e '/^---/,$d' $2.slw)
SITEDESC=$(echo "${YAML}" | grep site-desc: | sed -e 's/site-desc: \+//g')
SITENAME=$(echo "${YAML}" | grep site-name: | sed -e 's/site-name: \+//g')
TITLE=$(echo "${YAML}" | grep title: | sed -e 's/title: \+//g')
sed -e "s#%SITEDESC%#${SITEDESC}#g" \
    -e "s#%SITENAME%#${SITENAME}#g" \
    -e "s#%TITLE%#${TITLE}#g" \
    -e "s#%BASEDIR%#tekstovi/$(dirname $2)#g" \
    -e "s#%FILENAME%#$(basename $2)#g" < template.slw.in > $3

