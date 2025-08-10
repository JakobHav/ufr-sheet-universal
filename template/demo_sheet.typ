/*
  Copyright 2025, Universität Freiburg

  author: Jakob Haverkamp <jh1444@email.uni-freiburg.de>

  Template for tech worksheet
*/

#import "@local/ufr-sheet:0.1.0": conf
#import "@preview/cetz:0.4.0": canvas, draw, tree

#show: doc => conf(
  doc,
  subject: "Technische Informatik",
  date: "09.06.2025",
  prof: "Prof. Dr. Christoph Scholl",
  semester: "SS 2025",
  title: "Übungsblatt 07",
  header: "1",
)


= Aufgabe 1
=== a)

(Von unten nach oben gelesen)\
$f_1 =
x_1 x_2 x_3 x_4 or
x_1 x_2 overline(x_3) x_4 or
x_1 overline(x_2) x_3 x_4or
x_1 overline(x_2) x_3 overline(x_4) or
x_1 overline(x_2) overline(x_3) x_4or
overline(x_1) overline(x_2) overline(x_3) x_4$

$f_2 =
x_1 x_2 x_3 x_4 or
x_1 x_2 overline(x_3) x_4 or
overline(x_1) x_2 x_3 x_4or
overline(x_1) x_2 overline(x_3) x_4 or
overline(x_1) x_2 overline(x_3) overline(x_4) or
overline(x_1) overline(x_2) x_3 x_4$
=== b)
$"cost"(f_1, f_2) = ("cost"_1(f_1, f_2), "cost"_2(f_1, f_2)) = (abs("Mon")_f_1+abs("Mon")_f_2, abs("lit")_f_1 + abs("lit")_f_2)$ \
$= (5 + 5, 4 + 4) = (10, 8)$\


=== c) Hypercube für $f_1$
#let CUBE(x, y, z0, z1, size) = {
  import draw: *
  // front face cube
  line((x, y + size, z1), (x + size, y + size, z1))
  line((x, y, z1), (x + size, y, z1))
  line((x, y, z1), (x, y + size, z1))
  line((x + size, y + size, z1), (x + size, y, z1))

  // Back face cube
  line((x, y + size, z0), (x + size, y + size, z0))
  line((x, y, z0), (x + size, y, z0))
  line((x, y, z0), (x, y + size, z0))
  line((x + size, y + size, z0), (x + size, y, z0))

  // connecting lines small
  line((x, y, z0), (x, y, z1))
  line((x + size, y, z0), (x + size, y, z1))
  line((x, y + size, z0), (x, y + size, z1))
  line(
    (x + size, y + size, z0),
    (x + size, y + size, z1),
  )
}

#v(10pt)

