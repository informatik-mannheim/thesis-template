//function to display a single snowcard
#let snowcard(
  type,
  title,
  description,
  rationale,
  originator,
  fitCriterion,
  priority,
  affects,
  references,
) = {
  context {
    let lang = text.lang

    let is-en = lang == "en"

    let sc-requirement = "Nr."
    let sc-type = "Typ"
    let sc-title = "Titel"
    let sc-description = "Beschreinung"
    let sc-rationale = "Begründung"
    let sc-originator = "Herkunft"
    let sc-fit-criterion = "Fit-Kriterium"
    let sc-satisfaction = "Zufriedenheit"
    let sc-dissatisfaction = "Unzufriedenheit"
    let sc-priority = "Priorität"
    let sc-affects = "Beeinflusst"
    let sc-supporting-material = "Weiteres Material"

    if is-en {
      sc-requirement = "No."
      sc-type = "Type"
      sc-title = "Title"
      sc-description = "Description"
      sc-rationale = "Rationale"
      sc-originator = "Originator"
      sc-fit-criterion = "Fit Criterion"
      sc-satisfaction = "Customer Satisfaction"
      sc-dissatisfaction = "Customer Dissatisfaction"
      sc-priority = "Priority"
      sc-affects = "Conflict"
      sc-supporting-material = "Supporting Material"
    }

    set text(size: 10pt, font: "TeX Gyre Heros")
    set par(justify: false)

    let no = context counter(figure.where(kind: "snowcard")).get().at(0)

    figure(
      kind: "snowcard",
      supplement: "#",
      box(
        stroke: 0.5pt,
        grid(
          columns: (1fr, 0.5fr, 0.5fr, 1fr),
          rows: (auto, auto, auto, auto, auto, auto, auto, auto),
          gutter: 2pt,
          inset: 5pt,
          grid.cell(align: left)[*#sc-requirement*: #no],
          grid.cell(align: left, colspan: 2)[*#sc-type*: #type],
          grid.cell(align: right)[*#sc-priority*: #priority],
          grid.hline(),
          grid.cell(align: left, colspan: 4)[*#sc-title*: #title],
          grid.cell(align: left, colspan: 4)[*#sc-originator*: #originator],
          grid.cell(align: left, colspan: 4)[*#sc-affects*: #affects],
          grid.cell(align: left, colspan: 4)[*#sc-description*: \ #description],
          grid.cell(align: left, colspan: 4)[*#sc-rationale*: \ #rationale],
          grid.cell(align: left, colspan: 4)[*#sc-fit-criterion*: \ #fitCriterion],
          grid.cell(align: left, colspan: 4)[*#sc-supporting-material*: \ #references],
        ),
      ),
    )
  }
}

// Function to render the overview table using queries. Relies on snowcard()'s definition not changing
//Shows all requirements in the entire document.
//IMPORTANT: This function must be called within context, i.e. \#context snowcardOverview()
#let snowcardOverview() = {
  // Find every snowcard figure in the entire document
  let cards = query(figure.where(kind: "snowcard"))

  context {
    let lang = text.lang
    let sc-tbl-title = "Titel"

    if lang == "en" {
      sc-tbl-title = "Title"
    }

    let tableRows = ()
    for (index, card) in cards.enumerate() {
      let reqNum = index + 1

      //extract the title of each card
      let title = card.body.body.children.at(4).body

      //exclude the "Title: " part at the start
      title = title.children.last()

      tableRows.push([#reqNum])
      tableRows.push(title)
    }

    return table(
      columns: (auto, 1fr),
      align: (right, left),
      inset: 0.4em,
      table.header(
        "#", sc-tbl-title,
        table.hline(y: 1),
      ),
      ..tableRows,
    )
  }
}

