#import "@preview/touying:0.6.3": *
#import "@preview/icu-datetime:0.2.0" as icu
#import "@preview/fontawesome:0.6.0": fa-icon
#import "@preview/numbly:0.1.0": numbly
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *
#import "@preview/swank-tex:0.1.0": LaTeX
#import "@preview/colorful-boxes:1.4.3": stickybox
#import "@preview/cades:0.3.1": qr-code

// Heading numbering style
#set heading(numbering: numbly(
  "Appendix",
  "{1}.{2}.",
  "|",
))

// Beautiful code blocks
#show: codly-init.with()
#codly(languages: codly-languages)

// Auto-formatted dates
#let long_date(..args) = icu.fmt(datetime(..args), length: "long", locale: "en")

// Touying theme
#import themes.aqua: *
#show: aqua-theme.with(
  aspect-ratio: "16-9",
  config-common(handout: false),
  config-info(
    title: [Overcoming Chaos with Typst],
    author: [Angelos Drossos],
    date: long_date(year: 2026, month: 03, day: 28), //< 28. März 2026
  ),
  config-colors(
    primary: rgb("#008880"),
    primary-light: rgb("#21a59d"),
    primary-lightest: rgb("#F2F4F8"),
    neutral-lightest: rgb("#FFFFFF"),
  ),
)
#let highlight = rgb("#21a59d")
#let sticky-primary = rgb("#a9e3df")
#let sticky-yellow = rgb("#dfe3a9")
#let sticky-orange = rgb("#e3baa9")
#let sticky-purple = rgb("#d1a9e3")

#set text(font: "Fira Sans", weight: "light")
#show raw: set text(font: "Fira Code")
#set strong(delta: 100)
#set par(justify: true)

// Simple approach to split the slide headings in a left and right part
#let subtitle(body) = h(1fr) + [#body] + h(1.2cm)

// Helper for section who -u
#let icon-text(body, icon: "") = {
  text(baseline: -0.1em)[#box(fa-icon(icon)) ]
  text(baseline: -0.2em)[#body]
}
#let icon-text-icon(body, icon-left: "", icon-right: "") = {
  text(baseline: -0.1em)[#box(fa-icon(icon-left)) ]
  text(baseline: -0.2em)[#body ]
  text(baseline: -0.1em)[#box(fa-icon(icon-right))]
}
#let image-text(body, img: "") = [
  #box(image(img, height: 1em))
  #text(baseline: -0.3em)[\@angelos:drossos.de]
]

// workaround until [#6302](https://github.com/typst/typst/issues/6302) fixed
#let in-raw = state("in-raw", false)
#show raw: it => {
  in-raw.update(true)
  it
  in-raw.update(false)
}
#show "LaTeX": word => context {
  if in-raw.get() {
    return "LaTeX"
  }
  LaTeX
}

// SLIDES ============================================

#title-slide(extra: text(size: 10pt, link("https://creativecommons.org/licenses/by-sa/4.0/")[
  #fa-icon("creative-commons")
  #fa-icon("creative-commons-by")
  #fa-icon("creative-commons-sa")
  CC BY-SA 4.0
  #pdfpc.speaker-note(
    ```md
     - Vortrag "Chaos überwinden mit Typst"
     - regelmäßiger Besucher der CLT
     - mein erster Vortrag
     - Ich bin ...
    ```
  )
]))

= Introduction <touying:hidden>

== Who -u <touying:hidden>

#v(1fr)
#align(center)[
  #text(size: 28pt)[#alert[Angelos Drossos]]

  Software Engineer --- Focus Security\
  #fa-icon("wave-square") #fa-icon("car") #fa-icon("id-card")
  #h(1cm)
  #fa-icon("microchip") #fa-icon("shield-halved") #fa-icon("file-signature")
]
#pdfpc.speaker-note(
  ```md
   - Angelos --- Software Engineer --- mit Fokus Security
   - versch. Bereiche: Oszis, Automotive, Smartcards
   - verschiedene Ebenen:
     - Embedded, Secure Boot
     - Signieren mit Smartcards und HSM
     - Public Key Infrastrukturen
  ```
)
#pause

#v(1fr)

