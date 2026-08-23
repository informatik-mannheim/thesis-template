#import "@preview/acrostiche:0.7.0": acr, acrfull, acs, acl, acrpl, init-acronyms
#import "@preview/glossarium:0.5.10": gls
#import "../thm/abbreviations.typ": *
#import "../acronyms.typ": acronyms

= Checkliste

Die folgende Checkliste kann dazu dienen, die Arbeit auf die wichtigsten Bewertungskriterien zu prüfen. Jeder Dozent hat andere Kriterien, die unten aufgeführten dürften aber für die meisten Dozenten gültig sein.

== Form und Sprache

#set text(size: 11pt)
#set list(marker: sym.ballot, spacing: 1.5em)

- *Aufbau*: Die Arbeit ist nach wissenschaftlichen Prinzipien aufgebaut (wesentliche Teile vorhanden, Nummerierung/Verweise korrekt, Verzeichnisse vorhanden).

  - _Wesentliche Teile_: Die folgenden Elemente der Arbeit sind vorhanden: Titelblatt, Abstract/Zusammenfassung, Einleitung, Hauptteil, Fazit/Ausblick.
  - _Nummerierung/Verweise_: Das Nummerierungsschema wird konsistent über die gesamte Arbeit durchgehalten, die Verweise auf die verschiedenen Elemente (Abbildungen, Tabellen etc.) sind korrekt.
  - _Verzeichnisse_: Die Arbeit enthält alle relevanten Verzeichnisse: Inhaltsverzeichnis, Literaturverzeichnis, Abbildungsverzeichnis, Tabellenverzeichnis, eventuell Glossar.

- *Sprache*: Die verwendete Sprache entspricht wissenschaftlichen Ansprüchen.

  - _Begriffe und Definitionen_: Begriffe werden einheitlich und konsistent verwendet. Neue Begriffe werden definiert und mit Literatur hinterlegt.
  - _Abkürzungen_: Alle Abkürzungen werden eingeführt und erläutert. Abkürzungen werden bei der ersten Verwendung ausgeschrieben und in einem Abkürzungsverzeichnis geführt.
    Es werden keine unüblichen oder selbst erfunden Abkürzungen verwendet. Ein Glossar kann verwendet werden, um Begriffe noch einmal kompakt darzustellen.
  - _Rechtschreibung_: Die Arbeit ist frei von Rechtschreibungs-, Zeichensetzungs- und Grammatikfehlern.

- *Formatierung, Typografie*: Die Formatierung der Arbeit ist korrekt und aus typographischer Sicht einwandfrei.
  _Wenn Sie dieses Template korrekt verwenden, sollte dieser Punkt automatisch durch die Verwendung von Typst erledigt sein._

  - _Korrekte Typografie_: Schriftarten werden korrekt verwendet (nicht mehr als 2 Fonts), der Zeilenabstand ist passend, die Ränder sind ausreichend, der Satz ist korrekt.
  - _Satz von Abbildungen, Tabellen etc._: Abbildungen sind in der richtigen Auflösung dargestellt, die Tabellen sind korrekt gesetzt, mathematische Formeln und Symbole sind sauber dargestellt.

- *Abbildungen*: Abbildungen werden in ausreichendem Umfang zur Förderung des Verständnisses eingesetzt.
  Sie werden korrekt im Text referenziert und sind, wo immer möglich, in einer Standardnotation erstellt.

  - _Ausreichende Verwendung_: Komplizierte Sachverhalte werden durch Abbildungen verdeutlicht. Es werden genug Abbildungen eingesetzt, um die wichtigsten Sachverhalte zu erklären.
  - _Verständnisförderung_: Abbildungen dienen nicht als Schmuck, sondern um komplizierte Sachverhalte zu verdeutlichen
  - _Einbindung in den Text_: Der Text muss auch ohne Abbildungen verständlich sein, die Abbildungen helfen Sachverhalte aus dem Text besser darzustellen. Der Text referenziert die Abbildung korrekt.
  - _Standardnotation, Legende_: Die Abbildungen verwenden Standard-Notationen wie UML, FMC etc. Wo keine Standardnotation eingesetzt wird, ist eine Legende vorhanden, um die Bildelemente zu erläutern.

- *Zitate*: Quellen werden konsistent nach einer gängigen Zitierweise zitiert und sind vollständig im Literaturverzeichnis angegeben.

  - _Zitierweise_: Die Zitierweise in der gesamten Arbeit folgt einem einheitlichen Schema, #zb IEEE, DIN, Chicago.
  - _Vollständigkeit_: Alle Zitate sind als solche kenntlich gemacht und die Quelle wird vollständig angegeben, und Plagiate werden vermieden.

