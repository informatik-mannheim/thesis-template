Folgende Anpassungen sind u.a. nötig, um die TeX-Version in Lyx zu überführen:

tex/titelblatt.tex -> lyx/util/titelblatt.tex
Hier muss der Pfad zum HSMA-Logo angepasst werden.
Der Abschnitt abstract am Ende wird entfernt, da dies in Lyx realisiert ist.

tex/preambel.tex -> lyx/util/preambel.tex
Anschließend Documentclass-Abschnitt entfernen.
\documentclass[open=right, % Kapitel darf nur auf rechten Seite beginnen
    paper=A4,               % DIN-A4-Papier
    a4paper,                % DIN-A4-Papier
    12pt,                   % Schriftgöße
    headings=small,         % Kleine Überschriften
    headsepline=true,       % Trennlinie am Kopf der Seite
    footsepline=false,      % Keine Trennlinie am Fuß der Seite
    bibliography=totoc,     % Literaturverzeichnis in das Inhaltsverzeichnis aufnehmen
    twoside=on,             % Doppelseitiger Druck - auf off stellen für einseitig
    DIV=7,                  % Verhältnis der Ränder zum bedruckten Bereich
    chapterprefix=true,     % Kapitel x vor dem Kapitelnamen
    cleardoublepage=plain]{scrbook}
    
Alle Einträge mit utf-8 usw. müssen entfernt werden, das dies von LyX gemanaged wird. 

