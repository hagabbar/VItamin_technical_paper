DOCS = VItamin_technical.pdf

FIGS = 

TABLES = 

BIBLIO = ./references.bib

BYPROD = *.aux *.log *.out *.dvi *.bbl *.blg

default: git-tag $(DOCS) $(FIGS)

.PHONY : git-tag

git-tag:
	./git-tag.sh

VItamin_technical.pdf: VItamin_technical.tex $(FIGS) $(TABLES) $(BIBLIO)
	pdflatex $(@:.pdf=) && bibtex $(@:.pdf=) && pdflatex $(@:.pdf=) && pdflatex $(@:.pdf=) && pdflatex $(@:.pdf=)

clean:
	rm -f $(DOCS) $(BYPROD)