#grid(
  columns: (1fr, 1fr),
  gutter: 0.5cm,
  [
    - #icon-text(icon: "linux")[Linux and Open-Source Enthusiast]
    - #icon-text-icon(icon-left: "fedora", icon-right: "raspberry-pi")[Fedora IoT on Raspberry Pi]
    - #icon-text(icon: "brain")[Reducing Mental Load]
    #pdfpc.speaker-note(
      ```md
       - Heute: Linux Enthusiast
       - Love Fedora --- Mental Load
      ```
    )
    #pause
  ],
  [
    - #icon-text(icon: "github")[#link("https://github.com/DevelAngel/")[DevelAngel]]
    - #icon-text(icon: "signal-messenger")[DevelAngel.66]
    - #image-text(img: "images/logos/matrix-favicon.svg")[\@angelos:drossos.de]
    #pdfpc.speaker-note(
      ```md
       - Kontaktdaten
      ```
    )
  ]
)

#v(1fr)

= Face the Chaos

#pdfpc.speaker-note(
  ```md
   - Chaos überwinden --> Chaos verstehen
   - Womit kämpfen wir?!
  ```
)

== Writer Chaos I #subtitle[What you see is what you get]

#align(center)[
  #image("images/writer-chaos/page1.png")
]

#pdfpc.speaker-note(
  ```md
   - klassisches Schreibtool, z.B. LibreOffice oder MS Word
   - drei Fehler --> zweiter Blick
   - Zeit?
  ```
)

== Writer Chaos I #subtitle[What you overlook is still what you get]

#align(center)[
  #image("images/writer-chaos/page1-marked.png")
]

#pdfpc.speaker-note(
  ```md
   - Haupttext: Linux Libertine 12pt
   - Libration Sans 10.5pt -- Copy Paste Fehler?
   - Stichpunkt versetzt
  ```
)

== Writer Chaos II #subtitle[What you see is what you get]

#align(center)[
  #image("images/writer-chaos/page2.png")
]

#pdfpc.speaker-note(
  ```md
   - Text geht weiter...
   - drei Fehler versteckt
  ```
)

== Writer Chaos II #subtitle[What you overlook is still what you get]

#align(center)[
  #image("images/writer-chaos/page2-marked.png")
]

#pdfpc.speaker-note(
  ```md
   - Stichpunkt über zwei Zeilen
   - zweite Zeile: Leerzeichen, gehört nicht zum Stichpunkt
   - darunter: 11pt statt 12pt --- fällt kaum auf
   - Paragraph mit DejaVu Sans 10pt --- Copy Paste?
  ```
)

== Pres. Chaos #subtitle[What you see is what you get]

#align(center)[
  #image("images/presentation-chaos/page1.webp")
]

#pdfpc.speaker-note(
  ```md
   - Nächstes Beispiel: Präsentationen
   - Monospace Fonts -- ein Graus
   - Was ist offensichtlich unterschiedlich?
   - Was versteckt sich?
  ```
)

== Pres. Chaos #subtitle[What you overlook is still what you get]

#align(center)[
  #image("images/presentation-chaos/page2.webp")
]

#pdfpc.speaker-note(
  ```md
   - oben: Fira Code -- mit Ligaturen
   - unten: Fira Mono -- ohne Ligaturen, leicht versetzt
   - Stichpunkte wieder schlecht gesetzt
   - Seitenzahl springt -- im Mastertemplate nicht geschützt
   - PP in Unternehmen: Mastertemplate aktualisiert?
   - Versionsnummer?
  ```
)

= Content, Not Layout

#pdfpc.speaker-note(
  ```md
   - Muss nicht sein...
   - Mental Load sparen
   - indem: Konzentration Content, Not Layout
   - LaTeX macht es seit Jahren vor
  ```
)

== Typst #subtitle[A New Markup-Based Typesetting System for the Sciences]

#alert[Typst's Belief:] "Tools for document creation should feel _empowering_"

#align(center)[
  #alternatives[
    #image("images/typst/how-does-it-work/internal-report.png", height: 9.6cm)
  ][
    #image("images/typst/how-does-it-work/scientific-journal-article.png", height: 9.6cm)
  ][
    #image("images/typst/how-does-it-work/colorful-newsletter.png", height: 9.6cm)
  ]
]

#v(1fr)
Link: #link("https://typst.app/")

