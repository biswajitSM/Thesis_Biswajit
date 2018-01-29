# suitable for ubuntu. Make adjustment for your OS.
all: read

%.pdf: %.tex .pdf_STAMP
	$(MAKE) .svgtoeps_STAMP
	@touch .pdf_STAMP
	latexmk -pdfdvi -interaction=nonstopmode $<
	@touch .pdf_STAMP

.pdf_STAMP:
	touch .pdf_STAMP

read: thesis.pdf
	evince thesis.pdf &

svgtoeps:
	rm .svgtoeps_STAMP
	$(MAKE) .svgtoeps_STAMP

.svgtoeps_STAMP:
	python all_svg2eps.py && touch .svgtoeps_STAMP

#needs bibtool installations
bib-combine:
	bibtool -s \
	chapters/c1_intro/intro.bib \
	chapters/c2_bilayer_efcs/efcs.bib \
	chapters/c3_binfree/biblio.bib \
	chapters/c5_transient_binding/transient_binding.bib \
	chapters/c4_azurin_sm/azurin.bib \
	-o bibliography.bib

clean-all:
	rm .*_STAMP
	rm -f *.dvi *.log *.bak *.aux *.bbl *.blg *.idx *.ps *.eps *.pdf *.toc *.out *~
	find chapters '(' -name '*.eps' -or -name '*.pdf' ')' -exec rm -v \{\} +

clean:
	rm .pdf_STAMP
	rm -f *.log *.bak *.aux *.bbl *.blg *.idx *.toc *.out *~

gen-bibliography:
	bibtool -x thesis.aux -o bib_generated.bib

sort-bib-year:
	bibtool -s -- 'sort.format={%d(year)}' bibliography.bib -o bibliography.bib

