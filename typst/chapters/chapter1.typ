#import "@preview/acrostiche:0.7.0": acr, acrfull, acs, acl, acrpl, init-acronyms
#import "@preview/glossarium:0.5.10": gls
#import "../thm/abbreviations.typ": *
#import "../acronyms.typ": acronyms

= Schreibstil

== Rechtschreibung und Wortbenutzung

Beachten Sie die Hinweise zur Wortbenutzung, Rechtschreibung und Zeichensetzung im @anhang-a.
Hier finden Sie Tipps zur Übersetzung von deutschen und englischen Begriffen, zur Zeichensetzung und Wortbenutzung.

== Fremdsprachige Begriffe

Wenn Sie Ihre Arbeit auf Deutsch verfassen, gehen Sie sparsam mit englischen Ausdrücken um. Natürlich brauchen Sie etablierte englische Fachbegriffe, wie #zb _Interrupt_, nicht zu übersetzen. Sie sollten aber immer dann, wenn es einen gleichwertigen deutschen Begriff gibt, diesem den Vorrang geben. Den englischen Begriff (_term_) können Sie dann in Klammern oder in einer Fußnote #footnote[Englisch: _footnote_] erwähnen. Absolut unakzeptabel sind deutsch gebeugte englische Wörter oder Kompositionen aus deutschen und englischen Wörtern wie #zb downgeloadet, upgedated, Keydruck oder Beautyzentrum.

== Zitate

=== Zitate im Text

Wichtig ist das korrekte Zitieren von Quellen, wie es #zb von @Kornmeier2011 dargelegt wird. Interessant ist in diesem Zusammenhang weiterhin der Artikel von @Kramer2009. Häufig werden die Zitate auch in Klammern gesetzt, wie bei @Kornmeier2011 und zusätzlich mit Seitenzahlen versehen @Kornmeier2011[S. 301--303]. Wenn nur zwei aufeinanderfolgende Seiten zitiert werden sollen, kann man `f.` bei mehreren `ff.` verwenden, also im Beispiel von Kornmeier @Kornmeier2011[S. 301 f.] meint dies die Seiten 301 und 302 bzw. @Kornmeier2011[S. 301 ff.] bezieht sich auf mehrere Seiten, die bei 301 beginnen. Generell ist es besser, einen Seitenbereich anzugeben, als `ff.` zu verwenden.

Bei Webseiten wird auch die URL und das Abrufdatum mit angegeben @Gao2017.

Veröffentlichungen in Konferenzbänden werden in sogenannten Inbooks oder Inproceedings veröffentlicht und besitzen meist eine #acr("doi") (#zb @Lang2022).

=== Zitierstile

Verwenden Sie eine einheitliche und im gesamten Dokument konsequent durchgehaltene Zitierweise. Es gibt eine ganze Reihe von unterschiedlichen Standards für das Zitieren und den Aufbau eines Literaturverzeichnisses. Sie können entweder mit Fußnoten oder Kurzbelegen im Text arbeiten. Welches Verfahren Sie einsetzen ist Ihnen überlassen, nur müssen Sie es konsequent durchhalten. Stimmen Sie sich im Vorfeld mit Ihrem Betreuer ab -- diese Vorlage unterstützt alle gängigen Zitierweisen.

In der Informatik ist das Zitieren mit Kurzbelegen im Text (Harvard-Zitierweise) weit verbreitet, wobei für das Literaturverzeichnis häufig die Regeln der #acr("acm") oder #acr("ieee") angewandt werden. #footnote[Einen Überblick über viele verschiedene Zitierweisen finden Sie in der http://amath.colorado.edu/documentation/LaTeX/reference/faq/bibstyles.pdf]

Am einfachsten ist es, wenn Sie das `@` oder `#cite`-Kommando verwenden. Bei diesem Kommando können Sie in der Datei `thesis.typ` festlegen, wie die Zitate generell aussehen sollen, #zb ob sie in Fußnoten erfolgen sollen oder nicht. Wollen Sie von dem globalen Zitierstil abweichen, können Sie weiterhin spezielle Kommandos benutzen:

