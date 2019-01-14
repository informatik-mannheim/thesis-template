# Vorlage für Abschlussarbeiten mit LaTeX

Diese Vorlage ist für Abschlussarbeiten mit LaTeX an der Hochschule Mannheim gedacht. Sie erhebt keinen Anspruch darauf, den Wünschen aller Professoren zu entsprechen. Klären Sie daher immer im Voraus mit Ihrem Betreuer (und auch Zweitkorrektor), ob die Vorlage seinen Vorstellungen entspricht.

Wenn Sie Probleme haben oder Fehler entdecken, öffnen Sie ein [Issue](https://github.com/informatik-mannheim/thesis-template/issues). Lesen Sie aber vorher diese Anleitung bis zum Ende, denn vielleicht klärt sich Ihre Frage von selbst.

Verbesserungen können Sie jederzeit als GitHub Pull-Request an uns senden.

Diese Vorlage wurde entwickelt von [Prof. Thomas Smits](http://www.smits-net.de).

## Werkzeuge, Dateiformat

### Lokale Entwicklungsumgebungen

Zum Erzeugen der fertigen Arbeit dienen die Skripte `create` und `clean`. Die .cmd-Version ist für Windows, die .sh für Unix/Linux.

Zusätzlich liegt im Verzeichnis `/tex` noch ein Makefile mit dem man die Quellen mit Hilfe von `make` übersetzen kann. Der Vorteil hiervon ist, dass `make` erkennt, ob sich Inhalte geändert haben und nur dann die Arbeit neu übersetzt.

Sie können auch eine integrierte Entwicklungsumgebung verwenden. Hierbei haben Sich folgende bewährt:

  * [TeXnicenter](http://www.texniccenter.org/) für Windows (siehe unten)
  * [Texmaker](http://www.xm1math.net/texmaker/) für Windows, MacOS und Linux

Ausserdem müssen sie LaTeX auf Ihrem Rechner installieren. Bei Linux erfolgt dies einfach über den Paketmanager der verwendeten Distribution. Für Windows und MacOS empfehlen sich:

  * [MikTeX](http://miktex.org/) für Windows
  * [MacTeX](http://tug.org/mactex/) für MacOS

Für die Verwaltung der Literaturliste wird das BibTeX-Format verwendet (Datei `literatur.bib`). Obwohl Sie diese Datei auch von Hand bearbeiten können, empfiehlt es sich, hierfür ein Werkzeug einzusetzen. Bewährt haben sich:

  * [JabRef](http://jabref.sourceforge.net/) für Windows, MacOS und Linux
  * [BibDesk](http://bibdesk.sourceforge.net/) für MacOS

Achten Sie darauf, die Dokumente im UTF-8-Format abzulegen. Nur so ist eine plattformunabhängige Verwendung gewährleistet. Die Vorlagen hier sind ebenfalls im UTF-8-Format.

### Cloud-Dienste

Diese Vorlage wurde bereits von Studierenden erfolgreich bei Cloud-Diensten eingesetzt, mit denen man LaTeX-Dokumente schreiben, kompilieren und verwalten kann. Positive Erfahrungsberichte liegen bisher mit [Overleaf](https://www.overleaf.com) vor. Eine Anleitung zu Overleaf finden Sie weiter unten.

## Aufbau der Vorlage

Die Vorlage enthält eine Reihe von Dateien, die Sie teilweise nach Ihren Bedürfnissen anpassen müssen bzw. mit Ihren Inhalten füllen.

Anpassen müssen Sie die folgenden Dateien

  * `thesis.tex` - Hauptdokument. Hier müssen Sie weitere Kapitel aus dem Ordner `kapitel` inkludieren.
  * `docinfo.tex` - Bibliografische Informationen zur Arbeit, müssen Sie mit Ihren Daten füllen
  * `kapitel/abkuerzungen.tex` - Liste der in der Arbeit verwendeten Abkürzungen
  * `kapitel/kapitel1.tex` - Beispiel für ein Kapitel
  * `kapitel/kapitel2.tex` - Weiteres Beispiel für ein Kapitel
  * `kapitel/kapitel3.tex` - Weiteres Beispiel für ein Kapitel
  * `kapitel/anhang-a.tex` - Beispiel für einen Anhang
  * `kapitel/anhang-b.tex` - Beispiel für einen Anhang
  * `literatur.bib` - Literaturdatenbank im BibTeX-Format

Weitere Kapitel können hinzugefügt werden und dann vom Hauptdokument `thesis.tex` inkludiert.

Normalerweise nicht verändern müssen Sie

  * `preambel.tex` - Einstellungen zum Dokument.
  * `titelblatt.tex` - Titelblatt der Arbeit

Die Vorlage ist für doppelseitigen Druck optimiert. Wenn Sie die Arbeit einseitig ausdrucken, sieht das Ergebnis seltsam aus, weil es unnötig viele leere Seiten enthält und die Seitenzahlen zwischen rechtem und linkem Rand springen. Für **einseitigen Druck** müssen sie die Datei `preambel.tex` ändern und `twoside=on` in `twoside=off` ändern.

Es gibt drei Ordner

  * `/kapitel` - Ablageort für die einzelnen Kapitel
  * `/bilder` - Ablageort für die verwendeten Bilder
  * `/src` - Ablageort für die verwendeten Quelltexte von Programmen, die in der Arbeit gezeigt werden sollen.

Die Datei `thesis-overleaf.zip` dient dem einfachen Import in [Overleaf](https://www.overleaf.com) - siehe nächstes Kapitel.

## LaTeX-Projekt unter Overleaf einrichten

 * Laden Sie die ZIP-Version des Projektes [hier](https://github.com/informatik-mannheim/thesis-template/raw/master/latex/thesis-overleaf.zip) herunter.
 * Melden Sie sich bei [Overleaf](https://www.overleaf.com) an und loggen Sie sich ein.
 * Gehen Sie auf "New Project" und wählen Sie "Upload Project"
 * Laden Sie die ZIP-Datei hoch.
 * Sie werden jetzt Kompile-Fehler bekommen, aber keine Panik, dies liegt daran, dass Overleaf nicht weiß, welches das Hauptdokument ist
 * Wählen Sie das Overleaf Logo oben links, um das Einstellungsmenue aufzurufen und stellen Sie die Option "Main document" auf `thesis.tex`
 * Wählen Sie nun in der Dateiliste ebenfalls `thesis.tex`
 * Drücken Sie auf "Recompile" - das Projekt sollte jetzt bauen


## LaTeX-Projekt unter TeXnicCenter einrichten

Ab der Version 2 von TeXnicCenter wird das UTF-8-Format richtig unterstützt.

  * Öffnen Sie die Datei `thesis.tex` mit TeXnicCenter
  * Wählen Sie in Projekt "Erzeugen mit aktueller Datei als Hauptdatei"
    * "verwendet BibTex" ankreuzen
    * "verwendet Makeindex" ankreuzen
    * Sprachinformation für die Rechtschreibkorrektur setzen
  * Unter "Ausgabe" den Punkt "Ausgabeprofil definieren" wählen
    * LaTeX => PDF auswählen
    * "Pfade des BibTeX-Compilers" von `...\bibtex.exe` auf `...\biber.exe` ändern
  * Unter "Ausgabe" den Punkt "Aktive Ausgabeprofil wählen" anklicken
    * LaTeX => PDF auswählen

Damit alle Referenzen und Literaturangaben im Dokument korrekt sind, müssen Sie es bis zu drei Mal erzeugen.
