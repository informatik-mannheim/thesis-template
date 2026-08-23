#import "@preview/acrostiche:0.7.0": acr, acrfull, acs, acl, acrpl, init-acronyms
#import "@preview/glossarium:0.5.10": gls
#import "../thm/abbreviations.typ": *
#import "../acronyms.typ": acronyms

= Typografie

== Hervorhebungen <Hervorhebungen>

Achten Sie bitte auf die grundlegenden Regeln der Typografie #footnote[Ein Ratgeber in allen Detailfragen ist @Forssman2002.], wenn Sie Ihren Text schreiben. Hierzu gehören #zb die Verwendung der richtigen "Anführungszeichen" und der Unterschied zwischen Binde- (-), Gedankenstrich (--) und langem Strich (---). Sie erhalten den Bindestrich in Typst mit -, den Gedankenstrich mit -\- und den langen Strich mit -\-\-.

Wenn Sie Text hervorheben wollen, dann setzten Sie ihn mit `_text_` _kursiv_ (Italic) und nicht *fett* (Bold). Fettdruck ist Überschriften vorbehalten; im Fließtext stört er den Lesefluss. Das #underline[Unterstreichen] von Fließtext ist im gesamten Dokument tabu und kann maximal bei Pseudo-Code vorkommen.

== Anführungszeichen

Typst unterstützt Unicode, #dh Sie können die korrekten Anführungszeichen einfach in den Text einfügen.

Die für die Sprache richtigen Anführungszeichen werden werden mit `"` und `'` erzeugt: "dieser Text steht in 'Anführungszeichen'; alles klar?".

Andere Anführungszeichen fügen Sie entsprechend aus dem Unicode ein, #zb “this is an ‘English’ quotation” «Ceci est un texte français». Beachten Sie, dass Sie in Zitaten immer die zur Sprache passenden Anführungszeichen verwenden.

== Silbentrennung

Typst führt eine automatische Silbentrennung durch, sodass Sie sich eigentlich um nichts kümmern müssen.

== Abkürzungen

Eine #acr("abk") `#acr("abk") ` wird bei der ersten Verwendung ausgeschrieben. Danach nicht mehr: #acr("abk"). Man kann allerdings mit `#acl("abk")` die Langform explizit anfordern (#acl("abk")) oder mit `#acs("abk")` die Kurzform (#acs("abk")) oder mit `#acrfull("abk")` auch noch einmal die Definition (#acrfull("abk")). Wenn Sie eine Abkürzung im Plural verwenden wollen, gibt ihnen `#acrpl("isp")` die Möglichkeit (#acrpl("isp")).

Beachten Sie, dass bei Abkürzungen, die für zwei Wörter stehen, ein schmales Leerzeichen nach dem Punkt kommt: #zb bzw. #zb und #dh bzw. #dh Das Template bietet hierfür die beiden Makros `#zb` und `#dh`.

== Glossar

Ein Eintrag in dem Glossar kann mithilfe des Befehls `#gls("amplification").` erzeugt werden. Hierbei wird die Begriffserklärung in der Datei `glossary.typ` verwendet und in dem Verzeichnis aufgeführt. Ein Beispiel hierfür wäre: #gls("amplification"). Das Wort Amplification erscheint nun in der Begriffserklärung.

== Querverweise

Querverweise auf eine Kapitelnummer macht man im Text mit `@` (@Hervorhebungen) und auf eine bestimmte Seite mit `#ref(<Hervorhebungen>, form: "page")` (#ref(<Hervorhebungen>, form: "page")).

== Fußnoten

Fußnoten werden einfach mit in den Text geschrieben, und zwar genau an die Stelle #footnote[An der die Fußnote auftauchen soll]. Hierzu dient der Befehl `#footnote[Text]`.

== Tabellen

Tabellen werden normalerweise ohne vertikale Striche gesetzt, sondern die Spalten werden durch einen entsprechenden Abstand voneinander getrennt. #footnote[Siehe @Willberg2021[S. 89].] Zum Einsatz kommen ausschließlich horizontale Linien (siehe @Kopplungsformen).

#figure(
  table(
    columns: 3,
    table.hline(),
    [Form der Kopplung], [enge Kopplung], [lose Kopplung],
    table.hline(stroke: 0.3pt),

    [Physikalische Verbindung], [Punkt-zu-Punkt], [über Vermittler],
    [Kommunikationsstil], [synchron], [asynchron],
    [Datenmodell], [komplexe gemeinsame Typen], [nur einfache gemeinsame Typen],
    [Bindung], [statisch], [dynamisch],

    table.hline(),
  ),
  caption: [Kopplungsformen],
) <Kopplungsformen>

