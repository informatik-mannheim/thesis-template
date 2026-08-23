# Typst-Template für Abschlussarbeiten

Dieses Verzeichnis enthält ein Typst-Template für Abschlussarbeiten. Typst ist ein modernes, von Markdown inspiriertes Satzsystem und zeichnet sich insbesondere durch schnelle Kompilierzeiten sowie eine kompakte, Markdown-ähnliche Syntax aus.

## Struktur des Templates

Die grundlegende Idee ist, dass der Inhalt der Thesis von der Implementierung des Templates getrennt ist. Das Template befindet sich im Verzeichnis [thm](thm) und ist als Library konzipiert. Diese Library exportiert genau eine Funktion namens `thm-thesis`. Dieser Funktion wird der Inhalt der Thesis als Parameter übergeben (siehe [thesis.typ](thesis.typ)). Das Template kümmert sich anschließend darum, dass der Inhalt korrekt formatiert wird.

Alles außerhalb des thm-Verzeichnisses darf gerne beliebig strukturiert werden. Die Beispiel-Thesis orientiert sich dabei stark an der Struktur der LaTeX-Vorlage.

## Nützliche Hinweise

Typst ist noch relativ jung. Aus diesem Grund sind LLMs oft nur eingeschränkt hilfreich und halluzinieren nicht selten Syntax, die es in Typst gar nicht gibt. Daher empfiehlt es sich, direkt in der [Typst-Dokumentation](https://typst.app/docs/) nachzuschlagen.