#pdfpc.speaker-note(
  ```md
   - Tools, mit denen Ihr Dokumente erzeugt, sollen euch ermächtigen,
     nicht nur hübsch sein
   - Das ist genau das, was Souveränität meint

  ---

   - links: Text mit semantischen Anweisungen (markup)
   - mitte: Template wählen
   - rechts: PDF erstellt bekommen
  ```
)

= Restore Order

#pdfpc.speaker-note(
  ```md
   - Wie Fokus Inhalt?
   - Kein Layout
   - Lasst uns die Ordnung wiederherstellen
  ```
)

== Letter #subtitle[Template Handles the Layout · \@preview/letter-pro]

#pdfpc.speaker-note(
  ```md
   - Brief --> Stadtverwaltung
   - formale Korrektheit (DIN 5008)
   - Textverarbeitungsprogramm - Kampf:
     - Absenderblock rechts / links?
     - Wo Datum?
     - Abstand Anschriftenfeld - Fensterumschlag
   - kommunizieren --- stattdessen: layouten
   - Gegenteil von Souveränität: Werkzeug ausgeliefert
   - Typst: Ebenen radikal trennen
   - `letter-pro` kennt DIN 5008 Regeln: wir Inhalt, Template Form
  ```
)

- #alert[Standard] DIN 5008 business letter template

- #alert[Layout] Sender, recipient, subject, date, header, footer

- #alert[Ready to Use] Professional appearance out of the box

#v(1fr)
Link: #link("https://typst.app/universe/package/letter-pro/")

#focus-slide([
  DEMO

  \@preview/letter-pro

  #pdfpc.speaker-note(
    ```md
     - Briefkörper ohne Kopf, ohne Unterschrift
     - Kopf schrittweise ergänzen
     - Unterschriftsbereich ergänzen
    ```
  )
])

#place(horizon + center, dx: -8cm, dy: -4cm)[
  #stickybox(
    width: 5.5cm,
    rotation: -5deg,
    fill: sticky-primary,
  )[
    I just typed\
    a letter.
  ]
]
#pause

#place(horizon + center, dx: -6cm, dy: 1cm)[
  #stickybox(
    width: 7cm,
    rotation: -2deg,
    fill: sticky-yellow,
  )[
    One line\
    changed everything.
  ]
]
#pause

#place(horizon + center, dx: 3cm, dy: -2cm)[
  #stickybox(
    width: 5.5cm,
    rotation: 5deg,
    fill: sticky-purple,
  )[
    I told it what,\
    not where.
  ]
]
#pause