Eine Tabelle fließt genauso, wie auch Bilder durch den Text. Siehe @Kopplungsformen.

Will man keinen Blocksatz in einer Tabellenzelle, kann man `#set par(justify: false)` verwenden.

#set par(justify: false)

#figure(
  table(
    columns: 3,

    table.hline(),
    [Gebiet], [Definition], [Beispiel],
    table.hline(stroke: 0.3pt),

    [_Praktische Informatik_],
    par(justify: false)[Informatik-Disziplinen, welche sich vorwiegend mit der Entwicklung und Anwendung der Software-Komponenten befassen],
    [#par(justify: false)[Programmentwicklung, Compilerbau; im Aufbau von #zb Informationssystemen und Netzwerken ergeben sich Überlappungen mit der technischen Informatik]],

    table.hline(stroke: 0.3pt),

    [_Technische Informatik_],
    [Informatik-Disziplinen, welche sich vorwiegend mit der Entwicklung und Anwendung der Hardware-Komponenten befassen],
    [Digitaltechnik, Mikroprozessortechnik],

    table.hline(stroke: 0.3pt),

    [_Theoretische Informatik_],
    [Informatik-Disziplinen, welche sich mit der Entwicklung von Theorien und Modellen der Informatik befassen und dabei viel Substanz aus der Mathematik konsumieren],
    [Relationenmodell, Objekt-Paradigmen, Komplexitätstheorie, Kalküle],

    table.hline(stroke: 0.3pt),

    [_Angewandte Informatik_],
    [Informatik als instrumentale Wissenschaft],
    [Rechtsinformatik, Wirtschaftsinformatik, Geoinformatik],

    table.hline(),
  ),
  caption: [Teildisziplinen der Informatik],
) <Teildisziplinen>

#set par(justify: true)

== Harveyballs

#quote[
  Harvey Balls sind kreisförmige Ideogramme, die dazu dienen, qualitative Daten anschaulich zu machen. Sie werden in Vergleichstabellen verwendet, um anzuzeigen, inwieweit ein Untersuchungsobjekt sich mit definierten Vergleichskriterien deckt. @Wikipedia_HarveyBalls
]

#figure(
  table(
    columns: 4,
    align: center,

    table.hline(),
    [], [Ansatz 1], [Ansatz 2], [Ansatz 3],
    table.hline(stroke: 0.3pt),

    [Eigenschaft 1], [○], [◔], [◑],
    table.hline(stroke: 0.3pt),

    [Eigenschaft 2], [◑], [◕], [●],
    table.hline(stroke: 0.3pt),

    [Eigenschaft 3], [●], [◕], [◔],

    table.hline(),
  ),
  caption: [Beispiel für Harvey Balls],
) <HarveyExample>

== Aufzählungen

Aufzählungen sind toll.

- Ein wichtiger Punkt
- Noch ein wichtiger Punkt
- Ein Punkt mit Unterpunkten
  - Unterpunkt 1
  - Unterpunkt 2
- Ein abschließender Punkt ohne Unterpunkte


Aufzählungen mit laufenden Nummern sind auch toll.

+ Ein wichtiger Punkt
+ Noch ein wichtiger Punkt
+ Ein Punkt mit Unterpunkten
  + Unterpunkt 1
  + Unterpunkt 2
+ Ein abschließender Punkt ohne Unterpunkte


Aufzählungen mit eigenen Bezeichnern sind auch toll.

#enum(
  [Ein wichtiger Punkt],
  [Noch ein wichtiger Punkt],
  [Ein Punkt mit Unterpunkten],
  [Ein abschließender Punkt ohne Unterpunkte],
  numbering: "RQ 1)"
)
