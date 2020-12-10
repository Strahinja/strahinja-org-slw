# portfolio/Makefile
SLW = slweb
SLW_FILES = $(addsuffix /index.slw,.)
HTML_FILES = $(SLW_FILES:.slw=.html)

%.html: %.slw
	$(SLW) -d . $<  > $@

all: $(HTML_FILES)

rebuild: clean all

clean:
	rm -f $(HTML_FILES) 2>/dev/null

.PHONY: rebuild clean 