#canvas(
  length: 2cm,
  {
    import draw: *
    // (x, y, z_0, z_1, size)
    //
    //small cube:
    CUBE(2.8, 0.5, 0.2, 1, 1)
    // big cube:
    CUBE(1, -1, 0.1, -1.5, 3)

    line((6, -1, 0.1), (7, -1, 0.1), mark: (end: ">", fill: black), name: "x_1")
    line((6, -1, 0.1), (6, 0, 0.1), mark: (end: ">", fill: black), name: "x_2")
    line((6, -1, 0.1), (6, -1, -1), mark: (end: ">", fill: black), name: "x_3")
    content(
      ("x_1.start", 100%, "x_1.end"),
      padding: 0.1,
      anchor: "west",
      [x1],
    )
    content(
      ("x_2.start", 100%, "x_2.end"),
      // angle: "0",
      padding: 0.1,
      anchor: "south",
      [x2],
    )
    content(
      ("x_3.start", 100%, "x_3.end"),
      padding: 0.1,
      anchor: "south-west",
      [x3],
    )
    content(
      (6, 1, 0.1),
      anchor: "west",
      [(x1, x2, x3, x4)],
    )
    // Front face big
    circle(
      (1, -1, 0.1),
      radius: 15pt,
      fill: red,
      name: "0001",
    )
    circle(
      (4, -1, 0.1),
      radius: 15pt,
      fill: red,
      name: "1001",
    )
    circle(
      (1, 2, 0.1),
      radius: 15pt,
      fill: white,
      name: "0101",
    )
    circle(
      (4, 2, 0.1),
      radius: 15pt,
      fill: white,
      name: "1101",
    )
    // Back face big
    circle(
      (1, -1, -1.5),
      radius: 15pt,
      fill: white,
      name: "0011",
    )
    circle(
      (4, -1, -1.5),
      radius: 15pt,
      fill: red,
      name: "1011",
    )
    circle(
      (1, 2, -1.5),
      radius: 15pt,
      fill: white,
      name: "0111",
    )
    circle(
      (4, 2, -1.5),
      radius: 15pt,
      fill: red,
      name: "1111",
    )
    // Front face small
    circle(
      (2.8, 0.5, 1),
      radius: 10pt,
      fill: white,
      name: "0000",
    )
    circle(
      (3.8, 0.5, 1),
      radius: 10pt,
      fill: white,
      name: "1000",
    )
    circle(
      (2.8, 1.5, 1),
      radius: 10pt,
      fill: white,
      name: "0100",
    )
    circle(
      (3.8, 1.5, 1),
      radius: 10pt,
      fill: white,
      name: "1100",
    )
    // Back face small
    circle(
      (2.8, 0.5, 0.2),
      radius: 10pt,
      fill: white,
      name: "0010",
    )
    circle(
      (3.8, 0.5, 0.2),
      radius: 10pt,
      fill: red,
      name: "1010",
    )
    circle(
      (2.8, 1.5, 0.2),
      radius: 10pt,
      fill: white,
      name: "0110",
    )
    circle(
      (3.8, 1.5, 0.2),
      radius: 10pt,
      fill: white,
      name: "1110",
    )
    for i in range(8) {
      let bin = str(i, base: 2)
      bin = "0" * (4 - bin.len()) + bin
      let prefix = bin.at(3) + bin.at(2) + bin.at(1)
      line(
        prefix + "0",
        prefix + "1",
        name: prefix + "2",
      )
      content(
        background: white,
        (prefix + "0", 140%, prefix + "1"),
        padding: 2pt,
        [#(prefix + "1")],
      )
      content(
        (prefix + "1", 90%, prefix + "0"),
        padding: 20pt,
        [#(prefix + "0")],
      )
    }

    // line("1111", "1101", stroke: ("thickness": 5pt, "paint": red), name: "000" + "2")
    // line("1111", "1011", stroke: ("thickness": 5pt, "paint": red), name: "000" + "2")
    // line("1011", "1010", stroke: ("thickness": 5pt, "paint": red), name: "000" + "2")
    // line("1011", "1001", stroke: ("thickness": 5pt, "paint": red), name: "000" + "2")
    // line("1001", "0001", stroke: ("thickness": 5pt, "paint": red), name: "000" + "2")
    circle(
      (4, 2, 0.1),
      radius: 15pt,
      fill: red,
      name: "1101",
    )
  },
)
#pagebreak()
=== c) Hypercube für $f_2$
#canvas(
  length: 2cm,
  {
    import draw: *
    // (x, y, z_0, z_1, size)
    //
    //small cube:
    CUBE(2.8, 0.5, 0.2, 1, 1)
    // big cube:
    CUBE(1, -1, 0.1, -1.5, 3)

    line((6, -1, 0.1), (7, -1, 0.1), mark: (end: ">", fill: black), name: "x_1")
    line((6, -1, 0.1), (6, 0, 0.1), mark: (end: ">", fill: black), name: "x_2")
    line((6, -1, 0.1), (6, -1, -1), mark: (end: ">", fill: black), name: "x_3")
    content(
      ("x_1.start", 100%, "x_1.end"),
      padding: 0.1,
      anchor: "west",
      [x1],
    )
    content(
      ("x_2.start", 100%, "x_2.end"),
      // angle: "0",
      padding: 0.1,
      anchor: "south",
      [x2],
    )
    content(
      ("x_3.start", 100%, "x_3.end"),
      padding: 0.1,
      anchor: "south-west",
      [x3],
    )
    content(
      (6, 1, 0.1),
      anchor: "west",
      [(x1, x2, x3, x4)],
    )
    // Front face big
    circle(
      (1, -1, 0.1),
      radius: 15pt,
      fill: white,
      name: "0001",
    )
    circle(
      (4, -1, 0.1),
      radius: 15pt,
      fill: white,
      name: "1001",
    )
    circle(
      (1, 2, 0.1),
      radius: 15pt,
      fill: red,
      name: "0101",
    )
    circle(
      (4, 2, 0.1),
      radius: 15pt,
      fill: red,
      name: "1101",
    )
    // Back face big
    circle(
      (1, -1, -1.5),
      radius: 15pt,
      fill: red,
      name: "0011",
    )
    circle(
      (4, -1, -1.5),
      radius: 15pt,
      fill: red,
      name: "1011",
    )
    circle(
      (1, 2, -1.5),
      radius: 15pt,
      fill: red,
      name: "0111",
    )
    circle(
      (4, 2, -1.5),
      radius: 15pt,
      fill: white,
      name: "1111",
    )
    // Front face small
    circle(
      (2.8, 0.5, 1),
      radius: 10pt,
      fill: white,
      name: "0000",
    )
    circle(
      (3.8, 0.5, 1),
      radius: 10pt,
      fill: white,
      name: "1000",
    )
    circle(
      (2.8, 1.5, 1),
      radius: 10pt,
      fill: red,
      name: "0100",
    )
    circle(
      (3.8, 1.5, 1),
      radius: 10pt,
      fill: white,
      name: "1100",
    )
    // Back face small
    circle(
      (2.8, 0.5, 0.2),
      radius: 10pt,
      fill: white,
      name: "0010",
    )
    circle(
      (3.8, 0.5, 0.2),
      radius: 10pt,
      fill: white,
      name: "1010",
    )
    circle(
      (2.8, 1.5, 0.2),
      radius: 10pt,
      fill: white,
      name: "0110",
    )
    circle(
      (3.8, 1.5, 0.2),
      radius: 10pt,
      fill: white,
      name: "1110",
    )

    for i in range(8) {
      let bin = str(i, base: 2)
      bin = "0" * (4 - bin.len()) + bin
      let prefix = bin.at(3) + bin.at(2) + bin.at(1)

      line(
        prefix + "0",
        prefix + "1",
        fill: red,
        name: prefix + "2",
      )
      content(
        background: white,
        (prefix + "0", 140%, prefix + "1"),
        padding: 2pt,
        [#(prefix + "1")],
      )
      content(
        (prefix + "1", 90%, prefix + "0"),
        padding: 20pt,
        [#(prefix + "0")],
      )
    }
    // line("1111", "1101", stroke: ("thickness": 5pt, "paint": red), name: "000" + "2")
    // line("1111", "1011", stroke: ("thickness": 5pt, "paint": red), name: "000" + "2")
    // line("0111", "0101", stroke: ("thickness": 5pt, "paint": red), name: "000" + "2")
    // line("0101", "0100", stroke: ("thickness": 5pt, "paint": red), name: "000" + "2")
    // line("0111", "0011", stroke: ("thickness": 5pt, "paint": red), name: "000" + "2")
    circle(
      (4, 2, 0.1),
      radius: 15pt,
      fill: red,
      name: "1101",
    )
  },
)
#v(50pt)
= Aufgabe 2

*a)*
Gegenbeispiel: (a, b, c, f) = (0, 0, 0, 0), da $1=1 and f = 0$ kein Implikat

