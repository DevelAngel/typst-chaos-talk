default: presentation

all: short-paper presentation examples

examples: presentation-example-simple presentation-example-more-complex letter-example paper-example cheat-sheet-example

short-paper:
    typst compile --pdf-standard a-2a short-paper/main.typ

presentation:
    typst compile --pdf-standard a-2u presentation.typ
    typst query --root . presentation.typ --field value --one "<pdfpc-file>" > presentation.pdfpc

presentation-pdfpc: #presentation
    pdfpc --list-bindings
    pdfpc --list-monitors
    pdfpc presentation.pdf

presentation-pdfpc-watch:
    pdfpc --list-bindings
    pdfpc --list-monitors
    typst watch --no-serve --format pdf --pdf-standard a-2u presentation.typ --open "pdfpc"

presentation-example-simple:
    typst compile --pdf-standard a-2a presentation-example/presentation-simple.typ

presentation-example-more-complex:
    typst compile --pdf-standard a-2u presentation-example/presentation-more-complex.typ

letter-example:
    typst compile --pdf-standard a-2u letter-example/letter.typ

paper-example:
    typst compile --pdf-standard a-2u paper-example/paper.typ

cheat-sheet-example:
    typst compile --pdf-standard a-2u cheat-sheet-example/cheat-sheet.typ