- *Schreibstil*: Lebendiger, wissenschaftlicher und verständlicher Schreibstil.

  - _Wissenschaftlichkeit_: Der Text ist im Präsenz geschrieben, es wird die dritte Person verwendet, Fachausdrücke werden korrekt verwendet, Fremdwörter und Amerikanismen werden richtig eingesetzt.
  - _Verständlichkeit_: Abschweifungen und Wiederholungen werden vermieden, statt dessen werden präzise und übersichtliche Sätze verwendet.
  - _Lebendigkeit_: Der Text der Arbeit zeichnet sich durch eine gute Wortwahl, Sprachbilder, einen angemessenen Satzbau und eine hohe Variabilität aus.

== Inhalt

- *Gliederung*: Die Gliederung ist vollständig, konsistent und sachlogisch mit angemessener Struktur und Tiefe.

  - _Konsistenz und Vollständigkeit_: Auf einer Ebene stehen keine Punkte alleine, die Gliederungspunkte orientieren sich an der Argumentationskette.
  - _Angemessene Tiefe_: Die Größe der einzelnen Unterpunkte ist vom Umfang her ähnlich. Es gibt keine Gliederungspunkte, die nur aus ein bis zwei Sätzen bestehen.

- *Grundlagen*: Es werden alle relevanten Grundlagen gelegt. Der State-of-the-art und der State-of-practice werden dargelegt.

  - _Umfang_: 1/3 des Hauptteils ist ein gutes Maß für eine ausreichende Darstellung der Grundlagen.
  - _Begriffe und Methoden_: Begriffe und Methoden sind definiert, und Literatur zu den Definitionen ist angegeben.
  - _State-of-the-art_: Der Stand des verfügbaren Wissens wird dargestellt, analysiert und kritisch beurteilt (state-of-the-art).
    Bei theoretischen Arbeiten kann ein eigenes Kapitel "verwandte Arbeiten" nötig sein, um den state-of-the-art darzustellen.
  - _State-of-practice_: Bei praktischen Arbeiten, die in der Industrie geschrieben werden, kann es nötig sein, auch das Vorgehen im Unternehmen zu erläutern.

- *Methodik/Lösung*: Die gewählte Methodik bzw. Lösung ist für das Problem adäquat.

  - _Anforderungen an die Lösung_: Die von der Lösung zu erfüllenden Anforderungen werden dargestellt. Wo nötig wird dies auf Grundlage eines sauberen Requirements-Engineerings durchgeführt.
  - _Erläuterung des Lösungsansatzes_: Der gewählte Lösungsansatz wird ausführlich erläutert und verständlich dargestellt.
  - _Eignung zur Lösung der Aufgabe_: Die gewählte Lösung ist geeignet, um das beschriebene Problem zu lösen.
  - _Hypothesen_: Es sind ggf. Hypothesen gebildet worden; diese sind erläutert, und es sind Kriterien identifiziert worden, mit deren Hilfe man die Hypothesen falsifizieren kann.
  - _Alternativen_: Es werden Alternativen zur vorgeschlagenen Lösung diskutiert. Die eigene Lösung wird nicht als einzige mögliche dargestellt, sondern es werden auch andere mögliche Lösungen vorgestellt und bewertet.
  - _Begründung_: Alternativen und Kriterien für die Auswahl dieser Lösung werden dargestellt.
  - _Vorteile der Lösung_: Es wird dargestellt, wieso die entwickelte Lösung vorteilhafter ist als die bisherigen Ansätze. Diese Darstellung erfolgt auf Basis des Lösungsansatzes.
    Eine konkrete Validierung der Implementierung erfolgt ggf. in späteren Kapiteln.

- *Logik der Argumentationskette*: Die Argumentation ist logisch und nachvollziehbar. Sie ist frei von logischen Fehlschlüssen.

- *Implementierung*: Wenn eine Implementierung der Lösung erfolgt, so wird die Implementierung beschrieben.
  Die Darstellung der Implementierung kann knapp ausfallen. Wichtig ist der Lösungsansatz, nicht die konkrete Umsetzung.

