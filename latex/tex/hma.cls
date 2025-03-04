\ProvidesClass{HMA}[2023/09/07 v 0.3 Thesis Template]

\RequirePackage{etoolbox}
\PassOptionsToPackage{internalonly}{scrbase}
\def\@clearglobaloption#1{%
	\def\@tempa{#1}%
	\def\@tempb{\@gobble}%
	\@for\next:=\@classoptionslist\do
	{\ifx\next\@tempa
		\message{Cleared  option \next\space from global list}%
		\else
		\edef\@tempb{\@tempb,\next}%
		\fi}%
	\let\@classoptionslist\@tempb
	\expandafter\ifx\@tempb\@gobble
	\let\@classoptionslist\@empty
	\fi}


\newif\ifpapier
\newif\ifdigital
\newif\ifen
\newif\ifcclicense
\newif\ifhslicense
\newif\ifstudlicense
\newif\ifsperrvermerk
\newif\ifgender
\newif\ifsourcecode
\newif\ifsymbols
\newif\ifglossar
\newif\iftc



%\DeclareOption{papier}{\papiertrue\digitalfalse\@clearglobaloption{papier}}
\DeclareOption{de}{\PassOptionsToPackage{english,main=ngerman}{babel}\enfalse} % Deutsche Sprachunterstützung
\DeclareOption{en}{\PassOptionsToPackage{english}{babel}\entrue} % Englische Sprachunterstützung
\DeclareOption{papier}{\papiertrue\digitalfalse}
\DeclareOption{digital}{\digitaltrue\papierfalse}
%Veröffentlichung und Sperrvermerk
\DeclareOption{opensource}{\cclicensetrue\hslicensetrue\sperrvermerkfalse}
\DeclareOption{hs}{\cclicensefalse\hslicensetrue\sperrvermerkfalse}
\DeclareOption{stud}{\cclicensefalse\hslicensefalse\sperrvermerkfalse}
\DeclareOption{vertraulich}{\cclicensefalse\hslicensefalse\sperrvermerktrue}

%Genderhinweis
\DeclareOption{gender}{\gendertrue}
\DeclareOption{nogender}{\genderfalse}
%Listingsverzeichnis ausgeben
\DeclareOption{sourcecode}{\sourcecodetrue}
\DeclareOption{nosourcecode}{\sourcecodefalse}
%Symbolverzeichnis ausgeben
\DeclareOption{symbole}{\symbolstrue}
\DeclareOption{nosymbole}{\symbolsfalse}
%Glossar ausgeben
\DeclareOption{glossar}{\glossartrue}
\DeclareOption{noglossar}{\glossarfalse}
%Track Changes
\DeclareOption{tc}{\tctrue}
\DeclareOption{notc}{\tcfalse}


%\newtoggle{papier}

\ExecuteOptions{en, papier, digital, publizieren, sperrvermerk, gender}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrbook}}

%% Process given options
\ProcessOptions\relax


\LoadClass[%
	open=right,  			% Kapitel darf nur auf rechten Seite beginnen
	a4paper,                % DIN-A4-Papier
	fontsize=12pt,          % Schriftgöße
	headings=small,         % Kleine Überschriften
	headsepline=true,       % Trennlinie am Kopf der Seite
	footsepline=false,      % Keine Trennlinie am Fuß der Seite
	bibliography=totoc,     % Literaturverzeichnis in das Inhaltsverzeichnis aufnehmen
	DIV=7,                  % Verhältnis der Ränder zum bedruckten Bereich
	chapterprefix=true,     % Kapitel x vor dem Kapitelnamen
	cleardoublepage=plain,
	numbers=noenddot, 		% Keine Endpunkte bei der Überschriftennummerierung
	listof=totoc			%Einträge ins Inhaltsverzeichnis aufnehmen
]{scrbook}

\RequirePackage{blindtext}
\RequirePackage{xparse}



%% Diese Option MUSS!! vor Geometry stehen, da sonst das Layout der Seitenränder durch KOMAOptions überschrieben wird!
%%Abgabe in Papier oder digital
\ifpapier
	\newcommand{\hsmafenster}{4mm}
	\KOMAoptions{twoside=true}

