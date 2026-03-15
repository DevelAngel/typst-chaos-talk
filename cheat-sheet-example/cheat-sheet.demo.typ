
// TODO: boxed-sheet template
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *

// TODO: fonts

#show: codly-init.with()
#codly(languages: codly-languages)

// TODO: my-colors var

// TODO: pdf properties title and author
// TODO: template show
// - A5, num columns
// - A6, num columns
// TODO: heading-2 show

= Grundprinzip

*Inhalt und Form sind getrennt.*
Sie schreiben _was_, das Template entscheidet _wie_.

```
Ihr Text  →  Typst  →  PDF
            ↑
         Template
```

== Warum das zählt

Klassische Textverarbeitung: 5 kognitive Ebenen gleichzeitig
(Inhalt, Schrift, Abstände, Ränder, Konsistenz).

Typst: 1 Ebene. Nur Inhalt.

= Dokument-Aufbau

Jedes Typst-Dokument hat dieselbe Struktur:
```typst
#import "@preview/template:version": templ
#show: templ.with(parameter)
Hier beginnt Ihr Inhalt.
```

== Template wechseln

Brief → Artikel → Cheat Sheet:
Die `#show`-Zeile ändert sich.
Der Inhalt bleibt identisch.

= Text & Struktur

```typst
= Überschrift 1
== Überschrift 2
*fett*  _kursiv_  `code`
- Aufzählung
+ Nummerierung

Absätze: einfach Leerzeile.
```

== Querverweise

```typst
= Einleitung <intro>
Wie in @intro beschrieben ...
```
Labels mit `<name>`, Referenz mit `@name`.
Typst nummeriert automatisch.

= Tabellen

```typst
#table(
  columns: (auto, 1fr, 1fr),
  table.header([A], [B], [C]),
  [1], [2], [3],
)
```

== Styling ohne Pakete

```typst
fill: (_, y) =>
  if y == 0 { blue }
  else if calc.odd(y) { blue.lighten(90%) }

stroke: (x, y) => (
  bottom: 0.5pt,
  left: none, right: none,
)
```

Header-Stil via Show-Rule:
```typst
show table.cell.where(y: 0):
  set text(fill: white, weight: "bold")
```

= Figures & Listings

```typst
#figure(
  image("diagramm.svg", width: 80%),
  caption: [Beschreibung],
) <fig:name>
```

Code-Listings als Figure:
````typst
#figure(
  ```python
  print("Hallo CLT")
  ```,
  caption: [Ein Listing.],
) <lst:name>
````

== Referenzieren

`@fig:name` → "Abbildung 1"
`@tab:name` → "Tabelle 1"
`@lst:name` → "Listing 1"

Reihenfolge ändern? Nummern passen sich an.

= Pakete

```typst
#import "@preview/paket:version": name
```
Pakete werden beim ersten Kompilieren
heruntergeladen und gecacht.
Templates sind auch nur Pakete.

Kein `apt install`, kein `tlmgr`,
keine Paketkonflikte.

== Nützliche Pakete

`letter-pro` – DIN-5008-Briefe |
`charged-ieee` – IEEE-Artikel |
`boxed-sheet` – Cheat Sheets |
`fontawesome` – Icons |
`icu-datetime` – Datumsformate |
`codly` - Source Code

= Souveränität

`.typ` ist Plain Text → versionierbar (Git).
Compiler ist ein einzelnes Binary → kein Root nötig.
Pakete sind gepinnt → Build reproduzierbar.

*Sie besitzen Ihr Dokument.*

== Drei Fragen zum Mitnehmen

+ Können Sie Ihr Dokument ohne Lizenz öffnen?
+ Können Sie Ihr Template lesen und ändern?
+ Können Sie Ihr Dokument in 10 Jahren noch bauen?

Wenn dreimal Ja → *Sie sind souverän.*