- *Validierung*: Die vorgeschlagene Lösung wird ggf. empirisch verprobt.

  - _Vorgehensweise_: Die Vorgehensweise zur Validierung der Lösung / Hypothesen ist beschrieben und geeignet, relevante Aspekte der Lösung zu überprüfen.
  - _Empirische Analyse_: Die Erfassungsmethode wird dargestellt und die Daten werden nach den Grundsätzen ordnungsgemäßer Laborpraxis gesammelt und statistisch korrekt ausgewertet.
  - _Verprobung_: Die Lösung wird an einem praktischen Beispiel verprobt, und es werden wissenschaftlich korrekte Schlüsse aus der Anwendung gezogen.
  - _Zielerreichung_: Funktioniert die gewählte Lösung nach der Implementierung? Wie weit wurde das Ziel erreicht? Falls nicht, gibt es nachvollziehbare Gründe dafür und wurden diese dargestellt?

- *Diskussion*: Die Lösung und ihre Validierung wird kritisch und im Kontext möglicher Alternativen diskutiert und bewertet.

  - _Kritische Reflexion_: Grenzen und Schwächen der eigenen Ergebnisse werden beleuchtet.
  - _Ableitung von Konsequenzen_: Die Konsequenzen aus den Ergebnissen für die Wissenschaft und Praxis sind beschrieben.

- *Quellenarbeit*: Es werden hochwertige Quellen in ausreichendem Umfang genutzt und kritisch hinterfragt. Eventuell vorhandene Quellen aus dem Unternehmen werden ebenfalls berücksichtigt.

  - _Umfang_: Der Umfang an Quellen richtet sich stark nach Thema und Art der Arbeit. Bei einer Bachelorarbeit sind mindestens 20–30 Quellen üblich, bei einer Masterarbeit deutlich mehr.
  - _Wissenschaftliche Qualität_: Nicht zitierfähig sind Internet-Quellen, Wikipedia-Einträge sowie andere Bachelor- oder Masterarbeiten (sofern nicht veröffentlicht).
    Das ausschließliche Zitieren von Lehrbüchern ist problematisch. Aktuelle wissenschaftliche Artikel und Werke sollten in den Quellen auftauchen.
  - _Quellen "aus der Praxis"_: Wenn es im Unternehmen spezielle Quellen und Informationen gibt, so werden diese berücksichtigt, #zb firmen- oder branchenspezifischer Informationen.
  - _Kritische Würdigung_: Quellen und Zitate werden kritisch hinterfragt und nicht einfach unreflektiert übernommen. Es gibt eine kritische Distanz bei der Quellenauswahl und Quellenauswertung.

- *Fazit*: Es wird eine Zusammenfassung der Arbeit sowie Ausblick auf weitere mögliche Arbeiten im Themenfeld gegeben, etwa die Lösung ausstehender Probleme oder die Erfüllung zusätzlicher Anforderungen.

- *Umfang der Arbeit*: Richtgrößen: Bachelorarbeiten: 50–80 Seiten, Masterarbeiten: 60–100 Seiten, jeweils ohne Verzeichnisse und Anhang.

== Vor der Abgabe

- _Korrektur_: Haben Sie einen Dritten die Arbeit lesen lassen und alle gefundenen Rechtschreib- und Zeichensetzungsfehler behoben?
- _Literaturverzeichnis_: Sind im Literaturverzeichnis irrelevante Informationen entfernt? Beispielsweise bei Büchern unnötige Informationen über die Herkunft bei Google-Books oder bei Papern doppelte Angaben der DOI?
- *Abgabe auf Papier*

  - _Template passend eingestellt_: Haben Sie in der Datei `docinfo.tex` eingestellt, dass Sie auf Papier abgeben wollen?
  - _Doppel- oder einseitiger Druck_: Entspricht die Einstellung des Templates dem Druck, #dh ist das Template für doppelseitigen Druck eingestellt, wenn doppelseitig gedruckt werden soll und umgekehrt?
  - _Umschläge_: Sind die Umschläge vorhanden, um die Arbeit später zu binden? Die Umschläge können in der Hausdruckerei der Technischen Hochschule erworben werden.
  - _Copyshop_: Wissen Sie, wo Sie die Arbeit drucken werden? Die Hausdruckerei kann Ihre Arbeit nicht drucken.
  - _Exemplare_: Haben Sie geklärt, ob der Zweitkorrektor auch ein gedrucktes Exemplar möchte?

- *Digitale Abgabe*

  - _Zustimmung des Betreuers/der Betreuerin_: Haben Sie mit Ihrer Betreuerin bzw. Ihrem Betreuer abgeklärt, dass Sie digital abgeben dürfen?
  - _Template passend eingestellt_: Haben Sie in der Datei `docinfo.tex` eingestellt, dass Sie digital abgeben wollen?
  - _Unterschrift_: Haben Sie Ihre Unterschrift eingescannt und unter dem Namen `unterschrift.png` im Hauptverzeichnis abgelegt?
