
// TODO: colorbox package
// TODO: beatiful code blocks - 2 packages

// TODO: beautiful code blocks

// TODO: title var

// TODO: rubber-article template
// TODO: template show

// TODO: maketitle -> title var

// TODO: abstract


// TODO: Headers
Header Ein Dienstagabend an der Volkshochschule

Es ist kurz nach halb sieben, Raum 2.14, Volkshochschule Chemnitz.
Zwölf Teilnehmerinnen und Teilnehmer sitzen vor Bildschirmen,
die meisten zum zweiten oder dritten Mal im Kurs.
Heute steht auf dem Plan: einen Elternbrief schreiben.
Klingt harmlos. Ist es nicht.

Eine Teilnehmerin -- nennen wir sie Frau Berger -- hat den Text bereits im Kopf.
Drei Sätze an die Klassenlehrerin, eine Entschuldigung
für den versäumten Elternabend, die Bitte um einen Nachholtermin.
Der Inhalt kostet sie dreißig Sekunden.
Die Formatierung kostet sie den Rest des Abends.
Wo steht der Absender?
Wie groß ist der Abstand zum Anschriftenfeld?
Warum springt das Datum in die nächste Zeile, wenn sie die Schriftgröße ändert?

Frau Berger ist nicht inkompetent.
Sie kämpft gegen ein Werkzeug, das ihr für jede inhaltliche Entscheidung
drei gestalterische aufzwingt.

Warum?

Die Antwort führt tiefer, als Sie vielleicht vermuten --
nicht in die Technik, sondern in die Psychologie.
Und sie hat Konsequenzen, die weit über einen Elternbrief hinausreichen.


Header Mental Load: Das unsichtbare Gewicht der Formatierung

In der Kognitionspsychologie gibt es einen Begriff, der beschreibt,
was Frau Berger erlebt:
Mental Load -- die Summe aller Entscheidungen,
die Ihr Arbeitsgedächtnis gleichzeitig offen halten muss.
Stellen Sie sich Ihr Arbeitsgedächtnis wie einen Schreibtisch vor
(nicht wie eine Festplatte, die beliebig viel speichert,
sondern wie eine Arbeitsfläche, auf der nur eine begrenzte Anzahl
von Dokumenten gleichzeitig aufgeschlagen sein kann).
Jede offene Entscheidung ist ein aufgeschlagenes Dokument.
Werden es zu viele, rutschen welche herunter.
Oder Sie hören auf, neue aufzuschlagen.

Wenn Sie einen Brief in einem klassischen Textverarbeitungsprogramm schreiben,
liegen auf diesem Schreibtisch gleichzeitig:
der Inhalt Ihres Briefes, die Frage nach dem richtigen Format,
die Frage nach der Schriftgröße der Betreffzeile,
die Frage, ob der Abstand zwischen Anrede und Fließtext stimmt,
die Frage, warum das Datum gerade nach rechts gesprungen ist,
obwohl Sie nur die Eingabetaste gedrückt haben.
Das sind -- konservativ gezählt -- fünf parallele Entscheidungsebenen,
von denen genau eine mit dem zu tun hat, was Sie eigentlich wollen:
kommunizieren.

Das ist kein Usability-Problem. Es ist ein Architekturproblem.

\@fig:mental-load zeigt dieses Verhältnis.

// TODO: @fig:mental-load

In einem klassischen Textverarbeitungsprogramm trägt der Autor
fünf Entscheidungsebenen gleichzeitig.
In einem satzbasierten System bleibt genau eine: der Inhalt.


Header Zwei Philosophien – ein Vergleich

Es gibt eine andere Art, Dokumente zu erzeugen. Sie heißt: Inhalt und
Darstellung trennen. Das Prinzip ist alt – älter als die meisten
Textverarbeitungsprogramme. Wer aus dem akademischen Umfeld kommt, kennt es
vielleicht von LaTeX. Typst verfolgt denselben Grundgedanken, aber mit dem Ziel,
die Einstiegshürde radikal zu senken.

Ansatz A -- das klassische Textverarbeitungsprogramm:
Sie sehen das Ergebnis sofort (WYSIWYG).
Jede Formatierungsentscheidung treffen Sie manuell und visuell.
Das fühlt sich intuitiv an --- bis Sie merken, dass "intuitiv" hier bedeutet:
Sie tragen die gesamte kognitive Last der Gestaltung,
bei jeder Zeile, bei jedem Dokument, jedes Mal von vorn.

Ansatz B -- ein satzbasiertes System wie Typst:
Sie schreiben Ihren Inhalt als Text mit semantischen Markierungen.
"Das hier ist eine Überschrift."
"Das hier ist ein Absatz."
"Das hier ist eine Aufzählung."
Eine Vorlage -- ein Template -- übersetzt diese Markierungen
in ein fertiges Layout.
Die Vorschau erscheint in Echtzeit, während Sie tippen.
Und Sie treffen genau eine Art von Entscheidung:
Was will ich sagen?

Der Kontrast lässt sich beziffern.
\@tab:vergleich zeigt ihn entlang der Dimensionen,
die für den Alltag zählen --
nicht für den Informatiker, sondern für Frau Berger.

// TODO: @tab:vergleich

Lesen Sie die Zeile "Kognitive Ebenen beim Schreiben" noch einmal.
In der klassischen Textverarbeitung: fünf.
In Typst: eine. Nur der Inhalt.

Das klingt nach einem Effizienzgewinn. Es ist einer. Aber es ist mehr als das.


Header Typst und die Frage der Zugänglichkeit

