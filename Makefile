SLW = slweb
SLW_DIRS = . portfolio
SLW_FILES = $(addsuffix /index.slw,$(SLW_DIRS))
HTML_FILES = $(SLW_FILES:.slw=.html)

%.html: %.slw
	$(SLW) $< > $@

all: $(HTML_FILES)

rebuild: clean all

clean:
	rm -f $(HTML_FILES) 2>/dev/null

.PHONY: rebuild clean

