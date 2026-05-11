TEX_MAIN = main

LATEX_CMD = lualatex -synctex=1 -interaction=nonstopmode -file-line-error

all: build

build: | $(TEX_MAIN).tex
	$(LATEX_CMD) $(TEX_MAIN).tex || true
	-biber $(TEX_MAIN)
	$(LATEX_CMD) $(TEX_MAIN).tex || true
	$(LATEX_CMD) $(TEX_MAIN).tex

clean:
	rm -f *.aux *.log *.out *.toc *.bbl *.bcf *.blg *.run.xml *.synctex.gz
	rm -f *.lof *.lot *.idx *.ind *.ilg *.glg *.glo *.gls *.ist
	rm -f *.fdb_latexmk *.fls *.xdv
	rm -f main.pdf

.PHONY: all build clean