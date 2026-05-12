#import "googley-theme.typ": *

#show: googley-theme.with(
  short-author: "Aviator",
  short-title: "The Little Prince",
  short-date: "May 13, 2026"
)

#title-slide(
  title: [The Little Prince],
  subtitle: [
    #text(fill: GoogleBlue, weight: 500)[go/b612] 
    Reflections on childhood, adulthood, and invisible sheep
  ],
  author: [Program Review | May 13, 2026],
  date: [The Aviator]
)

#googley-slide(title: "Chapter 1: The Boa Constrictor")[
  #googley-card(title: "The Vision", accent: GoogleRed)[
    A drawing of a boa constrictor digesting an elephant. Not a hat.
  ]
  #v(0.3em)
  #googley-card(title: "The Adult Problem", accent: GoogleYellow)[
    Adults never understand anything by themselves, and it is tiresome for children to be always and forever explaining things to them.
  ]
]

#googley-slide(title: "Chapter 2: The Encounter")[
  #googley-card(title: "The Sahara", accent: GoogleBlue)[
    Six years ago, I had an accident with my plane in the Desert of Sahara. Something was breaking in my engine.
  ]
  #v(0.3em)
  #googley-card(title: "The Request", accent: GoogleGreen)[
    "Please... draw me a sheep!"
  ]
]

#googley-slide(title: "The Perfect Sheep")[
  #googley-card(title: "Iteration 1-3", accent: GoogleRed)[
    Too sickly, too old, or actually a ram. All rejected.
  ]
  #v(0.3em)
  #googley-card(title: "The Solution", accent: GoogleBlue)[
    The sheep you asked for is inside this box.
  ]
]

#googley-slide(title: "Chapter 3: Origin Story")[
  #googley-card(title: "Asteroid B-612", accent: GoogleYellow)[
    It was with considerable difficulty that I eventually learned that the planet the little prince came from was scarcely any larger than a house.
  ]
]
