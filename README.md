# Creating a relational distributed object store

LaTeX source for the June 2013 paper by Robert Primmer, Scott Nyman, and
Wayzen Lin. The manuscript describes using metadata to establish and persist
relationships among objects in a distributed object store.

## Build

Install a TeX distribution containing pdfLaTeX, BibTeX, latexmk, and the packages
used in [preamble.tex](preamble.tex). The bibliography uses `acm.bst`.
Run commands from the repository root:

```sh
make                 # build/rdos.pdf
make clean           # remove intermediates, retain the PDF
make distclean       # remove intermediates and the generated PDF
```

`make clean-all` is an alias for `make distclean`. Directly invoking `latexmk`
or `latexmk rdos.tex` uses the same [.latexmkrc](.latexmkrc). latexmk discovers
section, bibliography, and figure dependencies and reruns pdfLaTeX and BibTeX
until references stabilize. Compilation errors fail the build. An unchanged
build does no typesetting work.

Use **[rdos.tex](rdos.tex)** as the editor's root document, with the repository
root as the working directory. No files from `attic/` or other local directories
are needed to build a fresh clone.

## Layout

The organization follows the
[fix-hosts algebra paper](https://github.com/rprimmer/fix-hosts-c/tree/main/algebra):
a named root document, shared configuration files, numbered sections, and a
separate build directory.

```text
Relational-Distributed-Object-Store/
├── rdos.tex
├── preamble.tex
├── macros.tex
├── metadata.tex
├── sections/
│   ├── 00-abstract.tex
│   ├── 01-introduction.tex
│   ├── 02-unstructured-data.tex
│   ├── 03-metadata.tex
│   ├── 04-hcp.tex
│   ├── 05-rdos.tex
│   ├── 05-01-obtaining-metadata.tex
│   ├── 05-02-defining-metadata.tex
│   ├── 05-03-extracting-metadata.tex
│   ├── 05-04-creating-relations.tex
│   ├── 05-05-persisting-relations.tex
│   ├── 05-06-models-and-analytics.tex
│   ├── 06-related-work.tex
│   └── 07-summary.tex
├── fig/
├── master.bib
├── Makefile
├── .latexmkrc
├── .gitignore
└── README.md
```

[rdos.tex](rdos.tex) controls section order and the bibliography.
[preamble.tex](preamble.tex) controls layout and packages;
[macros.tex](macros.tex) defines shared terminology;
[metadata.tex](metadata.tex) holds the historical title, authors, and date.
[sections/05-rdos.tex](sections/05-rdos.tex) introduces the RDOS design and
includes its six numbered subsections. Figures are used directly from
[fig/](fig/), and references come from [master.bib](master.bib).

## Source control

The repository tracks LaTeX source, figure assets, bibliography, build
configuration, and documentation. `build/` is generated output and is ignored,
just as compiled objects and executables would be in a C source repository.
Rebuild the PDF from source after cloning:

```sh
git clone https://github.com/rprimmer/Relational-Distributed-Object-Store.git
cd Relational-Distributed-Object-Store
make
```

Historical drafts, reviewer material, office-document originals, older PDFs,
and editor recovery files are retained locally in ignored `attic/`.
The ignored `.refactor-baseline/` contains the pre-refactor source snapshot,
checksums, original build, and comparison results. Neither directory is required
for compilation or included in the public repository.

## Refactoring and validation

The September 2026 refactor separated document setup from manuscript content,
removed obsolete setup, and replaced the fixed build sequence with latexmk.
Before figure corrections, all 12 pages had identical extracted text and PDF
drawing streams to a fresh build of the original source. Two pipeline figures
were then constrained to `\linewidth` to fit their columns. All manuscript
text was preserved, with a one-line shift across the page 7/8 boundary.

Validation covers a build from only tracked source, an unchanged incremental
build, cleanup behavior, PDF comparison after restructuring, and visual review.
The resulting paper has 12 pages, no unresolved citations or references, and
no overfull boxes.

The June 2013 prose, citations, terminology, and publication details are
historical; this refactor does not update or fact-check its claims. Existing
BibTeX warnings concern an empty journal field in `IDC:2012:DigitalUniverse`
and simultaneous volume/number fields in `gibson1998cost`. The build also
reports a font substitution for typewriter braces and some underfull boxes.
