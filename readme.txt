# Vorlage für Abschlussarbeiten mit LaTeX

Diese Vorlage ist für Abschlussarbeiten mit LaTeX an der Hochschule Mannheim gedacht. Sie erhebt keinen Anspruch darauf, den Wünschen aller Professoren zu entsprechen. Klären Sie daher immer im Voraus mit Ihrem Betreuer (und auch Zweitkorrektor), ob die Vorlage seinen Vorstellungen entspricht.

Diese Vorlage wurde entwickelt von [Prof. Thomas Smits](mailto:t.smits@hs-mannheim.de).

## Werkzeuge, Dateiformat

Zum Erzeugen der fertigen Arbeit dienen die Skripte create und clean. Die .cmd-Version ist für Windows, die .sh für Unix/Linux. Sie können auch eine integrierte Entwicklungsumgebung verwenden. Hierbei haben Sich folgende bewährt:

  * [TeXnicenter](http://www.texniccenter.org/) für Windows
  * [Texmaker](http://www.xm1math.net/texmaker/) für Windows, MacOS und Linux
 
Ausserdem müssen sie LaTeX auf Ihrem Rechner installieren. Bei Linux erfolgt dies einfach über den Paketmanager der verwendeten Distribution. Für Windows und MacOS empfehlen sich:

  * [MikTeX](http://miktex.org/) für Windows
  * [MacTeX](http://tug.org/mactex/) für MacOS

Für die Verwaltung der Literaturliste wird das BibTeX-Format verwendet (Datei literatur.bib). Obwohl Sie diese Datei auch von Hand bearbeiten können, empfiehlt es sich, hierfür ein Werkzeug einzusetzen. Bewährt haben sich:

  * [JabRef](http://jabref.sourceforge.net/) für Windows, MacOS und Linux
  * [BibDesk](http://bibdesk.sourceforge.net/) für MacOS
  
Achten Sie darauf, die Dokumente im UTF-8-Format abzulegen. Nur so ist eine plattformunabhängige Verwendung gewährleistet. Die Vorlagen hier sind ebenfalls im UTF-8-Format.

## Aufbau der Vorlage

Die Vorlage enthält eine Reihe von Dateien, die Sie teilweise nach Ihren Bedürfnissen anpassen müssen bzw. mit Ihren Inhalten füllen.

Anpassen müssen Sie die folgenden Dateien

  * thesis.tex - Hauptdokument. Hier müssen Sie weitere Kapitel inkludieren.
  * docinfo.tex - Bibliografische Informationen zur Arbeit, müssen Sie mit Ihren Daten füllen
  * abkuerzungen.tex - Liste der in der Arbeit verwendeten Abkürzungen
  * kapitel1.tex - Beispiel für ein Kapitel
  * kapitel2.tex - Weiteres Beispiel für ein Kapitel
  * literatur.bib - Literaturdatenbank im BibTeX-Format

Weitere Kapitel können hinzugefügt werden und dann vom Hauptdokument thesis.tex inkludiert.
  
Normalerweise nicht verändern müssen Sie
  
  * preambel.tex - Einstellungen zum Dokument.
  * titelblatt.tex - Titelblatt der Arbeit
  
Neben den Dateien gibt es noch zwei Ordner

  * bilder - Ablageort für die verwendeten Bilder
  * src - Ablageort für die verwendeten Quelltexte


## Latex-Projekt unter TexnicCenter einrichten

Ab der Version 2 von TexnicCenter wird das UTF-8-Format richtig unterstützt.

  * Öffnen Sie die Datei thesis.tex mit TexnicCenter
  * Projekt / Erzeugen mit aktueller Datei als Hauptdatei
  * "verwendet BibTex" ankreuzen
  * "verwendet Makeindex" ankreuzen
  * Sprachinformation für die Rechtschreibkorrektur setzen

Sie können dann beispielsweise bequem auf die Dokumentstruktur, Dateien und
Literaturreferenzen zugreifen.