#place(horizon + center, dx: 7cm, dy: 2cm)[
  #stickybox(
    width: 6.5cm,
    rotation: -8deg,
    fill: sticky-orange,
  )[
    Three imports.\
    Zero regrets.
  ]
]
#pdfpc.speaker-note(
  ```md
   - Abgenommen: Fettdruck, Fontsetzen
   - Body: Plain-Text. Typst Rest.

  ---

   - `#show: letter-simple.with(...)`
   - plain text -> Standard-Brief inkl. Faltmarken

  ---

   - Name, Adresse, Datum -- übergeben ans Template.
   - Template plaziert.
    
  ---

   - Pinned versions -> Builds anywhere
   - `letter-pro`: Layout
   - `fontawesome`: Icons
   - `icu-datetime`: Datumsangaben
  ```
)

== Short Paper #subtitle[One Source, Many Formats · \@preview/rubber-article]

- #alert[Base] Opinionated take on LaTeX's `article` class

- #alert[Scope] Articles, papers, academic documents

- #alert[Audience] LaTeX migrants and students new to academic writing

#v(1fr)
Link: #link("https://typst.app/universe/package/rubber-article/")

#pdfpc.speaker-note(
  ```md
   - Schritt weiter: kein Brief; Paper, 4--5 Seiten
   - fürs schnelle: rubber-article
   - oder eigenes Template (einmalig)
  ```
)

#focus-slide([
  DEMO

  \@preview/rubber-article

  #pdfpc.speaker-note(
    ```md
     - Start: Text
     - Next Step: Template
     - Überschriften
     - `fig:mental-load`
     - `tab:vergleich`
     - `lst:brief`: raw --> codly
     - colorbox: slanted --> outline
    ```
  )
])

#place(horizon + center, dx: 3cm, dy: 2cm)[
  #stickybox(
    width: 6.5cm,
    rotation: 8deg,
    fill: sticky-orange,
  )[
    A letter grew\
    into a paper.
  ]
]
#pause

#place(horizon + center, dx: -6cm, dy: -4cm)[
  #stickybox(
    width: 5.5cm,
    rotation: 5deg,
    fill: sticky-primary,
  )[
    I wrote content,\
    not layout.
  ]
]
#pause

#place(horizon + center, dx: -8cm, dy: 1cm)[
  #stickybox(
    width: 5.5cm,
    rotation: 2deg,
    fill: sticky-yellow,
  )[
    The table\
    styled itself.
  ]
]
#pause

#place(horizon + center, dx: 7cm, dy: -2cm)[
  #stickybox(
    width: 5.5cm,
    rotation: -5deg,
    fill: sticky-purple,
  )[
    Figures label\
    themselves.
  ]
]
#pdfpc.speaker-note(
  ```md
   - selber Stoff
   - anderes Template
   - anderes Publikum.

  ---

   - Überschriften, Paragraphen, Referenzen
   - alles semantisch

  ---

   - Header, Zebra-Streifen, Rahmen
   - alles eine semantische Funktion im `table`-Aufruf
   - Kein manuelles Formatieren notwendig

  ---

   - `@fig:mental-load`, `@tab:vergleich`, `@lst:brief`
   - Reihenfolge ändern? Nummern passen sich an.
  ```
)

== Cheat Sheet #subtitle[Different Template, Same Workflow · \@preview/boxed-sheet]

- #alert[Template] Colorful, organized cheat sheet layout

- #alert[Compact] Learning notes on one or a few pages

- #alert[Workflow] Learn, summarize, move on

#v(1fr)
Link: #link("https://typst.app/universe/package/boxed-sheet/")

#pdfpc.speaker-note(
  ```md
   - Nächstes Ziel: Informationen auf eine Seite verdichten
   - Schule: Spickzettel
   - modern: Cheat Sheet
   - Template boxed-sheet: farbige Boxen, automatische Spalten
  ```
)

#focus-slide([
  DEMO

  \@preview/boxed-sheet

  #pdfpc.speaker-note(
    ```md
     - Start: Inhalt ohne Template -- flach, langweilig
     - Import einkommentieren --> sofortige Transformation
     - `num_columns` live ändern: 1 -> 2 -> 3 -> 4
     - Page Size ändern: A5 -> A6
    ```
  )
])

#place(horizon + center, dx: -6cm, dy: 1cm)[
  #stickybox(
    width: 7cm,
    rotation: -3deg,
    fill: sticky-orange,
  )[
    Text -> Layout\
    -> Finishing
  ]
]
#pause

#place(horizon + center, dx: 2cm, dy: -4cm)[
  #stickybox(
    width: 6.5cm,
    rotation: 5deg,
    fill: sticky-primary,
  )[
    Density is\
    a design choice.
  ]
]
#pause

#place(horizon + center, dx: 6cm, dy: 1cm)[
  #stickybox(
    width: 5.5cm,
    rotation: -14deg,
    fill: sticky-yellow,
  )[
    Knowledge\
    compressed.\
    Not lost.
  ]
]
#pause

#place(horizon + center, dx: -8cm, dy: -4cm)[
  #stickybox(
    width: 5.5cm,
    rotation: -5deg,
    fill: sticky-purple,
  )[
    Same topic.\
    Third shape.
  ]
]
#pdfpc.speaker-note(
  ```md
   - Text schreiben, Layout anpassen, Feinschliff

  ---

   - Schriftgröße und Spaltenanzahl --
     alles Parameter, keine manuelle Arbeit
     Informationsdichte für jeden steuerbar

  ---

   - Wissen Verdichten heißt nicht weglassen.
     Das ermöglicht uns das Template.

  ---

   - Digitale Souveränität --
     Brief | Artikel | --> Cheat Sheet
     Drei Formen, ein Thema.
  ```
)

== Presentation #subtitle[Yes, Even Slides · \@preview/touying]

- #alert[Syntax] Headings or `#slide[…]` blocks — clean, flexible

- #alert[Dynamic] Step-by-step reveal with `#pause` and `#meanwhile`

- #alert[Themes] Simple, University, Metropolis, Dewdrop, Aqua, Stargazer
  -- or build your own

