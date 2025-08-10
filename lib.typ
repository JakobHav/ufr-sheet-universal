/*
  Copyright 2025, Universität Freiburg

  author: Jakob Haverkamp <jh1444@email.uni-freiburg.de>

  Template for simple worksheet
*/

#let conf(
  /*
  Date: Datum
  */
  date: "",
  title: "",
  semester: "",
  prof: "",
  subject: "",
  header: "1",
  numbering: "1",
  name: "Jakob Haverkamp",
  mat: "5932110",
  rz: "jh1444",
  header_start: 1,
  doc,
) = {
  set text(
    lang: "de",
    size: 13pt,
  )

  let l = ""
  let c = ""
  let r = ""

  if header == "1" or header == true {
    l = name
    c = subject
    r = title
  } else if header == "2" {
    l = name
    c = title
    r = subject
  } else if header == "3" {
    l = name
    c = ""
    r = title
  } else if header == "4" {
    l = name
    c = ""
    r = subject
  } else {
    header = false
  }

  set page(
    width: 210mm,
    height: 297mm,
    margin: (top: 23mm, bottom: 20mm, left: 18mm, right: 18mm),
    numbering: {
      if numbering != "0" and numbering != "none" and numbering != false {
        numbering.replace("rr", "").replace("ll", "")
      }
    },
    number-align: {
      if numbering.contains("rr") {
        right
      } else if numbering.contains("ll") {
        left
      } else {
        center
      }
    },

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
      #block(below: -60pt)[
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
      #block()[
        \
        #name \
        RZ: #rz \
        Matrikel: #mat \
      ]
    ]

    #align(right)[
      #block(above: -69pt)[
        #box(image(
          "./assets/logo.png",
          height: 127pt,
        ))
      ]
    ]
  ]

  rect(width: 84%, height: 3.9pt, fill: freiburggray)

  align(center)[
    #block(above: 40pt, below: 5pt)[
      #text(15pt)[
        #strong()[#title]
      ] \
      #{
        let datelist = date.split(".")
        if datelist.len() == 3 {
          import "@preview/datify:0.1.4": month-name
          let monatname = month-name(int(datelist.at(1)), "de", true)

          date = str(datelist.at(0)) + ". " + monatname + " " + datelist.at(2)
        }
      }
      #date
    ]
  ]
  block()
  doc
}

