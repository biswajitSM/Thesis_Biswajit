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
clean-all:
	rm -f *.dvi *.log *.bak *.aux *.bbl *.blg *.idx *.ps *.eps *.pdf *.toc *.out *~
clean:
	rm -f *.log *.bak *.aux *.bbl *.blg *.idx *.toc *.out *~