- #alert[Math] Built-in math mode, no external packages

- #alert[Ecosystem]
  #link("https://touying-typ.github.io/docs/integration/cetz")[CeTZ],
  #link("https://touying-typ.github.io/docs/integration/fletcher")[Fletcher],
  #link("https://touying-typ.github.io/docs/integration/pinit")[Pinit],
  #link("https://touying-typ.github.io/docs/integration/codly")[Codly],
  and more

- #alert[Speed] Millisecond compilation, live preview as you type

#v(1fr)
Links: #link("https://typst.app/universe/package/touying/")\
#h(2cm) #link("https://touying-typ.github.io/")

#pdfpc.speaker-note(
  ```md
   - Letzte Dokumentart: Präsentationsfolien
   - touying Markup Idee: Headings werden zu Slides
   - Diese Folien hier -- auch Typst, selbes Prinzip
  ```
)

#focus-slide([
  DEMO
  #pause

  (on next slide)

  #meanwhile
  \@preview/touying:0.6.3

  #pdfpc.speaker-note(
    ```md
     - kurze Demo
     - next slide
    ```
  )
])

#place(horizon + center, dx: 0cm, dy: 0cm)[
  #stickybox(
    width: 12cm,
    rotation: -5deg,
    fill: sticky-primary,
  )[
    #set text(size: 40pt)
    ~\
    Oh.\  //This talk\
    No.\  //was typed,\
    #fa-icon("face-smile-wink")\  //not designed.\
    ~
  ]
]
#pdfpc.speaker-note(
  ```md
   - Text ersetzen und speichern
   - `pdfpc`: CRTL+R
  ```
)

= Choose Your Workflow

#pdfpc.speaker-note(
  ```md
   - Typst ist das Werkzeug
   - Editor ist Geschmackssache
   - Editorwahl beeinflusst den Workflow
  ```
)

== Katvan #subtitle[Editor for Typst Files with a Bias for Right-to-Left Languages]

#grid(
  columns: (1fr, 1fr),
  gutter: 0.5cm,
  image("images/katvan/screenshot-main.png", height: 11cm),
  image("images/katvan/screenshot-main-dark.png", height: 11cm),
)

#v(1fr)
Link: https://katvan.app/

#pdfpc.speaker-note(
  ```md
   - Katvan: Qt-basiert, RTL-Fokus
   - Lokal, Cross-Platform, Live-Preview
   - GPL-3.0
   - Spell-Checking, Autocomplete, Forward/Inverse Search
   - Alles was man von einem Editor erwartet
   - Typst 0.14.1 integriert -- kein externer Compiler nötig
   - modern: Qt 6.8 und C++20
   - Flatpak, AppImage, auch aarch64
  ```
)

#pagebreak()

=== Features

#grid(
  columns: (1fr, 1fr),
  gutter: 0.5cm,
  [
    - Reasonably good RTL editing
    - Cross-Platform and Local
    - Live previews
    - Syntax highlighting
    - Syntax-aware spell checking
  ],
  [
    - Autocomplete
    - Typical code editor niceties --\
      auto indentation, bracket insertion, etc.
    - Forward and inverse search
    - Modelines
  ]
)

#pause

=== Technologies and License

#grid(
  columns: (1fr, 1fr),
  gutter: 0.5cm,
  [
    - Typst 0.14.1 integrated (in v0.12.0)
    - Qt 6.8+
    - C++20 / Objective-C++
  ],
  [
    - GPL-3.0
    - Flatpak
    - AppImage (incl. aarch64)
    - Windows 10/11
    - macOS 12+ (experimental)
  ]
)

#pdfpc.speaker-note("Informationen zum Nachlesen")

== Typstify #subtitle[An elegant and intuitive editor designed for Typst]

#align(center)[
  #image("images/typstify/hero-dark.webp", height: 11cm),
]

#v(1fr)
Link: https://typstify.com/

#pdfpc.speaker-note(
  ```md
   - Typstify: kommerzieller Editor
   - Der Vollständigkeit halber erwähnt
   - jeder selbst entscheiden
   - Trial Version verfügbar
   - Instant Preview (vermutlich wie bei Katvan)
   - PDF-Export
   - integriertes Paketmanagement
   - Keine Infos zu verwendeter OSS gefunden -- Transparenz?
  ```
)

