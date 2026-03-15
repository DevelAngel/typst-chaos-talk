#let mytemplate(
  head-left: [],
  head-right: [],
  body
) = [
  #set text(font: "New Computer Modern", lang: "en", size: 11pt)
  #set page(
    paper: "a4",
    margin: (x: 2.5cm, y: 2.5cm),
    numbering: "1",
    header: context {
      if counter(page).get().first() > 1 [
        #head-left
        #h(1fr)
        #head-right
      ]
    },
  )
  #set par(justify: true, leading: 0.65em)
  #set heading(numbering: "1.1")
  #show heading.where(level: 1): it => {
    v(1.2em, weak: true)
    text(12pt, weight: "bold", it)
    v(0.6em)
  }
  #show heading.where(level: 2): it => {
    v(0.8em, weak: true)
    text(10pt, weight: "bold", it)
    v(0.4em)
  }

  #body
]

#let maketitle(
  title: [],
  authors: (),
  date: [],
  metadata: true,
) = [
  #if metadata {
    set document(
      title: title,
      author: authors.at(0),
    )
  } 
  #align(center)[
    #text(16pt, weight: "bold")[
      #title
    ]
    #v(0.8em)
    #text(11pt)[#authors.at(0)]
    #v(0.3em)
    #text(9pt, fill: gray)[
      #date
    ]
    #v(0.5em)
    #line(length: 40%, stroke: 0.5pt + gray)
  ]
  #v(1em)
]

#let abstract(
  title: [*Abstract* —],
  body
) = [
  #block(inset: (x: 2em))[
    #text(9pt)[
      #title #body
    ]
  ]
  #v(1em)
]