\else%
	\newcommand{\hsmafenster}{0mm}
	\KOMAoptions{twoside=false}
\fi%



\RequirePackage[bottom=40mm,left=30mm,right=30mm,top=30mm]{geometry} % Ränder ändern
\RequirePackage{babel}
\RequirePackage[hang,font={sf,footnotesize},labelfont={footnotesize,bf}]{caption} % Beschriftungen

% Schriftarten für PDFLaTeX und LuaTex
\RequirePackage{iftex}
\ifpdftex% Unterstützung für PDFTeX
	\RequirePackage{tgtermes}			% Tex Gyre Termes (qtm (Times) als Font für Fließtext)
	\RequirePackage[utf8]{inputenc}		% Dateien in UTF-8 benutzen
	\RequirePackage[T1]{fontenc}		% Zeichenkodierung



	\RequirePackage{morewrites}			% Verhindert Fehlermeldung: No more writes
	\RequirePackage[scaled]{helvet}     % Schrift Helvetia laden
	\RequirePackage{amssymb}            % Mathematische Symbole

	%% Graphiken als pdf einfügen
	\pdfoptionpdfminorversion=8

\else\ifluatex
	%LuaTex erwartet standardmäßig utf8
	\RequirePackage{fontspec} %Font Unterstützung für LuaTex, welche das Laden von  OpenType fonts erlaubt. Fonts müssen im OS verfügbar sein.
		\defaultfontfeatures{Ligatures=TeX}
		\RequirePackage{unicode-math}
		\setromanfont[
			Extension=.otf,
			UprightFont={*-Regular},
			BoldFont={*-Bold},
			ItalicFont={*-Italic},
			BoldItalicFont={*-BoldItalic}
		]{texgyretermes}

		\setsansfont[
			Scale=MatchLowercase,% or MatchUppercase
			Extension=.otf,
			UprightFont=*-regular,
			ItalicFont=*-italic,
			BoldFont=*-bold,
			BoldItalicFont=*-bolditalic,
		]{texgyreheros}

\fi\fi

\RequirePackage[headsepline]{scrlayer-scrpage}

% Einstellungen für Schriftarten
\setkomafont{pagehead}{\normalfont\sffamily}
\setkomafont{pagenumber}{\normalfont\sffamily}
\setkomafont{paragraph}{\sffamily\bfseries\small}
\setkomafont{subsubsection}{\sffamily\itshape\bfseries\small}
\addtokomafont{footnote}{\footnotesize}
\setkomafont{chapter}{\sffamily\bfseries\LARGE}

% Wichtige Abstände
\setlength\parindent{0pt}
\clubpenalty = 10000         % Keine "Schusterjungen"
\widowpenalty = 10000        % Keine "Hurenkinder"
\displaywidowpenalty = 10000 % Keine "Hurenkinder"
% Siehe: https://de.wikipedia.org/wiki/Hurenkind_und_Schusterjunge


\RequirePackage{scrhack}              				% tocbasic Warnung entfernen

%Fortlaufende Nummerierung der Fußzeile d.h. wenn die Fußnoten nicht bei jedem Kapitel wieder bei 1 beginnen sollen.
\counterwithout{footnote}{chapter}


\RequirePackage[useregional=numeric]{datetime2}		% Datumsformat einstellen
\RequirePackage{ifthen}								% Logische Bedingungen mit ifthenelse
\RequirePackage{calc}								% Berechnung von Positionen
\RequirePackage{setspace}							% Abstände korrigieren
\RequirePackage{graphicx}							% Bilder einbinden
\RequirePackage{rotating}							% Seiten drehen
\RequirePackage[inline]{enumitem}					% eigene Aufzählungen verwenden




\RequirePackage[dvipsnames,svgnames,hyperref,table]{xcolor}    % Unterstützung für Farben

% Farben definieren
\definecolor{HMA-linkblue}{RGB}{0, 0, 100}
\definecolor{HMA-linkblack}{RGB}{0, 0, 0}
\definecolor{HMA-comment}{RGB}{63, 127, 95}
\definecolor{HMA-darkgreen}{RGB}{14, 144, 102}
\definecolor{HMA-darkblue}{RGB}{0,0,168}
\definecolor{HMA-darkred}{RGB}{128,0,0}
\definecolor{HMA-javadoccomment}{RGB}{0,0,240}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}