*b)* Gegenbeispiel: (a, b, c, f) = (1, 0, 1, 0), da $a=1 and f=0$ kein Implikat

*c)* $a and overline(b) and overline(c) = 1$ nur bei (a, b, c) = (1, 0, 0) #sym.arrow Da ist auch $f(1, 0, 0) = 1$, also Implikant

Kein Primimplikant, weil $a and overline(c)$ auch ein Implikant ist\

*d)* $b and c = 1$ bei (a, b, c) = (0, 1, 1) und (1, 1, 1), bei beiden ist auch $f(0, 1, 1) = f(1, 1, 1) = 1$,\ $->$ also Implikant

Ist auch Primimplikant, weil weder b noch c alleine Implikanten.

#pagebreak()

= Aufgabe 3
=== a)
$"ON"(f) = {0000,0001,0100,0101,0110,0111,1000,1010,1100,1110,1111}$ \
#line(stroke: 0.25pt, length: 90%)
$L_(0)^({x_1, x_2, x_3, x_4}) = {0000,0001,0100,0101,0110,0111,1000,1010,1100,1110,1111}$ \
#line(stroke: 0.25pt, length: 90%)
$L_(1)^({x_2, x_3, x_4}) = {"-"000, "-"100, "-"110, "-"111}$ #h(40pt)
$L_(1)^({x_1, x_3, x_4}) = {0"-"00, 0"-"01, 1"-"00, 1"-"10}$ \

