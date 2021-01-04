SLW = slweb
SUBDIRS = blog portfolio
SLW_FILES = $(addsuffix /index.slw,.) 404.slw
#SLW_DIRS = $(SLW_DIRS) $(wildcard blog/*-*)
#SLW_FILES = $(SLW_FILES) $(wildcard blog/*-*/*.slw)
HTML_FILES = $(SLW_FILES:.slw=.html)

%.html: %.slw
	$(SLW) $< > $@

all: $(HTML_FILES) subdirs

subdirs: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@

rebuild: clean all

subdirsclean:
	for d in $(SUBDIRS); do \
		$(MAKE) -C $$d rebuild; \
	done

clean: subdirsclean
	$(RM) $(HTML_FILES) 2>/dev/null

.PHONY: rebuild clean subdirs $(SUBDIRS) subdirsclean

