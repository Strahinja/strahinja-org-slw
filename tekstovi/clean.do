echo *~ index.html */*.html */*.slt tekstovi-*.csv | \
    sed -e's/ /\n/g' | sed -e 's/[^ ]\+ojl-2.0.html//g' | \
    sed -e 's/[^ ]\+ojl-3.0.html//g' | xargs rm -f
