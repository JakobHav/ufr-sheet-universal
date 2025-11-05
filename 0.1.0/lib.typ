/*
  Copyright 2025, Universität Freiburg

  author: Jakob Haverkamp <jh1444@email.uni-freiburg.de>

  Template for simple worksheet
*/

// Codeblöcke schön machen:


#let conf(
  header: true,
  header_start: 1,
  numbering: "1",
  number-align: center,
  name: "",
  rz: "",
  matrikelnr: "",
  title: "",
  left_header: true,
  subject: "",
  semester: "",
  prof: "",
  date: "",
  font_family: "New Computer Modern",
  block_sentence: true,
  doc,
) = {
  import "@preview/codly:1.3.0": *
  import "@preview/codly-languages:0.1.1": *

  show: codly-init.with()
  codly(
    zebra-fill: black.lighten(97.5%),
    languages: codly-languages,
    display-icon: false,
    display-name: false,
  )
  show heading: set text(size: 10pt)
  show heading.where(level: 1): set text(size: 13pt)
  show heading.where(level: 2): set text(size: 12pt)
  show heading.where(level: 3): set text(size: 11pt)


  let l = ""
  let c = ""
  let r = ""

  if header == true {
    l = name
    c = subject
    r = title
  } else if header != false {
    l = header.at(0)
    c = header.at(1)
    r = header.at(2)
  }

  set text(
    lang: "de",
    size: 11.5pt,
    font: font_family,
  )

  set par(
    justify: true,
  )

  set page(
    width: 210mm,
    height: 297mm,
    margin: (top: 23mm, bottom: 28mm, left: 28mm, right: 28mm),
    numbering: numbering,
    number-align: number-align,
    header: context {
      set text(size: 14pt)
      if header != false and counter(page).get().first() > header_start {
        [
          #align(center)[
            #block(height: 0pt, above: 5pt, below: -10pt)[#c]
          ]
          #block(below: 7pt)[
            #l#h(1fr)#r
          ]
          #line(stroke: 0.25pt, length: 100%)
        ]
      }
    },
  )

  let freiburggray = rgb(154, 154, 154)

  block(width: 100%, below: -43.5pt)[
    #align(center)[
      #block(below: -54pt)[
        #strong[
          #text(14pt)[
            #subject \
            #semester
          ]
        ] \
        #prof
        \
      ]
    ]

    #align(left)[
      #block(height: 3.5em)[
        \
        #if (left_header == true) {
          [
            #name \
            RZ: #rz \
            Matrikel: #matrikelnr
          ]
        } else {
          left_header
        }
      ]
    ]

    #align(right)[
      #block(above: -60pt)[
        #box(image(
          "./assets/logo.png",
          height: 127pt,
        ))
      ]
    ]
  ]

  rect(width: 82.5%, height: 3.9pt, fill: freiburggray)

  align(center)[
    #block(above: 40pt, below: 5pt)[
      #text(16pt, weight: "medium", stroke: 0.25pt)[
        #title
      ] \
      #{
        let datelist = date.split(".")
        if datelist.len() == 3 {
          import "@preview/datify:0.1.4": month-name
          let monatname = month-name(int(datelist.at(1)), "de", true)

          date = str(datelist.at(0)) + ". " + monatname + " " + datelist.at(2)
        }
      }
      #text(11.0pt)[
        #date
      ]
    ]
  ]
  block()
  doc
}