#pagebreak()

=== Features

#grid(
  columns: (1fr, 1fr),
  gutter: 0.5cm,
  [
    - Instant Visual Feedback
    - Integrated Package Management
    - Offline Functionality
    - Professional-Grade Exporting
  ],
  [
  ]
)

#pause

=== Technologies and License

#grid(
  columns: (1fr, 1fr),
  gutter: 0.5cm,
  [
    - Typst 0.14.2
    - Tinymist 0.14.4
    - Go 1.25
    - No notes about used open-source software found
  ],
  [
    - Commercial (Trial Version)
    - Flatpak
    - Windows
    - macOS
  ]
)

#pdfpc.speaker-note("Informationen zum Nachlesen")

== Typesetter #subtitle[Minimalist Typst editor]

#grid(
  columns: (1fr, 1fr),
  gutter: 0.5cm,
  image("images/typesetter/light-editor.png", height: 11cm),
  image("images/typesetter/dark-preview.png", height: 11cm),
)

#v(1fr)
Link: https://codeberg.org/haydn/typesetter

#pdfpc.speaker-note(
  ```md
   - Typesetter: minimalistisch, GNOME-nativ
   - Modern: GTK 4 and Rust
   - Hosted on Codeberg -- Community-getrieben
   - Click-to-Jump, Magnifier, Accessibility-Checking
   - Guter Einstieg für GNOME-Nutzer
   - GPL-3.0, Flatpak, GNOME Builder
   - Typst 0.14.2 integriert
   - Rust -- passt zum Typst-Ökosystem
  ```
)

#pagebreak()

=== Features

#grid(
  columns: (1fr, 1fr),
  gutter: 0.5cm,
  [
    - Adaptive, user-friendly interface
    - Fully local
    - Package support
    - Automatic preview
    - Click-to-jump
  ],
  [
    - Magnifier tool
    - Accessibility checking
    - Centered scrolling
    - Syntax highlighting
    - Document statistics
  ]
)

#pause

=== Technologies and License

#grid(
  columns: (1fr, 1fr),
  gutter: 0.5cm,
  [
    - Typst 0.14.2 integrated (in v0.11.4)
    - GNOME human interface guidelines
    - GTK 4
    - Rust
  ],
  [
    - GPL-3.0 or later
    - Flatpak
    - GNOME Builder
  ]
)

#pdfpc.speaker-note("Informationen zum Nachlesen")

== Basic Setup #subtitle[... for Power Users]

#align(center)[
  #image("images/basic-setup/nano-evince-typst.png")
]

#pdfpc.speaker-note(
  ```md
   - Minimalstes Setup: nano + evince + typst
   - Kein spezieller Editor nötig
   - Souveränität: Wir wählen das Werkzeug, nicht umgekehrt
  ```
)

#pagebreak()

=== Requirements

 + typst compiler #h(1em) (cargo: `typst-cli`)
 + any editor --- `nano`, `vim`, `emacs` or `gnome-text-editor`
 + any pdf viewer with reload function --- `evince` or `atril`

#pause

=== Layout

  * Editor *
  ```sh
  $ nano main.typ
  ```

  * Typst Compiler --- PDF Viewer *
  ```sh
  # recreates main.pdf on every save
  $ typst watch --pdf-standard a-2u main.typ --open
  ```

#pdfpc.speaker-note(
  ```md
   - öffne Editor mit `.typ`-Datei
   - `typst watch` -- kompiliert bei jedem Speichern neu
   - Typst öffnet PDF-Viewer
  ```
)
#pdfpc.speaker-note(
  ```md
   - Ein Binary: `typst-cli` -- cargo oder Paketmanager
   - Beliebiger Editor -- sogar nano reicht
   - PDF-Viewer mit Reload -- evince, atril, zathura
  ```
)

== Helix + Tinymist #subtitle[A post-modern text editor]

#align(center)[
  #image("images/helix-tinymist/helix-preview.png")
]

#pdfpc.speaker-note(
  ```md
   - Helix: post-modern, Terminal-basiert, modal
   - ein bischen wie ViM, aber anders

   - Tinymist: Language Server für Typst
   - Preview im Browser -- kein GUI nötig
  ```
)

#pagebreak()

=== Editing

```shell
$ hx main.typ
```
-> Browser opens with a preview