\RequirePackage{amsmath}              % Mathematische Formeln
\RequirePackage{amsfonts}             % Mathematische Zeichensätze
\RequirePackage{siunitx}			  % Darstellung von Einheiten

\RequirePackage[inline]{enumitem} 	  % Eigene Listen definieren können und diese auch innerhalb des Textes nutzen können

\RequirePackage{tikz}
\usetikzlibrary{intersections,decorations.text}


\RequirePackage{url}


\expandafter\def\expandafter\UrlBreaks\expandafter{\UrlBreaks%  save the current one
	\do\a\do\b\do\c\do\d\do\e\do\f\do\g\do\h\do\i\do\j%
	\do\k\do\l\do\m\do\n\do\o\do\p\do\q\do\r\do\s\do\t%
	\do\u\do\v\do\w\do\x\do\y\do\z\do\A\do\B\do\C\do\D%
	\do\E\do\F\do\G\do\H\do\I\do\J\do\K\do\L\do\M\do\N%
	\do\O\do\P\do\Q\do\R\do\S\do\T\do\U\do\V\do\W\do\X%
	\do\Y\do\Z\do\/\do-}


\RequirePackage[backend=biber,
sorting = none,
%sortlocale=\hsmasortlocale,     % Sortierung der Einträge für Deutsch
autocite=inline,                % regelt Aussehen für \autocite
%      inline: Zitat in Klammern (\parancite)
%      footnote: Zitat in Fußnoten (\footcite)
%      plain: Zitat direkt ohne Klammern (\cite)
style=numeric,         		      % Legt den Stil für die Angabe im Literaturverzeichnis fest
%      numeric: Quellen mit Zahlen [1]
%      ieee: Quellen mit Zahlen [1], nach IEEE-Regeln
%      alphabetic: Quellen als Kürzel und Jahr [Ein05]
%      authoryear: Quellen Author und Jahr [Einstein (1905)]
citestyle=numeric-comp,         % Legt den Stil für die Zitate im Text fest
%      numeric: Zitate mit Zahlen [1]
%      numeric-comp: Kompakte Variante von numeric. [1, 2, 3] wird zu [1-3]
%      ieee: Zitate mit Zahlen [1], nach IEEE-Regeln
%      alphabetic: Zitate als Kürzel und Jahr [Ein05]
%      authoryear: Zitate Author und Jahr [Einstein (1905)]
hyperref=true,                  % Hyperlinks für Zitate
maxbibnames=999,                % Maximale Anzahl der Autoren-Namen im Literaturverzeichnis
maxcitenames=2,                 % Maximale Anzahl von Namen in einem Zitat
mincitenames=1                  % Minimale Anzahl von Namen in einem Zitat
]{biblatex}      % Literaturverwaltung mit BibLaTeX


% Trennung von URLs im Literaturverzeichnis (große Werte [> 10000] verhindern die Trennung)
\defcounter{biburlnumpenalty}{10} % Strafe für Trennung in URL nach Zahl
\defcounter{biburlucpenalty}{500} % Strafe für Trennung in URL nach Großbuchstaben
\defcounter{biburllcpenalty}{500} % Strafe für Trennung in URL nach Kleinbuchstaben



% Index erzeugen
\RequirePackage{imakeidx}%

\makeindex[%
options={-g -s hmaindex.ist},%
intoc=true]%



\RequirePackage{array}
\RequirePackage{tabularx}             % Spezielle Tabellen
\RequirePackage{longtable}            % Tabellen, die mehr als eine Seite umfassen
\RequirePackage{booktabs}			  % Korrekter Tabellensatz


% Tabellenzellen mit mehreren Zeilen
\newcolumntype{L}{>{\raggedright\arraybackslash}X}
\newcolumntype{s}{>{\hsize=.3\hsize}l}
\newcolumntype{F}{>{\hsize=\dimexpr2\hsize+2\tabcolsep+\arrayrulewidth\relax}X}



