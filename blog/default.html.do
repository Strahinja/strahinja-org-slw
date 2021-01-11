redo-ifchange template.slw.in
if [ "$(dirname $2)" != "." ]; then
    redo-ifchange $2.slt
    slweb $2.slt > $3
else
    redo-ifchange $2.slw
    slweb $2.slw > $3
fi

