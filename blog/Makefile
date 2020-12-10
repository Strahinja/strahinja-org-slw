# blog/Makefile
CAT = cat
SED = sed
SLW = slweb
SLW_FILES = $(addsuffix /index.slw,.)
HTML_FILES = $(SLW_FILES:.slw=.html)
TEMPLATE_FILE = template.slw.in
BLOG_DIRS = $(wildcard *-*)
BLOG_FILES = $(wildcard $(addsuffix /*.slw,$(BLOG_DIRS)))
TMPL_FILES = $(BLOG_FILES:.slw=.slt)
HTML_TMPL_FILES = $(TMPL_FILES:.slt=.html)

%.html: %.slt
	$(SLW) $< > $@

%.html: %.slw
	$(SLW) $<  > $@

%.slt: %.slw $(TEMPLATE_FILE)
	$(CAT)	$(TEMPLATE_FILE) | $(SED) -e "s#%FILENAME%#$(basename $(notdir $<))#g" > $@

all: $(HTML_FILES) $(TMPL_FILES) $(HTML_TMPL_FILES)

$(HTML_TMPL_FILES): $(TMPL_FILES) $(TEMPLATE_FILE)

rebuild: clean all

clean:
	$(RM) -f $(HTML_FILES) $(TMPL_FILES) $(HTML_TMPL_FILES) 2>/dev/null

.PHONY: rebuild clean
