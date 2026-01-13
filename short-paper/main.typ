#import "@preview/rubber-article:0.5.0": *
#import "@preview/swank-tex:0.1.0": TeX, LaTeX

#show "LaTeX": {LaTeX}
#show "TeX": {TeX}

#show: article.with(
  lang: "de",
  page-paper: "a4",
  text-size: 11pt,
  par-spacing: 1.2em,
  par-first-line-indent: 0em,
  page-numbering: none,
  heading-numbering: none,
)

#maketitle(
  title: "Chaos überwinden mit Typst",
  authors: ("Angelos Drossos",),
  metadata: true,
)

= Das Chaos

In diesem Vortrag werden die Herausforderungen der Dokumentenerstellung mit klassischen Office-Programmen beleuchtet: hüpfende Seitenzahlen, wechselnde Schriften, inkonsistente Stichpunkte. Das Formatierungs-Chaos kostet Zeit und Nerven, besonders wenn Inhalt und Layout nicht sauber getrennt sind.

= Der Weg zur Ordnung

#link("https://typst.app/")[Typst] bietet einen Ansatz, diese Probleme zu überwinden. Es ist ein modernes, markup-basiertes Open-Source-Textsatzsystem, das konsequent Inhalt von Layout trennt. Einmal ein Template erstellen oder ein fertiges Template aus dem #link("https://typst.app/universe/")[Typst~Universe] nutzen, danach nur noch Inhalt schreiben - die Formatierung bleibt automatisch konsistent. Anders als bei LaTeX ist die Lernkurve dabei deutlich flacher, und der Workflow ist modern: schneller Compiler, Watch-Modus, Language Server.

= Inhalt des Vortrags

Dieser Vortrag baut auf dem CLT2025-Vortrag #link("https://chemnitzer.linux-tage.de/2025/de/programm/beitrag/225")["Typst: eine moderne Alternative zu TeX?"] auf und zeigt die praktische Anwendung. Ein detaillierter Vergleich zwischen Typst und TeX steht nicht im Fokus - vielmehr geht es um den praktischen Einstieg für Nutzer klassischer Office-Programme. In Live-Demos wird demonstriert, wie alltägliche Dokumente entstehen - mit konsistenter Formatierung und ohne manuellen Eingriff.

Der Vortrag geht dabei auf typische Anwendungsfälle ein und klärt, wann Typst die richtige Wahl ist und wo seine Grenzen liegen. Besonderer Fokus liegt auf der Frage, wie der Umstieg auf ein Open-Source-Werkzeug im Alltag praktisch gelingt.

= Ziel

Ziel ist es, Verständnis für das Typst-Prinzip zu schaffen und die Teilnehmer zu motivieren, Typst selbst auszuprobieren. Ein praktischer Schritt zu digitaler Souveränität im Dokumenten-Alltag.
