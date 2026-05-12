#import "polylux/src/polylux.typ": *
#import "polylux/src/toolbox/toolbox.typ"

#let GoogleBlue = rgb(66, 133, 244)
#let GoogleRed = rgb(234, 67, 53)
#let GoogleYellow = rgb(251, 188, 5)
#let GoogleGreen = rgb(52, 168, 83)
#let GoogleDark = rgb(32, 33, 36)
#let GoogleGray = rgb(95, 99, 104)
#let GoogleLightGray = rgb(241, 243, 244)

#let google-gradient = gradient.linear(
  angle: 0deg,
  rgb("#4285f4"), 
  rgb("#b181db"), 
  rgb("#e04d50"), 
  rgb("#ff902a"), 
  rgb("#debe0f"), 
  rgb("#5fb641"), 
  rgb("#2eaca0")
)

#let googley-theme(
  aspect-ratio: "16-9",
  short-author: none,
  short-title: none,
  short-date: none,
  body
) = {
  set page(
    paper: "presentation-" + aspect-ratio,
    margin: (top: 2.5cm, bottom: 2cm, x: 1.5cm),
    background: [
      #place(bottom, rect(width: 100%, height: 0.3cm, fill: google-gradient))
    ],
    footer: [
      #set align(bottom)
      #pad(bottom: 0.5cm, left: -0.5cm, right: -0.5cm)[
        #grid(
          columns: (1fr, 1fr),
          align(left + bottom)[#pad(bottom: 0.1cm)[#image("newchromelogo.png", height: 1.0cm)]],
          align(right + bottom)[
            #pad(bottom: 0.4cm)[#text(size: 14pt, fill: GoogleDark)[#toolbox.slide-number]]
          ]
        )
      ]
    ]
  )

  set text(size: 22pt, font: "Google Sans", fill: GoogleDark, tracking: -0.01em)
  set par(leading: 0.45em)
  set list(marker: text(fill: GoogleBlue)[•], spacing: 1.2em)

  body
}

#let title-slide(
  title: [],
  subtitle: none,
  author: none,
  date: none,
) = slide[
  #set page(
    header: none,
    footer: none,
    margin: (top: 1.5cm, bottom: 2cm, x: 2cm),
    background: [
      #place(bottom, rect(width: 100%, height: 0.3cm, fill: google-gradient))
      #place(top + left, dx: 2cm, dy: 1.2cm)[#image("newchromelogo.png", height: 1.2cm)]
    ]
  )
  #set align(left + horizon)
  #block(width: 90%)[
    #v(1.5cm)
    
    #text(size: 55pt, weight: 700, fill: GoogleDark)[#title]

    #if subtitle != none [
      #text(size: 22pt, weight: 400, fill: GoogleGray)[#subtitle]
    ]

    #v(0.5cm)

    #text(size: 18pt, weight: 500, fill: GoogleDark)[#author] \
    #text(size: 18pt, weight: 400, fill: GoogleGray)[#date]
  ]
]

#let googley-slide(title: none, body) = slide[
  #set page(
    header: [
      #if title != none {
        place(top + left, dy: 1cm, dx: 0cm)[
          #text(size: 36pt, weight: 500, fill: rgb(66, 133, 244))[#title]
        ]
      }
    ]
  )
  #set align(top)
  #pad(top: 0.8cm)[
    #body
  ]
]

#let googley-card(title: none, accent: rgb(66, 133, 244), height: auto, body) = {
  block(
    width: 100%,
    height: height,
    fill: GoogleLightGray,
    radius: 0.5em,
    inset: 0.8em,
    spacing: 0.4em,
    stroke: (left: (thickness: 0.4em, paint: accent))
  )[
    #if title != none {
      text(size: 0.65em, weight: 600, fill: accent)[#upper(title)]
      v(0.2em)
    }
    #set text(size: 20pt)
    #body
  ]
}