\RequirePackage{harveyballs}          % Harveyballs




\RequirePackage[acronym,symbols, toc]{glossaries}

\renewcommand*{\glspostdescription}{}

\renewcommand{\glsnamefont}[1]{\textbf{#1}} % Fette Schrift für Abkürzungen
\setlength\LTleft{0pt} 						%Linksbündige Formatierung
\setlength\LTright{0pt}
\setlength\glsdescwidth{0.8\hsize}

\newglossary[slg]{symbolslist}{syi}{syg}{Symbolslist} % Erstellen  Symbolverzeichnis
\glsaddkey{unit}{\glsentrytext{\glslabel}}{\glsentryunit}{\GLsentryunit}{\glsunit}{\Glsunit}{\GLSunit}

\newglossarystyle{symbunitlong}{%
	\setglossarystyle{long3col}% base this style on the list style
	\renewenvironment{theglossary}{% Change the table type --> 3 columns
		\begin{longtable}{lp{0.6\glsdescwidth}>{\centering\arraybackslash}p{2cm}}}%
		{\end{longtable}}%
	%
	\renewcommand*{\glossaryheader}{%  Change the table header
		\bfseries \hsmasymbsign & \bfseries \hsmasymbdescription & \bfseries \hsmasymbunit \\
		\hline
		\endhead}
	\renewcommand*{\glossentry}[2]{%  Change the displayed items
		\glstarget{##1}{\glossentryname{##1}} %
		& \glossentrydesc{##1}% Description
		& \glsunit{##1}  \tabularnewline
	}
}

\makeglossaries



\RequirePackage{listings}             % Quelltexte
%%% Das Paket listings kann keine Multibyte-codierten Zeichen verarbeiten. -> LuaTex :-)
% Einstellungen für Quelltexte


% Richtige Titel für das Quellcodeverzeichnis
\renewcommand\lstlistingname{\hsmalistingcaption}
\renewcommand\lstlistlistingname{\hsmalistings}

\lstset{
	backgroundcolor=\color{backcolour},
	xleftmargin=0.4cm,
	basicstyle=\footnotesize\ttfamily,
	keywordstyle=\color{HMA-darkgreen},
	identifierstyle=\color{HMA-darkblue},
	commentstyle=\color{HMA-comment},
	stringstyle=\color{HMA-darkred},
	tabsize=2,
	lineskip={2pt},
	columns=flexible,
	inputencoding=utf8,
	captionpos=b,
	breakautoindent=true,
	breakindent=2em,
	breaklines=true,
	prebreak=,
	postbreak=,
	numbers=left,
	numberstyle=\tiny,
	numbersep=5pt,
	showspaces=false,      % Keine Leerzeichensymbole
	showtabs=false,        % Keine Tabsymbole
	showstringspaces=false,% Leerzeichen in Strings
	morecomment=[s][\color{HMA-javadoccomment}]{/**}{*/},
	literate={Ö}{{\"O}}1 {Ä}{{\"A}}1 {Ü}{{\"U}}1 {ß}{{\ss}}2 {ü}{{\"u}}1 {ä}{{\"a}}1 {ö}{{\"o}}1
}

\iftc
	\RequirePackage[commandnameprefix=always,todonotes={textsize=tiny}]{changes}

	\definechangesauthor[name={Betreuer 1}, color=orange]{B1}
	\definechangesauthor[name={Betreuer 2}, color=blue]{B2}
	\definechangesauthor[name={Author}, color=green]{A}
\else
	\RequirePackage[commandnameprefix=always,todonotes={textsize=tiny}, final]{changes}

	\definechangesauthor[name={Betreuer 1}, color=orange]{B1}
	\definechangesauthor[name={Betreuer 2}, color=blue]{B2}
	\definechangesauthor[name={Author}, color=green]{A}
\fi

\RequirePackage{pdfpages}



% Datum auf Titelblatt
\makeatletter
\newcommand{\hsmajahr}{%
	\@dtm@year
}

\DTMsavedate{Abgabe}{\hsmaabgabedatum} %Umwandlung des Datums in DateTimeFormat
\newcommand{\hsmadatum}{\DTMusedate{Abgabe}}


% Abschlüsse
% *******************************************************************
\newcommand{\hsmabsc}{Bachelor of Science (B.Sc.)}
\newcommand{\hsmaba}{Bachelor of Arts (B.A.)}
\newcommand{\hsmamaster}{Master of Science (M.Sc.)}
\newcommand{\hsmamastera}{Master of Arts (M.A.)}
\newcommand{\hsmamasterba}{Master of Business Administration (MBA)}
\newcommand{\hsmakoerperschaften}{University of Applied Sciences Mannheim}
\newcommand{\hsmakoerperschaftde}{Technische Hochschule Mannheim}


%%Dokumentinformationen
\newcommand{\hsmaabstracttitlede}{Abstrakt}
\newcommand{\hsmaabstracttitleen}{Abstract}

\newcommand{\hsmaautorbib}{\hsmaautornname, \hsmaautorvname} % Autor Nachname, Vorname
\newcommand{\hsmaautor}{\hsmaautorvname \ \hsmaautornname} % Autor Vorname Nachname



%%Sprachdefinitionen
\ifen
	\newcommand{\hsmatyp}{\hsmatypen}%
	\newcommand{\hsmathesistype}{for the acquisition of the academic degree \hsmagrad}%
	\newcommand{\hsmakoerperschaft}{\hsmakoerperschaften}%
	\newcommand{\hsmastudiengangname}{Course of Studies: \hsmastudienganglang}%
	\newcommand{\hsmastudienganglang}{\hsmastudienganglangen}%
	\newcommand{\hsmatitel}{\hsmatitelen}%
	\newcommand{\hsmatutor}{Tutors}
	\newcommand{\hsmafakultaetlang}{\hsmafakultaetlangen}%
	\newcommand{\hsmalistoftables}{List of Tables}%
	\newcommand{\hsmalistoffigures}{List of Figures}%
	\newcommand{\hsmalistings}{Listings}%
	\newcommand{\hsmalistingcaption}{Source Code}% or Listing?
	\newcommand{\hsmaindex}{Index}%
	\newcommand{\hsmasymbsign}{Sign}
	\newcommand{\hsmasymbdescription}{Description}
	\newcommand{\hsmasymbunit}{Unit}
	\newcommand{\hsmaabbreviations}{List of Abbreviations}%
	\newcommand{\hsmalistofsymbols}{List of Symbols}
	\newcommand{\hsmaglossary}{Glossary}
	\newcommand{\hsmasnowcardanforderung}{Requirement}%
	\newcommand{\hsmasnowcardno}{\#}%
	\newcommand{\hsmasnowcardart}{Type}%
	\newcommand{\hsmasnowcardprio}{Prio}%
	\newcommand{\hsmasnowcardtitel}{Title}%
	\newcommand{\hsmasnowcardherkunft}{Origin}%
	\newcommand{\hsmasnowcardkonflikt}{Conflicts}%
	\newcommand{\hsmasnowcardbeschreibung}{Description}%
	\newcommand{\hsmasnowcardfitkriterium}{Fit Criterion}%
	\newcommand{\hsmasnowcardmaterial}{Supporting Material}%
	\newcommand{\hsmaqasanforderung}{QAS}%
	\newcommand{\hsmaqasno}{\#}%
	\newcommand{\hsmaqasart}{Type}%
	\newcommand{\hsmaqasprio}{Prio}%
	\newcommand{\hsmaqastitel}{Title}%
	\newcommand{\hsmaqasquelle}{Source}%
	\newcommand{\hsmaqasstimulus}{Stimulus}%
	\newcommand{\hsmaqasartefakt}{Artifact}%
	\newcommand{\hsmaqasumgebung}{Environment}%
	\newcommand{\hsmaqasantwort}{Response}%
	\newcommand{\hsmaqasmass}{Response Measure}%
\else%
	\newcommand{\hsmatyp}{\hsmatypde}%
	\newcommand{\hsmathesistype}{zur Erlangung des akademischen Grades \hsmagrad}%
	\newcommand{\hsmakoerperschaft}{\hsmakoerperschaftde}%
	\newcommand{\hsmastudiengangname}{Studiengang \hsmastudienganglangde}%
	\newcommand{\hsmastudienganglang}{\hsmastudienganglangde}%
	\newcommand{\hsmatitel}{\hsmatitelde}%
	\newcommand{\hsmatutor}{Betreuer}%
	\newcommand{\hsmafakultaetlang}{\hsmafakultaetlangde}%
	\newcommand{\hsmalistoftables}{Tabellenverzeichnis}%
	\newcommand{\hsmalistoffigures}{Abbildungsverzeichnis}%
	\newcommand{\hsmalistings}{Quellcodeverzeichnis}%
	\newcommand{\hsmalistofsymbols}{Symbolverzeichnis}
	\newcommand{\hsmaglossary}{Glossar}
	\newcommand{\hsmalistingcaption}{Quellcode}% oder Listing?
	\newcommand{\hsmasymbsign}{Symbol}
	\newcommand{\hsmasymbdescription}{Beschreibung}
	\newcommand{\hsmasymbunit}{Einheit}
	\newcommand{\hsmaindex}{Index}%
	\newcommand{\hsmaabbreviations}{Abkürzungsverzeichnis}%
	\newcommand{\hsmasnowcardanforderung}{Anforderung}%
	\newcommand{\hsmasnowcardno}{Nr}%
	\newcommand{\hsmasnowcardart}{Art}%
	\newcommand{\hsmasnowcardprio}{Prio}%
	\newcommand{\hsmasnowcardtitel}{Titel}%
	\newcommand{\hsmasnowcardherkunft}{Herkunft}%
	\newcommand{\hsmasnowcardkonflikt}{Konflikte}%
	\newcommand{\hsmasnowcardbeschreibung}{Beschreibung}%
	\newcommand{\hsmasnowcardfitkriterium}{Fit-Kriterium}%
	\newcommand{\hsmasnowcardmaterial}{Weiteres Material}%
	\newcommand{\hsmaqasanforderung}{QAS}%
	\newcommand{\hsmaqasno}{Nr}%
	\newcommand{\hsmaqasart}{Art}%
	\newcommand{\hsmaqasprio}{Prio}%
	\newcommand{\hsmaqastitel}{Titel}%
	\newcommand{\hsmaqasquelle}{Quelle}%
	\newcommand{\hsmaqasstimulus}{Stimulus}%
	\newcommand{\hsmaqasartefakt}{Artefakt}%
	\newcommand{\hsmaqasumgebung}{Umgebung}%
	\newcommand{\hsmaqasantwort}{Antwort}%
	\newcommand{\hsmaqasmass}{Maß für Antwort}%
\fi%


% Makros für typographisch korrekte Abkürzungen
\newcommand{\zb}[0]{z.\,B.}
\newcommand{\dahe}[0]{d.\,h.}
\newcommand{\ua}[0]{u.\,a.}


\ifen
	\RequirePackage[autostyle=true,english=american]{csquotes} % Englische Anführungszeichen
	\RequirePackage[english,breaklinks=true,pdfproducer={},pdfcreator={},plainpages=false,
	pdfpagelabels]{hyperref}       % Hyperlinks
	\newcommand{\hsmasortlocale}{en_US}                    % Sortierung der Literatur
\else
	\RequirePackage[autostyle=true,german=quotes]{csquotes}    % Deutsche Anführungszeichen
	\RequirePackage[breaklinks=true,pdfproducer={},pdfcreator={},plainpages=false,
	pdfpagelabels]{hyperref}        % Hyperlinks
	\newcommand{\hsmasortlocale}{de_DE}
\fi%





%Hyperref muss vor DocLicense geladen werden!
\newcommand{\hsmacc}{by-sa}
\RequirePackage[type={CC},modifier={\hsmacc},version={4.0}]{doclicense}


% Einstellungen für das Hyperlink-Paket
\hypersetup{
	colorlinks=true,      % Farbige links verwenden
	%    allcolors=linkblue,
	linktoc=all,          % Links im Inhaltsverzeichnis
	%Highlight Links in Dokument
	linkcolor=HMA-linkblue,  % Querverweise
	citecolor=HMA-linkblue,  % Literaturangaben
	filecolor=HMA-linkblue,  % Dateilinks
	urlcolor=HMA-linkblue    % URLs
}


\ExplSyntaxOn
\NewDocumentCommand{\printfilelist}{}
{
	\cleardoublepage
	\section*{Used ~ packages}
	\setlength{\LTleft}{0pt}
	\footnotesize
	\begin{longtable}{@{} >{\ttfamily}l l >{\raggedright}p{.6\textwidth} @{}}
		\toprule
		\multicolumn{1}{@{}l}{\bfseries File~name} &
		\multicolumn{1}{c}{\bfseries Date} &
		\bfseries File~info
		\tabularnewline
		\midrule
		\endhead
		\bottomrule
		\endfoot
		\nobbz_print_filelist:
	\end{longtable}
}

\tl_new:N \l_nobbz_filelist_body_tl
\tl_new:N \l_nobbz_fileinfo_tl

\cs_new_protected:Npn \nobbz_print_filelist:
{
	\clist_map_inline:cn { @filelist }
	{
		\nobbz_print_fileinfo:n { ##1 }
	}
	\tl_use:N \l_nobbz_filelist_body_tl
}

\cs_new_protected:Npn \nobbz_print_fileinfo:n #1
{
	\regex_match:nnT { \.(sty|cls)\Z } { #1 }
	{
		\nobbz_print_pkginfo:n { #1 }
	}
}

\cs_new_protected:Npn \nobbz_print_pkginfo:n #1
{
	\tl_set_eq:Nc \l_nobbz_fileinfo_tl { ver@#1 }
	\tl_replace_once:Nnn \l_nobbz_fileinfo_tl { ~ } { & }
	\tl_put_right:Nx \l_nobbz_filelist_body_tl
	{
		\exp_not:n { #1 }
		&
		\exp_not:V \l_nobbz_fileinfo_tl
		\exp_not:N \tabularnewline
	}
}
\ExplSyntaxOff




%% Beinhaltet den Style der Titelseite und des Vor-Text-Teils
\RequirePackage{titlepage}

\AtBeginDocument{%
	\setstretch{1.2}
	%Schreibe geladene .cls and .sty files in Dokument für Debugging
	\listfiles
	% Titelblatt, Vor-Text-Teil erzeugen
	\input{studiengaenge}
	\frontmatter

	\titlepg
	\newpage
	\bibinfo
	\newpage
	\signaturepage
	\newpage
	\abstractpage
	\sethyp
}


\AtEndDocument{
	% Abkürzungsverzeichnis ausgeben
	\printglossary[type=\acronymtype, nonumberlist, title=\hsmaabbreviations,style=long]

	\ifglossar
		% Glossar ausgeben
		\printglossary[style=altlist, nonumberlist, title=\hsmaglossary]
	\fi

	% Abbildungsverzeichnis erzeugen
	\listoffigures

	% Tabellenverzeichnis erzeugen
	\listoftables


	\ifsymbols
		% Symbolverzeichnis ausgeben
		% Wenn Sie kein Symbolverzeichnis haben, kommentieren Sie die folgende Zeile aus
		\printglossary[type=symbolslist,style=symbunitlong,title=\hsmalistofsymbols]
	\fi

	\ifsourcecode
		%Sourcecode
		\lstlistoflistings
		%\IfFileExists{thesis.lol}{\lstlistoflistings}{}
	\fi


	% Literaturverzeichnis erzeugen
	\printbibliography


	\printindex

%	\newwrite\loadedtexfiles
%	\immediate\openout\loadedtexfiles=listTexFiles.txt
%	\immediate\write\loadedtexfiles{\printfilelist}
%	\immediate\closeout\loadedtexfiles
%
%	\printfilelist
}


%\newcommand{\foo}{FOO}
%\PackageError{ethel}{%
	%	Your hovercraft is full of eels,\MessageBreak
	%	and \protect\foo\space is \foo
	%}{%
	%	Oh dear! Something’s gone wrong.\MessageBreak
	%	\space \space Try typing \space «return»
	%	\space to proceed, ignoring \protect\foo.
	%}
%\fi%