- `@Willberg2021`: @Willberg2021
- `#cite(<Willberg2021>`: #cite(<Willberg2021>)
- `#cite(<Willberg2021>, style: "alphanumeric")`: #cite(<Willberg2021>, style: "alphanumeric")
- `#cite(<Willberg2021>, style: "chicago-author-date")`: #cite(<Willberg2021>, style: "chicago-author-date")
- `#footnote[#cite(<Willberg2021>, style: "chicago-author-date")]`: #footnote[#cite(<Willberg2021>, style: "chicago-author-date")]
- `#cite(<Willberg2021>, form: "author")`: #cite(<Willberg2021>, form: "author")
- `#cite(<Willberg2021>, form: "full", style: "chicago-author-date")`: #cite(<Willberg2021>, form: "full", style: "chicago-author-date")

Denken Sie daran, dass das Übernehmen einer fremden Textstelle ohne entsprechenden Hinweis auf die Herkunft in wissenschaftlichen Arbeiten nicht akzeptabel ist und dazu führen kann, dass die Arbeit nicht anerkannt wird. Plagiate werden mit mangelhaft (5,0) bewertet und können weitere rechtliche Schritte nach sich ziehen.

=== Zitieren von Internetquellen

Internetquellen sind normalerweise _nicht_ zitierfähig. Zum einen, weil sie nicht dauerhaft zur Verfügung stehen und damit für den Leser möglicherweise nicht beschaffbar sind und zum anderen, weil häufig der wissenschaftliche Anspruch fehlt. #footnote[Eine lesenswerte Abhandlung zu diesem Thema findet sich (im Internet) bei @Weber2006]

Wenn ausnahmsweise doch eine Internetquelle zitiert werden muss, #zb weil für eine Arbeit dort Informationen zu einem beschriebenen Unternehmen oder einer Technologie abgerufen wurden, sind folgende Punkte zu beachten:

- Die Webseite ist in ein PDF-Dokument zu drucken, damit Sie die Informationen ablegen können,
- das Datum des Abrufs und die URL sind anzugeben,
- verwenden Sie Internet-Seiten ausschließlich zu illustrativen Zwecken (#zb um einen Sachverhalt noch etwas genauer zu erläutern), aber nicht zur Faktenvermittlung (#zb um eine Ihrer Thesen zu belegen).

Sprechen Sie mit Ihrer Betreuerin bzw. Ihrem Betreuer ab, ob diese die PDFs der Internetquellen mit der Arbeit zusammen abgegeben bekommen möchten. Als Abgabeformat der elektronischen Quellen ist PDF/A #footnote[Bei PDF/A handelt es sich um eine besonders stabile Variante des #acr("pdf"), die von der #acr("iso") standardisiert wurde.] vorteilhaft, weil es von allen Formaten die größte Stabilität besitzt.

Wikipedia stellt einen immensen Wissensfundus dar und enthält zu vielen Themen hervorragende Artikel. Sie müssen sich aber darüber im Klaren sein, dass die Artikel in Wikipedia einem ständigen Wandel unterworfen sind und nicht als Quelle für wissenschaftliche Fakten genutzt werden sollten. Es gelten die allgemeinen Regeln für das Zitieren von Internetquellen. Sollten Sie doch Wikipedia nutzen müssen, verwenden Sie bitte ausschließlich den Perma-link #footnote[Sie erhalten den Permalink über die Historie der Seite und einen Klick auf das Datum.] zu der Version der Seite, die Sie aufgerufen haben.

== Gliederung: Zweite Ebene

Die Gliederung im Inhaltsverzeichnis erfolgt mit Kapiteln `= Titel`, Abschnitten `== Titel`, Unterabschnitten `=== Titel`.

Zusätzlich können noch Unterunterabschnitte `==== Titel` und Absätze `===== Titel` verwendet werden. Damit kommt man auf maximal fünf Ebenen; für eine Abschlussarbeit mehr als ausreichend.

Auf jeder Ebene sollten Sie erläutern, was in den darunter liegenden Ebene beschrieben wird, sodass im Normalfall keine Gliederungsebene leer ist und nur aus Untereinheiten besteht. Im Folgenden zeigt dieses Template, wie man weitere Ebenen mit Typst erzeugt.

=== Gliederung: Dritte Ebene

==== Gliederung: Vierte Ebene

===== Gliederung: Fünfte Ebene
Dies ist ein Text, der direkt hinter der Absatzüberschrift steht.

Anders als in diesem Beispiel darf in Ihrer Arbeit kein Gliederungspunkt auf seiner Ebene alleine stehen. #Dh wenn es ein 1.1 gibt, muss es auch ein 1.2 geben.