=== PDF Generation

```shell
$ typst compile --pdf-standard a-2a main.typ
$ typst compile --pdf-standard a-2u main.typ
```

#pdfpc.speaker-note(
  ```md
   - Typst unterstützt verschiedene PDF Standard
   - Empfehlung: A-2a (barrierefreie PDF)
   - Alternativ: A-2u
  ```
)

#pagebreak()

#codly(highlights: (
  (line: 3, start: 7, end: 15, fill: highlight),
))
```shell
$ hx --health typst
Configured language servers:
  ✓ tinymist: /home/develangel/.cargo/bin/tinymist
Configured debug adapter: None
Configured formatter: None
Tree-sitter parser: ✓
Highlight queries: ✓
Textobject queries: ✘
Indent queries: ✘
```

#v(1fr)
Links: #link("https://helix-editor.com/") \
#h(2cm) #link("https://myriad-dreamin.github.io/tinymist/")

#pdfpc.speaker-note(
  ```md
   - `hx --health typst` -- Tinymist erkannt
   - Tree-sitter: Syntax-Highlighting out of the box
  ```
)

= Take Your First Step

#pdfpc.speaker-note(
  ```md
   - Starte heute... mit dem ersten Schritt
   - Beschäftigt Euch mit dem, was wirklich wichtig ist
   - Lasst das Layout folgen
  ```
)

== Start Today #subtitle[Write what matters. Let the layout follow.]

#v(1fr)
#grid(
  columns: (1fr, 1fr),
  gutter: 0.5cm,
  align: center + horizon,
  [
    #alert[Slides and Demo Code]
    #let mylink = "https://github.com/DevelAngel/typst-chaos-talk"
    #qr-code(mylink, width: 7cm)
    #link(mylink)[#fa-icon("github") DevelAngel/typst-chaos-talk]
  ],
  [
    #alert[Typst Playground]
    #let mylink = "https://typst.app/play/"
    #qr-code(mylink, width: 7cm)
    #link(mylink)[#box(image("images/logos/typst-favicon-32x32.png", height: 1em), baseline: 0.2em) typst.app/play/]
  ]
)
#v(1fr)

#pdfpc.speaker-note(
  ```md
    - links: meine Slides und der Demo Code auf GitHub zu finden
    - oder teils im Anhang
    - rechts: Playground mit Weiterleitung zum Typst Tutorial
    - perfekt zum Experimentieren
    - übrigens: QR Codes -- Typst Paket
  ```
)

// Note: focus-slide does not increase page number
#touying-set-config(config-page(fill: rgb("#008880")))[
  #empty-slide[
    #set align(center + horizon)
    #text(white, weight: "extrabold", size: 50pt)[THANKS.]

    #text(white, weight: "black", size: 32pt)[Reclaim your documents.]
    

    #pdfpc.speaker-note(
      ```md
       - Danke fürs Zuhören
       - 3 Sekunden Stille 
       - Fragen?
      ```
    )
    #pdfpc.config(
      duration-minutes: 45,
      last-minutes: 10,
      note-font-size: 20,
    )
  ]
]


// =================================================
#show: appendix

= Appendix\ Know your Tool

== Typst Basics #subtitle[Grid-Layout]

#grid(
  columns: (2fr, 1fr),
  gutter: 0.5cm,
  [
    LEFT SIDE #lorem(12)
  ], [
    RIGHT SIDE #lorem(6)
  ]
)

#grid(
  columns: (2fr, 1fr),
  gutter: 0.5cm,
  [
#codly(highlights: (
  (line: 2, start: 12, end: 21, fill: highlight),
  (line: 3, start: 11, end: 15, fill: highlight),
))
```typst
#grid(
  columns: (2fr, 1fr), //< column width
  gutter: 0.5cm,       //< left <--> right
  [
    LEFT SIDE #lorem(12)
  ], [
    RIGHT SIDE #lorem(6)
  ],
)
```
  ],
  [
  ]
)

#v(1fr)
Link: https://typst.app/docs/reference/layout/grid/

== Typst Basics #subtitle[Images]

#grid(
  columns: (7cm, 7cm, 7cm),
  gutter: 2cm,
  [
    #image("images/typesetter/light-editor.png", width: 7cm)
  ],
  [
    #image("images/typesetter/light-editor.png", height: 7cm)
  ],
  [
    #image("images/typesetter/light-editor.png", width: 7cm)
  ]
)

