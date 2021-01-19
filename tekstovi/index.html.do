redo-ifchange $(basename -s.html $2).slw tekstovi.csv
slweb $(basename -s.html $2).slw > $3

