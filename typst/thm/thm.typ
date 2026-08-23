#import "@preview/glossarium:0.5.10": gls, make-glossary, print-glossary, register-glossary
#import "@preview/acrostiche:0.7.0": acr, init-acronyms, print-index
#import "thm-helpers.typ": *
#import "snowcards.typ": *

// This function gets your whole document as its `body` and formats it as
// a thesis in the style of the University of Applied Sciences Mannheim.
// Example usage can be found in `thesis.typ`.
#let thm-thesis(
  // The english title of the thesis.
  title-en: [Title of the Thesis],

  // The German title of the thesis.
  title-de: [Titel der Thesis],

  // Language of the thesis ("de" or "en").
  lang: "en",

  // English abstract.
  abstract-en: [English abstract.],

  // German abstract.
  abstract-de: [Deutsche Zusammenfassung.],

  // The author's surname.
  author-surname: [Mustermann],

  // The author's given name.
  author-given-name: [Max],

  // The names of your supervising professors.
  reviewers: ("Prof. A", "Prof. B"),

  // The names of your supervisors at e.g. your company.
  advisors: ("C, M.Sc.", "D, M.Sc."),

  // The submission date.
  submission-date: datetime.today(),

  // The submission city.
  city: "Mannheim",

  // Abbreviation for your faculty.
  faculty: "I",

  // Abbreviation for your course of study.
  course-of-study: "IB",

  // Toggle for proposal-mode. Mainly changes the title and omits some declarations.
  // This is useful if you want to cleanly transition from a proposal into a thesis
  // without much copy-pasting or restructuring. The template does it for you.
  is-proposal: false,

  //toggle to include LLM notice
  use-llm-notice: false,

  //content of the LLm notice
  llm-notice: "",

  // Your bibliography. Pass `bibliography("your_refs.bib")`.
  bibliography: none,

  // A list of glossary items. Check the example in `glossary.typ`.
  glossary: none,

  // A list of acronyms. Check the example in `acronyms.typ`.
  acronyms: none,

  // Your appendix. This has to be passed separately from the rest of the thesis as the numbering of the headings is different.
  appendix: none,

  // An image of your handwritten signature.
  signature: none,

  // The content of your thesis.
  body,
) = {
  let is-en = lang == "en"

  let sans = "TeX Gyre Heros"
  let serif = "TeX Gyre Termes"

  let title = if is-en { title-en } else { title-de }

  let course-of-study = courses-of-study.at(course-of-study)
  let faculty = faculties.at(faculty)

  // Configure the page.
  set page(paper: "a4")

  // Set the body font.
  set text(size: 12pt, font: serif, lang: lang)

  let date-format = "[day].[month].[year]"

  // No page numbering until abstract.
  set page(numbering: none)

  //  Fix footnote style
  set footnote.entry(indent: 0pt)
  set footnote.entry(gap: 0.6em)

  // Configure enum numbering scheme.
  set enum(
    indent: 1em,
    spacing: 1em,
    numbering: (..n) => {
      // For the first level we use numbers 1, 2, 3, ...
      // On the second level we use letters a), b), c), ...
      let level = n.pos().len() - 1
      let pattern = "1a".at(level, default: "a")
      let suffix = ".)".at(level, default: ")")
      numbering(pattern, n.pos().last()) + suffix
    },
    full: true,
  )

  // Configure unnumbered list. For the first level
  // we use dots and dashes for the second level.
  set list(indent: 1em, spacing: 1em, marker: ([•], [*–*]))

  // Tables & figures
  // to have a line separating the header and content, include a table.hline (y: 1)
  // in the header definition after the actual headers
  set figure(gap: 1.5em)
  show figure.caption: set text(font: sans, size: 9pt)
  show figure.where(kind: table): set figure.caption(position: top)
  show figure: set block(breakable: true)
  set table(stroke: none, align: left, inset: (x: 5pt, y: 8pt))

  // Configure quotes.
  set quote(block: true)
  show quote: set pad(x: 3em, top: -2em)

  // The cover page.
  page(
    margin: (right: 9.5%, top: 7.9%, left: 9.5%, bottom: 7.9%),
    [
      #image(height: 2.15cm, "images/thm-logo.svg")

      #set text(size: 14pt, font: sans)
      #set align(center)
      #set par(leading: 0.75em)

      #pad(
        top: 2.63em,
        bottom: 2.5em,
        left: 5em,
        right: 5em,
        text(font: sans, size: 17pt, hyphenate: false, strong(title)),
      )

      #author-given-name #author-surname

      #if is-en {
        pad(top: 3.5em, [#course-of-study.type-en #if is-proposal [ Proposal ]])
        text(size: 11pt, [for the acquisition of the academic degree #course-of-study.degree])
        parbreak()
        [Course of Studies: #course-of-study.at(lang)]
      } else {
        pad(top: 3.5em, [#course-of-study.type-de #if is-proposal [ Exposé ]])
        text(size: 11pt, [zur Erlangung des akademischen Grades #course-of-study.degree])
        parbreak()
        [Studiengang #course-of-study.at(lang)]
      }

      #pad(top: 2em, bottom: 2em, [
        #if is-en { faculty.en } else { faculty.de }
        #parbreak()
        #if is-en { institute.en } else { institute.de }
      ])

      #submission-date.display(date-format)

      #place(bottom + center, {
        if is-en [Supervisors] else [Betreuer]
        parbreak()

        for reviewer in reviewers {
          reviewer
          parbreak()
        }

        for advisor in advisors {
          advisor
          parbreak()
        }
      })
    ],
  )

  // Omit for proposal.
  if not is-proposal {
    // General information on the thesis.
    page[
      *#author-surname, #author-given-name*:
      #parbreak()
      #title-de / #author-given-name #author-surname. --
      #parbreak()
      #course-of-study.type-de, #city: #institute.de, #submission-date.year().
      // Calculate the number of pages of actual content.
      #context { locate(<end-of-body>).position().at("page") - locate(<start-of-body>).position().at("page") + 1 } Seiten.

      #v(3em)

      *#author-surname, #author-given-name*:
      #parbreak()
      #title-en / #author-given-name #author-surname. --
      #parbreak()
      #course-of-study.type-en, #city: #institute.en, #submission-date.year().
      #context { locate(<end-of-body>).position().at("page") - locate(<start-of-body>).position().at("page") + 1 } pages.

      #if not is-en {
        place(bottom, [
          Um die Lesbarkeit zu vereinfachen, wird auf die zusätzliche Formulierung der weiblichen Form bei Personenbezeichnungen verzichtet.
          Ich weise deshalb darauf hin, dass die Verwendung der männlichen Form explizit als geschlechtsunabhängig verstanden werden soll.
        ])
      }
    ]

    // Declarations, signature and license.
    page[
      #let declaration = if is-en [Declaration] else [Erklärung]
      #text(size: 20pt, font: sans, strong(declaration))

      #if is-en [
        I confirm that the submitted thesis is original work and was written by me without further assistance. Appropriate credit has been given where reference has been made to the work of others.
      ] else [
        Hiermit erkläre ich, dass ich die vorliegende Arbeit selbstständig verfasst und keine anderen als die angegebenen Quellen und Hilfsmittel benutzt habe.
      ]

      #pad(
        [#city, #submission-date.display(date-format)],
        top: 0.5cm,
        bottom: 0.25cm,
      )

      #if signature != none {
        block(signature, width: 4cm)
      }

      #author-given-name #author-surname

      #if use-llm-notice [
        #place(horizon, [
          #if is-en [
            #text(size: 20pt, font: sans, strong("Notice on the use of LLM tools")) \

            This thesis was created with assistance from Large Language Model tools. All content produced by these tools was reviewed and edited by the author. Specifically, LLMs were used for the following tasks:
          ] else [
            #text(size: 20pt, font: sans, strong("Hinweis zur Nutzung von LLM-Werkzeugen")) \

            Diese Arbeit wurde unter Zuhilfenahme von Large-Language-Models erstellt. Alle von diesen Tools erzeugten Inhalte wurden von der Autorin bzw. dem Autor überprüft und bearbeitet. Insbesondere wurden LLMs für die folgenden Aufgaben eingesetzt:
          ]

          #for item in llm-notice [
            - #item
          ]


        ])
      ]

      #place(bottom, [
        #if is-en [
          I agree that my work may be published, i.e. that the work may be stored electronically, converted into other formats,
          made publicly available on the servers of the #institute.en and distributed via the Internet.
        ] else [
          Ich bin damit einverstanden, dass meine Arbeit veröffentlicht wird, d. h. dass die Arbeit elektronisch gespeichert,
          in andere Formate konvertiert, auf den Servern der #institute.de öffentlich zugänglich gemacht
          und über das Internet verbreitet werden darf.
        ]

        #v(1em)
        #grid(
          columns: (2fr, 1fr),
          align(top, [
            #if is-en [
              This work is licensed under a #link("https://creativecommons.org/licenses/by-sa/4.0/")[Creative Commons Attribution-ShareAlike 4.0 International License].
            ] else [
              Dieses Werk ist lizenziert unter einer #link("https://creativecommons.org/licenses/by-sa/4.0/")[Creative Commons Namensnennung -- Weitergabe unter gleichen Bedingungen 4.0 International Lizenz].
            ]
          ]),
          align(right, image("images/by-sa.svg", width: 90%)),
        )
      ])
    ]
  }

  // Configure paragraphs.
  set par(justify: true)

  // Start numbering from here using roman.
  set page(numbering: "i")

  // Configure heading text.
  show heading: h => {
    text(font: sans, strong(h))
  }

  // Top level headings always start on a new page.
  show heading.where(level: 1): h => {
    pagebreak(weak: true)
    pad(top: 5em, bottom: 1em, text(size: 22pt, h))
  }

  // Configure padding and text size depending on heading level.
  show heading.where(level: 2): h => pad(bottom: 1em, top: 1em, text(size: 15pt, h))
  show heading.where(level: 3): h => pad(bottom: 1em, h)
  show heading.where(level: 4): h => text(font: sans, h.body)
  show heading.where(level: 5): h => text(size: 10pt, font: sans, h.body)

  // Abstract in german and english. Omit if proposal.
  if not is-proposal {
    text(size: 20pt, font: sans, strong([Abstrakt]))
    v(1em)
    text(size: 12pt, font: sans, strong(emph(title-de)))
    v(1em)
    abstract-de

    v(2em)

    text(size: 20pt, font: sans, strong([Abstract]))
    v(1em)
    text(size: 12pt, font: sans, strong(emph(title-en)))
    v(1em)
    abstract-en
  }

  // Configure the table of contents (called `outline` in typst).
  // Check https://typst.app/docs/reference/model/outline/ for details.
  show outline.entry.where(level: 1): it => link(
    it.element.location(),
    pad(
      top: 0.5em,
      text(font: sans, weight: "bold", it.indented(it.prefix(), [#it.body() #h(1fr) #it.page()], gap: 1em)),
    ),
  )

  // Print the table of contents.
  outline(indent: auto, depth: 3)

  // Initialize acronyms.
  if acronyms != none {
    init-acronyms(acronyms)
  }

  // Print acronyms.
  if acronyms != none and not is-proposal {
    let title = if lang == "de" [Abkürzungsverzeichnis] else [Acronyms Index]
    print-index(delimiter: "", title: title, clickable: false, row-gutter: 1em, outlined: true, sorted: "up")
  }

  // Change the outline styling for figures, tables and listings.
  show outline.entry: it => link(
    it.element.location(),
    it.indented(it.prefix(), it.inner()),
  )
  show outline: set heading(outlined: true)

  // Print the list of figures if it's not empty. The context block enables us to react to the
  // number of images present in the document. See https://typst.app/docs/reference/context/.
  context {
    if counter(figure.where(kind: image)).final().at(0) > 0 and not is-proposal {
      let title = if lang == "de" [Abbildungsverzeichnis] else [List of Figures]
      outline(indent: auto, title: title, target: figure.where(kind: image))
    }
  }

  // Print the list of tables if it's not empty.
  context {
    if counter(figure.where(kind: table)).final().at(0) > 0 and not is-proposal {
      let title = if lang == "de" [Tabellenverzeichnis] else [List of Tables]
      outline(indent: auto, title: title, target: figure.where(kind: table))
    }
  }

  // TODO: List of symbols. There is currently no easy, out-of-the-box way to do this.
  // I don't consider this to be a critical feature and I encourge you, should you need
  // this feature, to go and implement it yourself.

  // Print the list of listings if it's not empty.
  context {
    if counter(figure.where(kind: raw)).final().at(0) > 0 and not is-proposal {
      let title = if lang == "de" [Quellcodeverzeichnis] else [List of Listings]
      outline(indent: auto, title: title, target: figure.where(kind: raw))
    }
  }

  // Configure headings.
  let supplement = if is-en [Chapter] else [Kapitel]
  set heading(numbering: "1.1", supplement: supplement)

  // Configure the page header. It shows the first heading that appears on that page.
  // The header is omitted for each top level heading.
  set page(
    header: [
      #context {
        let current-page = here().page()
        let headings-on-page = query(heading)
          .filter(h => h.level < 3 and h.location().page() == current-page)
          .sorted(key: h => h.level)
        let headings-before-page = query(heading).filter(h => h.level < 3 and h.location().page() < current-page)

        let h = none
        if headings-on-page.len() > 0 {
          h = headings-on-page.first()
        } else if headings-before-page.len() > 0 {
          h = headings-before-page.last()
        }

        set align(center)

        if h != none and h.level != 1 {
          if h.numbering != none {
            emph(numbering(h.numbering, ..counter(heading).at(h.location())))
          }

          [ #emph(h.body)]
          v(-0.75em)
          line(length: 100%, stroke: 0.5pt)
        }
      }
    ],
  )

  // Init glossary. This needs to happen before the `body` is included,
  // because otherwise using glossary items in the body would error.
  if glossary != none {
    show: make-glossary
    register-glossary(glossary)
  }

  context {
    // Remember the page number before resetting.
    let page-number = here().page()

    // Set page numbering to arabic for the main content and reset the counter to 1.
    set page(numbering: "1")
    counter(page).update(1)

    // Put invisible label at the start and end of the body so
    // we can easily count the number of pages of actual content.
    [#metadata("Start of body") <start-of-body>]
    body
    [#metadata("End of body") <end-of-body>]

    // Change back to roman numbering after the main content.
    // Set the counter back to where we left off before the body.
    set page(numbering: "i")
    counter(page).update(page-number)
  }

  set heading(numbering: none)

  // Print glossary on a new page.
  if glossary != none {
    pagebreak(weak: true)
    if is-en [= Glossary] else [= Glossar]
    print-glossary(glossary, deduplicate-back-references: true)
  }

  // Print bibliography.
  bibliography

  // Change the heading numbering for the appendix.
  counter(heading).update(0)
  let supplement = if is-en [Appendix] else [Anhang]
  set heading(numbering: "A.1", supplement: supplement)

  // Print appendix.
  if appendix != none {
    [#appendix]
  }
}