$L_(1)^({x_1, x_2, x_4}) = {10"-"0, 11"-"0, 01"-"0, 01"-"1}$ #h(40pt)
$L_(1)^({x_1, x_2, x_3}) = {010"-", 000"-", 111"-", 011"-"}$ \
#line(stroke: 0.25pt, length: 90%)
#let left = 33.3%
#let right = 33.3%
#table(
  columns: (left, 100% - left - right, right),
  stroke: 0pt,
  [
    $L_(2)^({x_3, x_4}) = {"--00"}$ \

    $L_(2)^({x_1, x_4}) = {"1--0"}$ \

  ],
  [
    $L_(2)^({x_2, x_4}) = {"-1-0"}$ \

    $L_(2)^({x_1, x_3}) = {"0-0-"}$ \

  ],
  [
    $L_(2)^({x_2, x_3}) = {"-11-"}$ \

    $L_(2)^({x_1, x_2}) = {"01--"}$ \

  ],
)

#line(stroke: 0.25pt, length: 90%)
$L_(3)^({x_1}) = {emptyset}$ #h(40pt)
$L_(3)^({x_2}) = {emptyset}$ \

$L_(3)^({x_3}) = {emptyset}$ #h(40pt)
$L_(3)^({x_4}) = {emptyset}$ \

// $""(f) = {0000,0001,0100,0101,0110,0111,1000,1010,1100,1110,1111}$ \
#let A = (0, 0, 0)
#let B = (1, 0, 0)
#let C = (1, 1, 0)
#let D = (0, 1, 0)
=== b) Hypercube für $f$, $"ON"(f)$ in Rot, Primimplikanten in Grün und Blau, Minimal kann mal die ganze ON-Menge mit: $overline(x_1)overline(x_3) or x_2x_3 or x_1 overline(x_4)$ darstellen (Grün).
#v(50pt)
#block(height: 0pt, above: 0pt)[
  #polygon(
    fill: green.lighten(20%).transparentize(50%),
    stroke: green,
    (97pt, 0pt),
    (284pt, 0pt),
    (219pt, 67.5pt + 16pt),
    (158pt, 67.5pt + 16pt),
  )
]

#block(height: 0pt, above: 0pt)[
  #polygon(
    fill: blue.lighten(30%).transparentize(50%),
    stroke: blue,
    (97pt, 0pt),
    (47pt, 50pt),
    (132pt, 109.5pt),
    (158pt, 68.5pt + 16pt),
  )
]

#block(height: 0pt, above: 0pt)[
  #polygon(
    fill: blue.lighten(30%).transparentize(50%),
    stroke: blue,
    (132pt, 109.5pt),
    (158pt, 67.5pt + 16pt),
    (219pt, 85.5pt),
    (195pt, 109.5pt),
  )
]

#block(height: 0pt, above: 0pt)[
  #polygon(
    fill: blue.lighten(30%).transparentize(50%),
    stroke: blue,
    (132pt, 109.5pt),
    (132pt, 172pt),
    (195pt, 172pt),
    (195pt, 109.5pt),
  )
]

#block(height: 0pt, above: 0pt)[
  #polygon(
    fill: green.lighten(20%).transparentize(50%),
    stroke: green,
    (47pt, 238pt),
    (47pt, 50pt),
    (132pt, 110.5pt),
    (132pt, 171pt),
  )
]
#block(height: 0pt, above: 0pt)[
  #polygon(
    fill: green.lighten(20%).transparentize(50%),
    stroke: green,
    (219pt, 85.5pt),
    (219pt, 147pt),
    (195pt, 172pt),
    (195pt, 110.5pt),
  )
]

#block(below: -55.5pt)