#v(1cm)

#codly(highlights: (
  (line: 1, start: 46, end: 50, fill: highlight),
  (line: 2, start: 46, end: 51, fill: highlight),
))
```typst
#image("images/typesetter/light-editor.png", width: 7cm)
#image("images/typesetter/light-editor.png", height: 7cm)
```

#v(1fr)
Link: https://typst.app/docs/reference/visualize/image/

== Typst Basics #subtitle[Horizontal Spacing]

#v(1fr)

ABC #h(2cm) DEF #h(1fr) GHIJK

#v(1fr)

#codly(highlights: (
  (line: 1, start: 5, end: 11, fill: highlight),
  (line: 1, start: 17, end: 23, fill: highlight),
))
```typst
ABC #h(2cm) DEF #h(1fr) GHIJK
```

#v(1fr)
Link: https://typst.app/docs/reference/layout/h/

== Typst Basics #subtitle[Align Content Horizontally]

#v(1fr)
#align(center)[
  #set text(size: 2em, weight: "bold")
  Typst is just as cool as LaTeX
]

#v(1fr)
#codly(highlights: (
  (line: 2, start: 8, end: 13, fill: highlight),
))
```typst
#import "@preview/swank-tex:0.1.0": LaTeX
#show "LaTeX": {LaTeX}
#align(center)[
  #set text(size: 2em, weight: "bold")
  Typst is just as cool as LaTeX
]
```

#v(1fr)
Link: https://typst.app/docs/reference/layout/align/

== Typst Basics #subtitle[Vertical Spacing]

#grid(
  columns: (1fr, 1fr),
  gutter: 0.5cm,
  [
    ABC

    #v(1cm)
    DEF
    #v(1cm)
    GHIJK
  ],
  [
#codly(highlights: (
  (line: 3, start: 1, fill: highlight),
  (line: 8, start: 1, fill: highlight),
))
```typst
ABC

#v(1cm)
DEF
#v(1cm)
GHIJK

#v(1fr)
Link: #link("example.com")
```
  ]
)

#v(1fr)
Link: #link("https://typst.app/docs/reference/layout/v/")

== Typst Basics #subtitle[Code (Raw Text)]

#codly(highlights: (
  (line: 1, fill: blue),
  (line: 2, start: 25, end: 28, fill: orange),
))
```rust
fn main() {
    let fizzbuzz = (1..).map(|val| match (val % 3, val % 5) {
        (0, 0) => "FizzBuzz".to_string(),
        (0, _) => "Fizz"    .to_string(),
        (_, 0) => "Buzz"    .to_string(),
        (_, _) =>  val      .to_string(),
    });
    for x in fizzbuzz.take(25) {
        println!("{}", x)
    }
}
```

#pagebreak()

#codly(highlights: (
  (line: 5, fill: highlight),
  (line: 10, fill: highlight),
))
````typst
#codly(highlights: (
  (line: 1, fill: blue),
  (line: 2, start: 25, end: 28, fill: orange),
))
```rust
fn main() {
    let fizzbuzz = (1..).map(|val| match (val % 3, val % 5) {
    ...
}
```
````

#v(1fr)
Link: #link("https://typst.app/docs/reference/text/raw/") \
#h(1.7cm) #link("https://typst.app/universe/package/codly/")


= Appendix\ Restore Order -- Code

== Letter #subtitle[\@preview/letter-pro]

#let letter = read("letter-example/letter.typ")
#raw(letter, block: true, lang: "typ")

== Short Paper #subtitle[\@preview/rubber-article]

#let paper = read("paper-example/paper.typ")
#raw(paper, block: true, lang: "typ")

== Cheat Sheet #subtitle[\@preview/boxed-sheet]

#let cheat-sheet = read("cheat-sheet-example/cheat-sheet.typ")
#raw(cheat-sheet, block: true, lang: "typ")

== Presentation I #subtitle[\@preview/touying]

#let presi-one = read("presentation-example/presentation-simple.typ")
#raw(presi-one, block: true, lang: "typ")

== Presentation II #subtitle[\@preview/touying]

#let presi-two = read("presentation-example/presentation-more-complex.typ")
#raw(presi-two, block: true, lang: "typ")
