redo-ifchange tekstovi.csv
sed 1q < tekstovi.csv > $3
case $1 in
	tekstovi-matematika.csv)
		CATEGORY="Математика";;
	tekstovi-softver.csv)
		CATEGORY="Софтвер";;
	*)	exit 1;;
esac
awk "BEGIN{ FS=\",\" } { if (\$3==\"\\\"${CATEGORY}\\\"\") { print \$0; } }" \
	< tekstovi.csv >> $3

