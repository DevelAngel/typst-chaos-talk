#import "@preview/boxed-sheet:0.1.2": *

#set text(font: "New Computer Modern")
#show raw: set text(font: "FiraCode Nerd Font")

#let my-colors = (
  rgb(190, 149, 196),
  rgb("#f39f71"),
  rgb(102, 155, 188),
  rgb(229, 152, 155),
  rgb("6a4c93"),
  rgb("E0A500"),
  rgb("#934c84"),
  rgb("#934c5a"),
)

#show: boxedsheet-scaling.with(
  title: "Helix Cheat-Sheet",
  authors: "DevelAngel",
  homepage: link("https://github.com/DevelAngel/typst-chaos-talk/")[Repo],
  write-title: false,
  page-w: 350.28pt,
  page-h: 241.89pt,
  title-align: left,
  title-number: true,
  title-delta: 2pt,
  scaling-size: false,
  font-size: 5.5pt,
  line-skip: 5.5pt,
  x-margin: 10pt,
  y-margin: 20pt,
  num-columns: 2,
  column-gutter: 2pt,
  numbered-units: false,
  color-box: my-colors,
)
#show heading.where(depth: 2): it => {
  inline(it.body)
}

#let key(..keys, desc, keywidth: 2.5em) = {
  let annot = box.with(inset: (top: 1.2pt, bottom: 1.5pt, left: 1pt, right:1pt))
  let boxed = annot.with(stroke: 0.3pt)
  box[#grid(
    columns: (keywidth, 1fr),
    rows: auto,
    align: (left, left),
    column-gutter: 1pt,
    row-gutter: 0pt,
    keys.pos().map(k => [#k]).join(" "),
    desc
  )]
}
#let longkey = key.with(keywidth: 4.5em)
#let specialkey = underline
#show "<space>": specialkey[Space]
#show "<ctrl>": specialkey[Ctrl]
#show "<alt>": specialkey[Alt]
#show "<ret>": sym.arrow.l.curve

= Basics

Helix follows the selection #sym.arrow action model

== Movement with Selection
#key[w][go to next word start]
#key[W][go to next WORD start]
#key[b][go to previous word start]
#key[B][go to previous WORD start]
#key[e][go to next word end]
#key[E][go to next WORD end]

== Movement w/o Selection
#key[g][g][go to first line] 
#key[g][e][go to last line]
#key[g][h][go to line start]
#key[g][s][go to line first non-blank char]
#key[g][l][go to line end]
#longkey[g][42][g][go to line 42]

== Jumps
#key[m][m][jump to matching bracket]

== Search
#key[\*][use selection as current search pattern]
#longkey[be][\*][n][search for word under cursor]
#longkey[\<alt>][o][\*][n][...using LSP]

== Go into Insert mode

#key[i][before selection]
#key[a][after selection]
#key[A][at line end]
#key[I][at first non-blank char]

= Change & Deletion

== Deletion

#longkey[d][delete char or empty line]
#longkey[w][d][delete word]
#longkey[x][d][delete entire line]
#longkey[v][gl][d][delete to line end]

== Change

#key[w][c][change word incl. whitespace]
#key[e][c][change word w/o whitespace]

== Copy & Paste

#key[w][y][copy word]
#key[X][y][copy line]
#key[p][paste after]
#key[P][paste before]

= Programming

#longkey[\<space>][c][comment lines]
#longkey[:reflow][hard-wrap lines (often comments)]

= Multiple Cursors

Multiple cursors allow you to perform complex refactors
which can be broken down to a series of steps,
as well as search-and-replace.

== Expand

#key[C][expand cursor below]
#key[,][only one cursor]
