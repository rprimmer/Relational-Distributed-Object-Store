LATEXMK ?= latexmk

.PHONY: all pdf clean clean-all distclean help

all: pdf

# latexmk discovers dependencies (including figures) and reruns BibTeX as needed.
pdf:
	$(LATEXMK) rdos.tex
	cp build/rdos.pdf rdos.pdf

# Restrict cleanup to generated files in build/; retain the finished PDF.
clean:
	$(LATEXMK) -c rdos.tex

clean-all: distclean

distclean:
	$(LATEXMK) -C rdos.tex

help:
	@echo 'make            Build and refresh rdos.pdf with pdfLaTeX and BibTeX'
	@echo 'make clean      Remove build intermediates; keep the PDF'
	@echo 'make distclean  Remove build outputs; keep the top-level PDF'