Typst wurde für Menschen entworfen, die Dokumente schreiben wollen,
nicht für Menschen, die Satzsysteme konfigurieren wollen.
Die Syntax ist schlank. Fehlermeldungen sind lesbar.
Die Vorschau erscheint in Echtzeit, während Sie tippen.
Und das Template-System erlaubt es, komplexe Layouts zu definieren,
ohne dass die Person, die das Template *verwendet*,
dessen Innenleben verstehen muss.

Um das greifbar zu machen, schauen Sie sich in \@lst:brief an,
wie ein einfacher Brief -- mit Absender, Empfänger und Betreff --
in Typst aussieht.

// TODO: @lst:brief

Kein `\begin{document}`. Kein `\usepackage`.
Der Inhalt beginnt dort, wo er hingehört:
nach der Konfiguration, ohne syntaktischen Ballast drumherum.

Das ist der Punkt, an dem Mental-Load-Reduktion aufhört,
ein Nebeneffekt zu sein, und zum Designprinzip wird.
Es reicht nicht, die Formatierungslast vom Autor zu nehmen.
Sie darf nicht durch eine Werkzeuglast ersetzt werden,
die gleich schwer wiegt.

(Ob Typst diesen Anspruch nach wenigen Jahren Entwicklung bereits vollständig
einlöst, ist eine offene Frage. Die Richtung stimmt. Die Antwort steht aus.)


Header Was Dokumente mit Souveränität zu tun haben

Sie könnten an dieser Stelle einwenden:
"Das ist ein Nischenproblem. Wer keinen wissenschaftlichen Artikel schreibt,
braucht kein Satzsystem."
Der Einwand ist naheliegend. Er ist auch falsch.

Erinnern Sie sich an Frau Berger?
Ihr Problem war nicht, dass sie einen Artikel schreiben wollte.
Ihr Problem war ein Elternbrief. Drei Sätze.
Und ein Werkzeug, das diese drei Sätze in ein einstündiges Formatierungsprojekt
verwandelt hat.

Digitale Souveränität -- das Thema, das die Chemnitzer Linux-Tage 2026
unter dem Motto „Gesellschaft und Transformation" stellen --
beginnt nicht bei Verschlüsselung, nicht bei Datenschutz,
nicht bei Open Source im engeren Sinne.
Sie beginnt bei der Frage: Können Sie mit Ihren eigenen Dokumenten das tun,
was Sie tun wollen, ohne dass das Werkzeug Ihnen dabei im Weg steht?

Das klingt bescheiden. Es ist radikal.

Denn wenn die Antwort "Nein" lautet --
wenn Sie einen Brief nur dann korrekt formatieren können,
wenn Sie eine bestimmte Software besitzen,
wenn Sie ein Formular nur dann ausfüllen können,
wenn Sie ein bestimmtes Dateiformat öffnen können,
wenn Sie Ihre eigenen Texte nur dann weitergeben können,
wenn die Empfängerin dieselbe Anwendung nutzt --,
dann sind Sie nicht souverän.
Sie sind Nutzerin oder Nutzer. Im wörtlichen Sinne: jemand, der benutzt wird.


Header Drei Schritte, die nichts kosten und alles ändern

Sie haben jetzt das Problem gesehen
(Mental Load durch Werkzeuge, die Inhalt und Form vermischen),
die Ursache verstanden (eine Architekturentscheidung, keine Unvermeidbarkeit)
und eine Alternative kennengelernt
(ein satzbasiertes System, das diese Vermischung auflöst).
Was folgt daraus -- konkret, heute, für Sie?

Erstens: Trennen Sie Denken und Gestalten.
Wenn Sie das nächste Mal ein Dokument schreiben,
schreiben Sie zuerst den Inhalt. Nur den Inhalt.
In einem einfachen Texteditor, in Markdown, in Typst,
in was auch immer -- aber ohne gleichzeitig über Schriftarten nachzudenken.
Spüren Sie den Unterschied.
Er ist körperlich.

Zweitens: Prüfen Sie Ihre Formate.
Können Sie Ihre wichtigsten Dokumente in einem offenen Format speichern --
ODF, PDF/A, Markdown?
Wenn nicht: Warum nicht? Die Antwort ist selten technisch.
Sie ist meistens Gewohnheit.

Drittens: Erwarten Sie Offenheit.
Wenn Ihre Verwaltung, Ihre Schule, Ihr Arbeitgeber Formulare verteilt,
die nur mit einer bestimmten Software geöffnet werden können,
stellen Sie die Frage: "Gibt es das auch in einem offenen Format?"
Sie werden überrascht sein, wie oft die Antwort lautet:
"Darüber haben wir noch nicht nachgedacht."

Das ist keine Kritik. Es ist eine Einladung.


Header Gesellschaft und Transformation

Transformation ist ein großes Wort.
Es suggeriert Umbruch, Revolution, Disruption.
Aber die Transformationen, die bleiben --
die, die eine Gesellschaft wirklich verändern --,
sehen meistens anders aus.
Sie sehen aus wie Frau Berger,
die an einem Dienstagabend in der Volkshochschule einen Elternbrief schreibt.
Und die zum ersten Mal nicht gegen ihr Werkzeug kämpft,
sondern mit ihm arbeitet.

Nicht weil die Software besser geworden ist.
Sondern weil jemand entschieden hat,
dass die Last der Gestaltung nicht bei den Menschen liegen sollte,
die etwas zu sagen haben.

Das ist keine technische Entscheidung. Es ist eine gesellschaftliche.

// TODO: colorbox (slanted -> outline)
