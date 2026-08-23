#import "thm/thm.typ": thm-thesis
#import "glossary.typ": glossary
#import "acronyms.typ": acronyms
#import "abstract.typ": abstract-de, abstract-en
#import "appendix.typ" as appendix

#show: thm-thesis.with(
  title-de: [Einsatz eines Flux-Kompensators für Zeitreisen mit einer maximalen Höchstgeschwindigkeit von WARP~7],
  title-en: [Application of a flux compensator for timetravel with a maximum velocity of warp~7],
  author-surname: "Mustermann",
  author-given-name: "Max",
  abstract-de: abstract-de,
  abstract-en: abstract-en,
  course-of-study: "CSB",
  reviewers: ("Prof. Peter Mustermann, Technische Hochschule Mannheim",),
  advisors: ("Erika Mustermann, Paukenschlag GmbH",),
  lang: "de",
  bibliography: bibliography("refs.bib", style: "ieee"),
  glossary: glossary,
  acronyms: acronyms,
  appendix: appendix,
  signature: image("images/unterschrift.png"),
  llm-notice: (
    "Textkorrekturen",
    "Vorschläge für Formulierungen",
    "Kaffeekochen",
  ),
  use-llm-notice: true,
)

#include "chapters/chapter1.typ"
#include "chapters/chapter2.typ"
#include "chapters/chapter3.typ"
#include "chapters/chapter4.typ"

