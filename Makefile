# suitable for ubuntu. Make adjustment for your OS.
all:
	pdflatex -interaction=nonstopmode thesis.tex
	bibtex thesis
	pdflatex -interaction=nonstopmode thesis.tex
	pdflatex -interaction=nonstopmode thesis.tex
	evince thesis.pdf &

read:
	evince thesis.pdf &

svgtopdf:
	python all_svg2pdf.py

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
	rm -f *.dvi *.log *.bak *.aux *.bbl *.blg *.idx *.ps *.eps *.pdf *.toc *.out *~

clean:
	rm -f *.log *.bak *.aux *.bbl *.blg *.idx *.toc *.out *~

gen-bibliography:
	bibtool -x thesis.aux -o bib_generated.bib
sort-bib-year:
	bibtool -s -- 'sort.format={%d(year)}' bibliography.bib -o bibliography.bib