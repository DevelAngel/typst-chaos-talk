#import "@preview/letter-pro:3.0.0": letter-simple
#import "@preview/icu-datetime:0.2.0" as icu
#import "@preview/fontawesome:0.6.0": fa-icon
#set text(lang: "de")
#let long_date(..args) = icu.fmt(datetime(..args), length: "long", locale: "de")
#show: letter-simple.with(
  font: "New Computer Modern",
  sender: (
    name: "Sascha Ausgedacht",
    address: "Zwickauer Straße 42, 09112 Chemnitz",
    extra: [
      Telefon: #link("tel:+49123456789")[+49 123 456789]\
      E-Mail:  #link("mailto:sascha.ausgedacht@example.com")[sascha.ausgedacht\@example.com]\
      #fa-icon("phone")    #link("tel:+49123456789")[+49 123 456789]\
      #fa-icon("envelope") #link("mailto:sascha.ausgedacht@example.com")[sascha.ausgedacht\@example.com]\
    ],
  ),
  annotations: [Einschreiben-Einwurf],
  recipient: [
    Stadt Chemnitz\
    Dezernat für Bildung, Soziales und Kultur\
    Markt 1\
09111 Chemnitz
  ],
  reference-signs: (
    ([Ort], [CLT-2026]),
  ),
  date: "Chemnitz, " + long_date(year: 2026, month: 03, day: 28),
  subject: [
    Digitale Souveränität in städtischen Bildungseinrichtungen:\
    Vorschlag zur schrittweisen Migration auf offene Dokumentenformate
  ],
)

Sehr geehrte Damen und Herren,

ich schreibe Ihnen, weil ich seit vier Jahren als ehrenamtliche Dozentin
an der Volkshochschule Chemnitz Kurse zur digitalen Grundbildung gebe ---
und weil ich in diesen vier Jahren ein Muster beobachtet habe,
das mich zunehmend beunruhigt.
 
Stellen Sie sich folgende Situation vor:
Eine Teilnehmerin -- Mitte fünfzig, motiviert, zum dritten Mal im Kurs --
möchte zu Hause einen Elternbrief für die Schule ihres Enkels schreiben.
Sie öffnet ihr Textverarbeitungsprogramm, das sie im Kurs kennengelernt hat.
Das Programm verlangt ein Abonnement. 9,99 Euro im Monat.
Sie schließt das Programm wieder.
 
Das ist kein Einzelfall. Es ist der Regelfall.
 
Sie werden einwenden -- und Sie hätten Recht damit --,
dass kostenfreie Alternativen existieren.
LibreOffice, Google Docs, diverse Online-Editoren.
Das Problem liegt nicht im Angebot.
Das Problem liegt in dem, was wir an städtischen Einrichtungen vorleben.
Wenn jede Volkshochschule, jede Bibliothek, jedes Amt ausschließlich
mit proprietären Formaten arbeitet, dann senden wir eine Botschaft,
die lauter ist als jeder Flyer zur Digitalisierung:
#quote[Es gibt nur einen Weg.]
 
Das stimmt nicht. Und Sie wissen das.
 
Ich schlage Ihnen daher drei konkrete Schritte vor,
die weder ein großes Budget noch eine große Umstellung erfordern ---
aber eine große Wirkung haben können.
 
Erstens: Die städtischen Bildungseinrichtungen stellen ihre Vorlagen,
Formulare und Handreichungen parallel in offenen Formaten bereit.
Nicht ausschließlich, nicht sofort überall, aber sichtbar und gleichberechtigt.
Das betrifft konkret die Formate ODF für Textdokumente,
CSV für tabellarische Daten und PDF/A für Archivierung.
 
Zweitens: Die VHS-Kurse zur digitalen Grundbildung erhalten einen Baustein,
der offene Formate nicht als Nischenthema behandelt,
sondern als das, was sie sind ---
ein Bürgerrecht auf Zugang zu den eigenen Dokumenten,
unabhängig von der Software eines einzelnen Anbieters.
 
Drittens: Die Stadt prüft, ob für interne Dokumente --
Protokolle, Rundschreiben, Vorlagen -- ein offenes Standardformat
als Erstformat festgelegt werden kann.
Nicht als Verbot proprietärer Software, sondern als Standardrichtung.
 
Ich bin mir bewusst, dass Verwaltungsprozesse Trägheit haben --
nicht aus böser Absicht, sondern aus guten Gründen:
Stabilität, Kompatibilität, Schulungsaufwand.
Diese Einwände sind berechtigt.
Aber sie beschreiben Kosten des Übergangs, nicht Argumente gegen das Ziel.
Und das Ziel --
digitale Souveränität für die Bürgerinnen und Bürger dieser Stadt --
ist eines, das Chemnitz als Kulturhauptstadt Europas 2025
sich nicht nur leisten kann, sondern leisten sollte.
 
Gesellschaftliche Transformation beginnt selten mit großen Gesten.
Sie beginnt mit der Frage, ob ein Formular auch in einem Format verfügbar ist,
das keine Lizenzgebühr voraussetzt.
 
Ich stehe Ihnen gern für ein Gespräch zur Verfügung und
bringe konkrete Erfahrungswerte aus vier Jahren Kursarbeit mit.

#v(1em)
Freundliche Grüße,
#v(1cm) // Space for signature
#text(size: 8pt, "Sascha Ausgedacht")