#block()[
  #canvas(
    length: 2.2cm,
    {
      import draw: *
      // (x, y, z_0, z_1, size)
      //
      //small cube:
      CUBE(2.8, 0.5, 0.2, 1, 1)
      // big cube:
      CUBE(1, -1, 0.1, -1.5, 3)

      line((6, -1, 0.1), (7, -1, 0.1), mark: (end: ">", fill: black), name: "x_1")
      line((6, -1, 0.1), (6, 0, 0.1), mark: (end: ">", fill: black), name: "x_2")
      line((6, -1, 0.1), (6, -1, -1), mark: (end: ">", fill: black), name: "x_3")
      content(
        ("x_1.start", 100%, "x_1.end"),
        padding: 0.1,
        anchor: "west",
        [x1],
      )
      content(
        ("x_2.start", 100%, "x_2.end"),
        // angle: "0",
        padding: 0.1,
        anchor: "south",
        [x2],
      )
      content(
        ("x_3.start", 100%, "x_3.end"),
        padding: 0.1,
        anchor: "south-west",
        [x3],
      )
      content(
        (6, 1, 0.1),
        anchor: "west",
        [(x1, x2, x3, x4)],
      )
      // Front face big
      circle(
        (1, -1, 0.1),
        radius: 15pt,
        fill: red,
        name: "0001",
      )
      circle(
        (4, -1, 0.1),
        radius: 15pt,
        fill: white,
        name: "1001",
      )
      circle(
        (1, 2, 0.1),
        radius: 15pt,
        fill: red,
        name: "0101",
      )
      circle(
        (4, 2, 0.1),
        radius: 15pt,
        fill: white,
        name: "1101",
      )
      // Back face big
      circle(
        (1, -1, -1.5),
        radius: 15pt,
        fill: white,
        name: "0011",
      )
      circle(
        (4, -1, -1.5),
        radius: 15pt,
        fill: white,
        name: "1011",
      )
      circle(
        (1, 2, -1.5),
        radius: 15pt,
        fill: red,
        name: "0111",
      )
      circle(
        (4, 2, -1.5),
        radius: 15pt,
        fill: red,
        name: "1111",
      )
      // Front face small
      circle(
        (2.8, 0.5, 1),
        radius: 10pt,
        fill: red,
        name: "0000",
      )
      circle(
        (3.8, 0.5, 1),
        radius: 10pt,
        fill: red,
        name: "1000",
      )
      circle(
        (2.8, 1.5, 1),
        radius: 10pt,
        fill: red,
        name: "0100",
      )
      circle(
        (3.8, 1.5, 1),
        radius: 10pt,
        fill: red,
        name: "1100",
      )
      // Back face small
      circle(
        (2.8, 0.5, 0.2),
        radius: 10pt,
        fill: white,
        name: "0010",
      )
      circle(
        (3.8, 0.5, 0.2),
        radius: 10pt,
        fill: red,
        name: "1010",
      )
      circle(
        (2.8, 1.5, 0.2),
        radius: 10pt,
        fill: red,
        name: "0110",
      )
      circle(
        (3.8, 1.5, 0.2),
        radius: 10pt,
        fill: red,
        name: "1110",
      )

      for i in range(8) {
        let bin = str(i, base: 2)
        bin = "0" * (4 - bin.len()) + bin
        let prefix = bin.at(3) + bin.at(2) + bin.at(1)

        line(
          prefix + "0",
          prefix + "1",
          fill: red,
          name: prefix + "2",
        )
        content(
          background: white,
          (prefix + "0", 140%, prefix + "1"),
          padding: 2pt,
          [#(prefix + "1")],
        )
        content(
          (prefix + "1", 90%, prefix + "0"),
          padding: 20pt,
          [#(prefix + "0")],
        )
      }
      // line("0000", "0001", stroke: ("thickness": 5pt, "paint": red), name: "000" + "2")
      circle(
        (4, 2, 0.1),
        radius: 15pt,
        fill: white,
        name: "1101",
      )
      circle(
        (1, -1, -1.5),
        radius: 15pt,
        fill: green.lighten(20%).transparentize(50%),
        name: "0011",
      )
      circle(
        (2.8, 0.5, 0.2),
        radius: 10pt,
        fill: blue.lighten(30%).transparentize(50%),
        name: "0010",
      )
    },
  )
]
=== c)
alle_min: $overline(x_1)overline(x_2)overline(x_3)overline(x_4)or overline(x_1)overline(x_2)overline(x_3)x_4or overline(x_1)x_2overline(x_3)overline(x_4)or overline(x_1)x_2overline(x_3)x_4or overline(x_1)x_2x_3overline(x_4)or overline(x_1)x_2x_3x_4 or x_1overline(x_2)overline(x_3)overline(x_4) or x_1 overline(x_2)x_3overline(x_4)or x_1x_2overline(x_3)overline(x_4)or x_1x_2x_3overline(x_4)or x_1x_2x_3x_4$ \
\
Primimplikanten: $overline(x_1)overline(x_3) or x_2x_3 or x_1 overline(x_4) or x_2 overline(x_4) or overline(x_1)x_2 or overline(x_3) overline(x_4)$
\
\
i) $"cost"(f) = "cost"("alle_min") = ("cost"_1, "cost"_2) = (abs("Mon"), abs("lit")) = (11, 4)$\
ii) $"cost"(f) = "cost"("primim") = ("cost"_1, "cost"_2) = (abs("Mon"), abs("lit")) = (6, 4)$\


#v(10pt)
= Aufgabe 4

$z. Z: m, m' "Monome" in B E(X_n), m <= m' -> "lit"(m') in "lit"(m)$ \
Annahme
