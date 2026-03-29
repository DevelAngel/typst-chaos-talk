# Overcoming Chaos with Typst

> Talk repo — slides, examples, and short paper about using Typst for consistent document formatting.

## Description

A document should look professional.
But then comes the chaos: jumping page numbers, changing fonts, inconsistent bullet points.
This costs time and nerves.
Typst offers a way out: it separates content from layout.
Once the template is in place, the focus is solely on the content.

This talk builds on the Typst talk from CLT2025 and gets practical:
In live demos I show how everyday documents are created - with consistent formatting.

[Typst](https://typst.app/) is a modern open-source typesetting system with a flat learning curve.
A practical step towards digital sovereignty.
Goal: understand it and want to try it yourself.

## Prerequisites

No knowledge of Typst or any other programming language required.

Optional: talk "Typst - a modern alternative to TeX" (CLT2025) as an introduction.

## Short Paper

A more detailed description can be found in the [short-paper](/short-paper/main.pdf) folder.

## Slides

The presentation slides are available at [presentation.pdf](/presentation.pdf).

## Letter Example

The letter example is available at [letter-example/letter.pdf](/letter-example/letter.pdf).

## Paper Example

The paper example is available at [paper-example/paper.pdf](/paper-example/paper.pdf).

## Cheat Sheet Example

The cheat sheet example is available at [cheat-sheet-example/cheat-sheet.pdf](/cheat-sheet-example/cheat-sheet.pdf).

## Presentation Example

The presentation examples are available at:
- [presentation-example/presentation-simple.pdf](/presentation-example/presentation-simple.pdf)
- [presentation-example/presentation-more-complex.pdf](/presentation-example/presentation-more-complex.pdf)

## Building

Requires [just](https://just.systems/).

- `just` — build presentation
- `just all` — build everything
- `just short-paper` — build short paper
- `just presentation` — build presentation
- `just letter-example` — build letter example
- `just paper-example` — build paper example
- `just cheat-sheet-example` — build cheat sheet example
- `just presentation-example-simple` — build simple presentation example
- `just presentation-example-more-complex` — build more complex presentation example

just is a command runner that invokes the appropriate `typst compile` command for each target, producing the corresponding PDF file.
The PDFs are compiled with either the `a-2u` or `a-2a` PDF/A standard: `a-2u` requires Unicode text mapping, while `a-2a` additionally requires full accessibility tagging.
