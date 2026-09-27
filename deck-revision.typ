#import "open-sans-bluegreen-theme.typ": *

#show: open-sans-bluegreen-theme.with(
  short-author: "Sangwhan Moon",
  short-title: "Harnesses & Multi-Agent Orchestration",
  short-date: "2026"
)

#set par(leading: 0.58em)
#set list(spacing: 0.62em)

#let cite(body) = [
  #v(0.1em)
  #text(size: 10pt, fill: GoogleGray)[#body]
]

#let googley-card(title: none, accent: GoogleBlue, height: auto, body) = {
  block(
    width: 100%,
    height: height,
    fill: GoogleLightGray,
    radius: 0.5em,
    inset: (x: 0.82em, y: 0.68em),
    spacing: 0.5em,
    stroke: (left: (thickness: 0.4em, paint: accent))
  )[
    #if title != none {
      text(size: 0.65em, weight: 600, fill: accent)[#upper(title)]
      v(0.26em)
    }
    #set text(size: 18.5pt)
    #set par(leading: 0.64em)
    #set list(spacing: 0.68em)
    #body
  ]
}

#let meme-panel(path, top, bottom, accent: GoogleBlue, height: 5.35cm, image-width: 100%) = block(
  width: 100%,
  height: height,
  fill: white,
  radius: 0.35em,
  inset: (x: 0.42em, y: 0.34em),
  stroke: (paint: rgb("#dadce0"), thickness: 0.9pt),
)[
  #set align(center)
  #text(size: 13pt, weight: 800, fill: accent)[#upper(top)]
  #v(0.12em)
  #image(path, width: image-width, height: height - 1.35cm, fit: "contain")
  #v(0.08em)
  #text(size: 12.2pt, weight: 700, fill: GoogleDark)[#bottom]
]

#let impact-tile(title, body, accent: GoogleBlue) = block(
  width: 100%,
  height: 2.55cm,
  fill: white,
  radius: 0.32em,
  inset: (x: 0.45em, y: 0.34em),
  stroke: (top: (thickness: 0.18em, paint: accent), rest: (paint: rgb("#dadce0"), thickness: 0.8pt)),
)[
  #text(size: 11pt, weight: 800, fill: accent)[#upper(title)]
  #v(0.1em)
  #text(size: 12.5pt, fill: GoogleDark)[#body]
]

#let node(label, accent: GoogleBlue, width: auto) = box(
  width: width,
  inset: (x: 0.45em, y: 0.25em),
  radius: 0.28em,
  fill: white,
  stroke: (paint: accent, thickness: 1.2pt),
)[#text(size: 13pt, weight: 600, fill: GoogleDark)[#label]]

#let arrow = text(size: 14pt, fill: GoogleGray)[→]

#let ratchet-stage(title, detail, accent: GoogleBlue) = block(
  width: 100%,
  fill: GoogleLightGray,
  radius: 0.35em,
  inset: (x: 0.55em, y: 0.38em),
  stroke: (left: (thickness: 0.22em, paint: accent)),
)[
  #text(size: 12pt, weight: 700, fill: accent)[#upper(title)]
  #v(0.12em)
  #text(size: 13pt, fill: GoogleDark)[#detail]
]

#let mini-chip(label, accent: GoogleBlue) = box(
  inset: (x: 0.35em, y: 0.16em),
  radius: 0.25em,
  fill: white,
  stroke: (paint: accent, thickness: 0.9pt),
)[#text(size: 10.5pt, weight: 600, fill: GoogleDark)[#label]]

#let mini-flow(items, accent: GoogleBlue) = align(center)[
  #for item in items.enumerate() {
    let i = item.at(0)
    let label = item.at(1)
    mini-chip(label, accent: accent)
    if i < items.len() - 1 {
      h(0.16em)
      text(size: 11pt, fill: GoogleGray)[→]
      h(0.16em)
    }
  }
]

#let project-thumb(title, accent, body) = block(
  width: 100%,
  height: 1.26cm,
  inset: 0.28em,
  radius: 0.3em,
  fill: white,
  stroke: (paint: accent, thickness: 0.9pt),
)[
  #set text(size: 8.5pt, font: "DejaVu Sans Mono")
  #text(weight: 700, fill: accent)[#title]
  #v(0.08em)
  #text(fill: GoogleGray)[#body]
]

#let agent-tile(name, role, accent) = block(
  width: 100%,
  height: 1.42cm,
  inset: (x: 0.34em, y: 0.24em),
  radius: 0.28em,
  fill: white,
  stroke: (paint: accent, thickness: 1pt),
)[
  #text(size: 10.5pt, weight: 800, fill: accent)[#upper(name)]
  #v(0.04em)
  #text(size: 10.5pt, fill: GoogleDark)[#role]
]

#let process-tile(title, body, accent) = block(
  width: 100%,
  height: 1.56cm,
  inset: (x: 0.38em, y: 0.26em),
  radius: 0.28em,
  fill: white,
  stroke: (paint: accent, thickness: 1pt),
)[
  #text(size: 9.8pt, weight: 800, fill: accent)[#upper(title)]
  #v(0.04em)
  #text(size: 10.4pt, fill: GoogleDark)[#body]
]

#let section-slide(title, subtitle, accent: GoogleBlue) = slide[
  #set page(
    header: none,
    footer: none,
    margin: (top: 1.5cm, bottom: 1.5cm, x: 2cm),
    background: [
      #rect(width: 100%, height: 100%, fill: GoogleDark)
      #place(bottom, rect(width: 100%, height: 0.3cm, fill: google-gradient))
    ],
  )
  #set align(left + horizon)
  #block(width: 88%)[
    #text(size: 18pt, weight: 700, fill: accent)[SECTION]
    #v(0.35cm)
    #text(size: 50pt, weight: 700, fill: white)[#title]
    #v(0.35cm)
    #text(size: 22pt, fill: rgb("#dadce0"))[#subtitle]
  ]
]

#let diagram(body) = [
  #v(0.25em)
  #block(width: 100%, fill: white, radius: 0.4em, inset: 0.38em, stroke: (paint: rgb("#dadce0"), thickness: 0.8pt))[
    #set text(size: 13pt)
    #body
  ]
]

#let refline(n, body) = [
  #text(size: 9pt, fill: GoogleDark)[#strong[#n] #body]
  #v(0.06em)
]

#title-slide(
  title: [Harnesses and Multi-Agent Orchestration],
  subtitle: [
    From a LLM to a single agent to agentic teams
  ],
  author: [Sangwhan Moon],
  date: [June 22, 2026]
)

#googley-slide(title: "Who I Am")[
  #set text(size: 24pt)
  #set list(spacing: 0.72em)
  - Software Engineering Manager at Google, working on Chrome.
  - Ph.D in artificial intelligence; thesis on Korean tokenization in LLMs.
  - Part-time hobbyist researcher focused on LLM post-training, tokenization, and representation learning.
  #v(0.45em)
  #cite[#link("https://www.sangwhan.com/about")[sangwhan.com/about]]
]

// #section-slide(
//   [Harnesses 101],
//   [Control loops make LLMs usable.],
//   accent: GoogleBlue,
// )

#googley-slide(title: "What Is a Language Model?")[
  #grid(columns: (1fr, 1fr), gutter: 0.45cm)[
    #googley-card(title: "THE OBJECTIVE", accent: GoogleRed, height: 6.8cm)[
      #set text(size: 17pt)
      - Estimate a distribution over the next word/token.
      - Condition on the prefix observed so far.
      - Generation samples, appends, and repeats.
    ]
  ][
    #googley-card(title: "RNN REGIME", accent: GoogleYellow, height: 6.8cm)[
      #align(center)[
        #node[$w_1$] #h(0.15em) #arrow #h(0.15em)
        #node[$h_1$] #h(0.15em) #arrow #h(0.15em)
        #node[$h_2$] #h(0.15em) #arrow #h(0.15em)
        #node[$h_(t - 1)$] #h(0.15em) #arrow #h(0.15em)
        #node[$P_t$]
        #v(0.4em)
        #text(fill: GoogleGray, size: 15pt)[prefix compressed into recurrent state]
        #v(0.2em)
        #text(fill: GoogleBlue, size: 16pt)[$h_t = f(h_(t - 1), x_t)$]
        #v(0.16em)
        #text(fill: GoogleGreen, size: 16pt)[$P_t = "softmax"(W h_t)$]
      ]
    ]
  ]
  #diagram[
    #align(center)[
      #text(size: 20pt, fill: GoogleGray)[$P_t(w_t | (w_1, dots.c, w_(t - 1)) in cal(V)^(t - 1))$]
    ]
  ]
]

#googley-slide(title: "From RNNs to Transformers")[
  #grid(columns: (1fr, 1fr), gutter: 0.45cm)[
    #googley-card(title: "RNN BOTTLENECK", accent: GoogleRed, height: 7.6cm)[
      - Prefix flows through one recurrent state.
      - Training is sequential across positions.
      - Scaling is bottlenecked by recurrence and compression.
      #v(0.25em)
      #mini-flow(([$w_1$], [$h_1$], [$h_2$], [$h_(t - 1)$], [$P_t$]), accent: GoogleRed)
    ]
  ][
    #googley-card(title: "TRANSFORMER DELTA", accent: GoogleGreen, height: 7.6cm)[
      - Tokens attend directly to other tokens.
      - Positions train in parallel on accelerators.
      - Scale becomes a practical lever.
      #v(0.25em)
      #mini-flow(("tokens", "attention", "MLP", "next token"), accent: GoogleGreen)
    ]
  ]
  #diagram[
    #align(center)[
      #text(size: 13.6pt, fill: GoogleGray)[Scale is the relevance: attention removed enough sequential bottleneck for predictable compute/data/model scaling to work.]
    ]
  ]
  #place(bottom + left, dy: -0.72cm)[#text(size: 8.5pt, fill: GoogleGray)[Vaswani et al. 2017 [1]; Kaplan et al. 2020 [22]; Hoffmann et al. 2022 [23]]]
]

#googley-slide(title: "How Models Are Built")[
  #grid(columns: (1fr, 1fr), gutter: 0.42cm)[
    #googley-card(title: "PRE-TRAINING", accent: GoogleBlue, height: 3.85cm)[
      #set text(size: 17.2pt)
      #set par(leading: 0.58em)
      Broad next-token competence from large-scale data.
    ]
    #v(0.18em)
    #googley-card(title: "MID-TRAINING (OPTIONAL)", accent: GoogleRed, height: 3.85cm)[
      #set text(size: 17.2pt)
      #set par(leading: 0.58em)
      Common now: adapt behavior for code, math, long context, or domains.
    ]
  ][
    #googley-card(title: "POST-TRAINING", accent: GoogleYellow, height: 3.85cm)[
      #set text(size: 17.2pt)
      #set par(leading: 0.58em)
      SFT and preference optimization teach instruction-following behavior.
    ]
    #v(0.18em)
    #googley-card(title: "PRODUCTION", accent: GoogleGreen, height: 3.85cm)[
      #set text(size: 17.2pt)
      #set par(leading: 0.58em)
      Product systems wrap the model with policy, tools, and constraints.
    ]
  ]
]

#googley-slide(title: "Base Model to Agent")[
  #grid(columns: (1fr, 1fr), gutter: 0.45cm)[
    #googley-card(title: "WHAT GETS ADDED", accent: GoogleBlue)[
      - Instruction tuning
      - Tool schemas
      - System prompt
    ]
  ][
    #googley-card(title: "WHY IT CHANGES BEHAVIOR", accent: GoogleRed)[
      - Model asks; harness executes
      - Harness runs the loop
      - Side effects stay controlled
    ]
  ]
  #diagram[
    #align(center)[
      #node[base model] #h(0.35em) #arrow #h(0.35em)
      #node[SFT] #h(0.35em) #arrow #h(0.35em)
      #node[tool use] #h(0.35em) #arrow #h(0.35em)
      #node[system prompt] #h(0.35em) #arrow #h(0.35em)
      #node[harness]
    ]
  ]
]

#googley-slide(title: "What the Harness Owns")[
  #grid(columns: (1fr, 1fr), gutter: 0.45cm)[
    #googley-card(title: "CONTROL LOOP", accent: GoogleYellow, height: 6cm)[
      - Manages message history.
      - Sends tool schemas to the model.
      - Executes tool calls and appends results.
    ]
  ][
    #googley-card(title: "SECURITY BOUNDARY", accent: GoogleGreen, height: 6cm)[
      - Ask, approve, block
      - Model proposes actions
      - Harness owns execution
    ]
  ]
  #cite[Example basic harness: #link("http://github.com/cynthia/kodex")[github.com/cynthia/kodex]]
]

#googley-slide(title: "Multi-Turn Tool Use")[
  #grid(columns: (1.1fr, 0.9fr), gutter: 0.45cm)[
    #googley-card(title: "INTERACTION TRACE", accent: GoogleBlue, height: 7cm)[
      #text(size: 14pt, font: "DejaVu Sans Mono")[
        user: "Find failing tests."\
        assistant: tool_call(run_tests, \{\})\
        tool: "2 failures in parser_test"\
        assistant: tool_call(read_file, \{path\})\
        tool: "parser edge case..."\
        assistant: "Patch the parser..."
      ]
    ]
  ][
    #googley-card(title: "WHAT CHANGES", accent: GoogleRed, height: 7cm)[
      - Results become next-turn evidence
      - Tool errors become state
      - The harness appends ground truth
      - Multi-turn drift can compound
    ]
  ]
  #cite[#link("https://openreview.net/forum?id=WE_vluYUL-X")[ReAct] (Yao et al., ICLR 2023) [5]; #link("https://arxiv.org/abs/2302.04761")[Toolformer] (Schick et al., arXiv 2023) [20]]
]

// #section-slide(
//   [Limits of Single Agents],
//   [One session. One window. Growing liability.],
//   accent: GoogleRed,
// )

#googley-slide(title: "Single-Agent Harnesses Hit a Ceiling")[
  #grid(columns: (0.95fr, 1.05fr), gutter: 0.45cm)[
    #googley-card(title: "THE BOTTLENECK", accent: GoogleYellow, height: 10.0cm)[
      - One window
      - One trajectory
      - One lens
      - Early mistakes compound
    ]
  ][
    #block(
      width: 100%,
      height: 10.0cm,
      fill: white,
      radius: 0.35em,
      inset: 0.42em,
      stroke: (paint: rgb("#dadce0"), thickness: 0.9pt),
    )[
      #align(center + horizon)[
        #image("deck-assets/context-window-meme.png", width: 80%, fit: "contain")
      ]
    ]
  ]
  #place(bottom + left, dy: -0.72cm)[#text(size: 8.5pt, fill: GoogleGray)[#link("https://aclanthology.org/2024.acl-long.172/")[LongBench] (Bai et al., ACL 2024) [7]; #link("https://openreview.net/forum?id=VKGTGGcwl6")[LLMs Get Lost In Multi-Turn Conversation] (Laban et al., ICLR 2026) [13]]]
]

#googley-slide(title: "Context Is Capacity, Not Control")[
  #grid(columns: (1fr, 1fr), gutter: 0.45cm)[
    #googley-card(title: "A WINDOW HAS", accent: GoogleGreen, height: 6cm)[
      - Instructions
      - Files, logs, and tool output
      - Prior mistakes and assumptions
    ]
  ][
    #googley-card(title: "A PLAN ADDS", accent: GoogleBlue, height: 6cm)[
      - Ordering
      - Dependencies
      - State boundaries
      - Explicit handoffs
    ]
  ]
  #cite[#link("https://aclanthology.org/2024.tacl-1.9/")[Lost in the Middle] (Liu et al., TACL 2024) [14]]
]

#googley-slide(title: "Long Inputs Degrade Attention in Practice")[
  #grid(columns: (1fr, 1fr, 1fr), gutter: 0.35cm)[
    #googley-card(title: "NEEDLE TESTS", accent: GoogleRed, height: 8cm)[
      - Position-sensitive failures
      - Longer windows still have cliffs
    ]
  ][
    #googley-card(title: "REAL TASKS", accent: GoogleYellow, height: 8cm)[
      - LongBench spans QA, summary, code
      - Compression helps, risk remains
    ]
  ][
    #googley-card(title: "CAVEAT", accent: GoogleGreen, height: 8cm)[
      - Sparse attention changes scaling
      - It does not create a plan
      - Organization still matters
    ]
  ]
  #cite[#link("https://aclanthology.org/2024.acl-long.172/")[LongBench] (Bai et al., ACL 2024) [7]; #link("https://aclanthology.org/2024.tacl-1.9/")[Lost in the Middle] (Liu et al., TACL 2024) [14]]
]

#googley-slide(title: "Long Agent Chains Accumulate Errors")[
  #grid(columns: (1fr, 1fr), gutter: 0.45cm)[
    #googley-card(title: "CHAIN RISK", accent: GoogleGreen)[
      - New state every step
      - Bad assumptions stick
      - Early drift steers the run
    ]
  ][
    #googley-card(title: "MULTI-TURN RISK", accent: GoogleBlue)[
      - Reliability drops across turns
      - Often interaction failure, not capability failure
    ]
  ]
  #diagram[
    #grid(columns: (1fr, auto, 1fr, auto, 1fr), gutter: 0.2cm, align: horizon)[
      #ratchet-stage("Tool call", [reads files, runs command], accent: GoogleGreen)
    ][
      #arrow
    ][
      #ratchet-stage("Written state", [summary + assumptions], accent: GoogleYellow)
    ][
      #arrow
    ][
      #ratchet-stage("Next turn", [state becomes context], accent: GoogleRed)
    ]
    #v(0.25em)
    #align(center)[
      #text(size: 12.5pt, fill: GoogleGray)[step 1 → small drift → more drift → wrong branch]
    ]
  ]
  #cite[#link("https://openreview.net/forum?id=WE_vluYUL-X")[ReAct] (Yao et al., ICLR 2023) [5]; #link("https://openreview.net/forum?id=VKGTGGcwl6")[LLMs Get Lost In Multi-Turn Conversation] (Laban et al., ICLR 2026) [13]]
]

#googley-slide(title: "Decomposition Is the Escape Hatch")[
  #grid(columns: (1fr, 1fr), gutter: 0.45cm)[
    #googley-card(title: "WHAT WORKS", accent: GoogleRed)[
      - Split the task
      - Match role + context
      - Pass forward only what matters
    ]
  ][
    #googley-card(title: "WHY MODELS ARE GOOD AT IT", accent: GoogleYellow)[
      - Strong at structure
      - Good with intermediates
      - L2M / ToT hint at the pattern
    ]
  ]
  #diagram[
    #align(center)[
      #node[large task] #h(0.45em) #arrow #h(0.45em)
      #node[A] #h(0.2em) #node[B] #h(0.2em) #node[C] #h(0.45em)
      #arrow #h(0.45em) #node[synthesis]
      #v(0.22em)
      #text(size: 12.2pt, fill: GoogleGray)[divide-and-conquer lowers interference; synthesis carries the risk]
    ]
  ]
  #cite[#link("https://openreview.net/forum?id=WZH7099tgfM")[Least-to-Most] (Zhou et al., ICLR 2023) [4]; #link("https://openreview.net/forum?id=5Xc1ecxO1h")[Tree of Thoughts] (Yao et al., NeurIPS 2023) [6]]
]

// #section-slide(
//   [Multi-Agent Ensembles],
//   [Diversity first. Synthesis later.],
//   accent: GoogleGreen,
// )

#googley-slide(title: "Multi-Agents and Ensemble Inspiration")[
  #grid(columns: (0.95fr, 1.05fr), gutter: 0.45cm)[
    #googley-card(title: "CORE CLAIM", accent: GoogleGreen, height: 10cm)[
      - Test-time ensemble
      - Roles + tools + memory boundaries
      - Error diversity is the asset
      - Diversity first, synthesis later
      #v(0.35em)
      #text(size: 12pt, fill: GoogleGray)[trajectory = f(model, role, context, tools)]
      #v(0.12em)
      #text(size: 12pt, fill: GoogleGray)[idealized: independent errors shrink as p^k]
      #v(0.12em)
      #text(size: 12pt, fill: GoogleRed)[real agents are correlated; diversify context]
    ]
  ][
    #block(
      width: 100%,
      height: 10cm,
      fill: white,
      radius: 0.35em,
      inset: 0.18em,
      stroke: (paint: rgb("#dadce0"), thickness: 0.9pt),
    )[
      #align(center + horizon)[
        #image("deck-assets/multi-agent-ensemble-nano-banana.png", width: 100%, height: 9.55cm, fit: "contain")
      ]
    ]
  ]
  #cite[#link("https://openreview.net/forum?id=1PL1NIMMrw")[Self-Consistency] (Wang et al., ICLR 2023) [3]; #link("https://openreview.net/forum?id=bgzUSZ8aeg")[More Agents Is All You Need] (Li et al., TMLR 2024) [10]]
]

#googley-slide(title: "Voting Beats One Guess When Errors Differ")[
  #grid(columns: (1fr, 1fr), gutter: 0.45cm)[
    #googley-card(title: "SAMPLE DIVERSITY", accent: GoogleGreen, height: 8cm)[
      - Self-Consistency samples multiple reasoning paths.
      - It selects the answer that is most consistent across paths.
      - Gains depend on task difficulty and error diversity.
    ]
  ][
    #googley-card(title: "AGENT FOREST", accent: GoogleBlue, height: 8cm)[
      - More Agents Is All You Need scales the same intuition to instantiated agents.
      - Parallel attempts are cheap when orchestration is automated.
    ]
  ]
  #diagram[
    #align(center)[
      #node[path A] #h(0.25em) #node[path B] #h(0.25em) #node[path C]
      #h(0.5em) #arrow #h(0.5em) #node[consistent answer]
    ]
  ]
  #place(bottom + left, dy: -0.72cm)[#text(size: 8.5pt, fill: GoogleGray)[#link("https://openreview.net/forum?id=1PL1NIMMrw")[Self-Consistency] (Wang et al., ICLR 2023) [3]; #link("https://openreview.net/forum?id=bgzUSZ8aeg")[More Agents Is All You Need] (Li et al., TMLR 2024) [10]]]
]

#googley-slide(title: "Specialization Can Beat One Generalist")[
  #grid(columns: (1fr, 1fr), gutter: 0.45cm)[
    #googley-card(title: "ROLE FIT", accent: GoogleRed)[
      - Different roles, different strengths
      - Keep diversity to the merge
      - Assign by failure mode
    ]
  ][
    #googley-card(title: "FUSION", accent: GoogleYellow)[
      - Rank candidates
      - Fuse best fragments
      - Late merge beats early collapse
    ]
  ]
  #diagram[
    #align(center)[
      #node[architect] #h(0.2em) #node[qa] #h(0.2em) #node[security] #h(0.2em) #node[performance]
      #h(0.55em) #arrow #h(0.55em) #node[synthesizer]
    ]
  ]
  #cite[#link("https://aclanthology.org/2023.acl-long.792/")[LLM-Blender] (Jiang et al., ACL 2023) [11]; #link("https://openreview.net/forum?id=h0ZfDIrj7T")[Mixture-of-Agents] (Wang et al., ICLR 2025) [12]]
]

#googley-slide(title: "Debate Adds Friction")[
  #grid(columns: (1fr, 1fr), gutter: 0.45cm)[
    #googley-card(title: "DELIBERATION", accent: GoogleGreen, height: 6cm)[
      - Chain-of-thought exposes intermediate steps.
      - Tree of Thoughts searches paths before committing.
    ]
  ][
    #googley-card(title: "GROUNDING", accent: GoogleBlue, height: 6cm)[
      - ReAct interleaves reasoning and action.
      - Collaboration externalizes deliberation across workers.
    ]
  ]
  #cite[#link("https://proceedings.neurips.cc/paper/2022/hash/9d5609613524ecf4f15af0f7b31abca4-Abstract-Conference.html")[Chain-of-Thought] (Wei et al., NeurIPS 2022) [2]; #link("https://openreview.net/forum?id=WE_vluYUL-X")[ReAct] (Yao et al., ICLR 2023) [5]; #link("https://openreview.net/forum?id=5Xc1ecxO1h")[Tree of Thoughts] (Yao et al., NeurIPS 2023) [6]]
]

#googley-slide(title: "Small Contexts Can Help")[
  #grid(columns: (1fr, 1fr), gutter: 0.45cm)[
    #googley-card(title: "WHY IT WORKS", accent: GoogleRed, height: 6cm)[
      - If split preserves signal
      - Smaller prompts, fewer distractions
      - Narrower checklists
      - Disagreements surface early
    ]
  ][
    #googley-card(title: "WHERE IT FAILS", accent: GoogleYellow, height: 6cm)[
      - Weak synthesis = more text
      - Orchestration decides reliability
    ]
  ]
  #diagram[
    #align(center)[
      #text(size: 12.4pt, fill: GoogleGray)[SNR improves only when decomposition removes distractors without losing evidence]
    ]
  ]
  #cite[#link("https://aclanthology.org/2024.acl-long.172/")[LongBench] (Bai et al., ACL 2024) [7]; #link("https://openreview.net/forum?id=bgzUSZ8aeg")[More Agents Is All You Need] (Li et al., TMLR 2024) [10]; #link("https://aclanthology.org/2023.acl-long.792/")[LLM-Blender] (Jiang et al., ACL 2023) [11]; #link("https://openreview.net/forum?id=h0ZfDIrj7T")[Mixture-of-Agents] (Wang et al., ICLR 2025) [12]]
]

#googley-slide(title: "Recent Industry Trends")[
  #grid(columns: (1fr, 1fr, 1fr), gutter: 0.35cm)[
    #googley-card(title: "SAKANA FUGU", accent: GoogleBlue, height: 4.75cm)[
      #set text(size: 16pt)
      Multi-agent system as one model API.      Coordinates a model pool.
    ]
  ][
    #googley-card(title: "GEMINI DEEP RESEARCH", accent: GoogleRed, height: 4.75cm)[
      #set text(size: 16pt)
      Plan → browse → refine → report.      Agentic research with source links.
    ]
  ][
    #googley-card(title: "OPENROUTER FUSION", accent: GoogleGreen, height: 4.75cm)[
      #set text(size: 16pt)
      Parallel model panel plus judge.      Consensus, gaps, and blind spots.
    ]
  ]
  #v(0.3em)
  #align(center)[#text(size: 12.5pt, fill: GoogleGray)[Industry signals, not proof of this architecture.]]
  #v(0.12em)
  #cite[#link("https://sakana.ai/fugu/")[Sakana Fugu] · #link("https://blog.google/products-and-platforms/products/gemini/google-gemini-deep-research/")[Gemini Deep Research] · #link("https://openrouter.ai/docs/guides/routing/routers/fusion-router")[OpenRouter Fusion Router]]
]

#googley-slide(title: "Where This Differs")[
  #grid(columns: (1fr, 1fr, 1fr), gutter: 0.35cm)[
    #googley-card(title: "MODEL COMPOSITION", accent: GoogleBlue, height: 7.7cm)[
      #set text(size: 15.4pt)
      - Merge or coordinate model capabilities
      - Unit of work: model output
      - Goal: stronger answer behind one API
    ]
  ][
    #googley-card(title: "RESEARCH AGENTS", accent: GoogleRed, height: 7.7cm)[
      #set text(size: 15.4pt)
      - Plan, browse, summarize, cite
      - Unit of work: research report
      - Goal: better information synthesis
    ]
  ][
    #googley-card(title: "THIS HARNESS", accent: GoogleGreen, height: 7.7cm)[
      #set text(size: 14.2pt)
      - Run workers in disposable workspaces
      - Unit of work: executable change
      - Optimizes process reliability
      - Goal: visible work, explicit synthesis
    ]
  ]
  #diagram[
    #align(center)[
      #text(size: 13.4pt, fill: GoogleGray)[This narrows the scope from general agent composition to executable software work.]
    ]
  ]
]

// #section-slide(
//   [finb Design Decisions],
//   [Cheap failure. Visible work. Explicit synthesis.],
//   accent: GoogleYellow,
// )

#googley-slide(title: "Design Around Failure")[
  #grid(columns: (1fr, 1fr, 1fr), gutter: 0.35cm)[
    #googley-card(title: "LOCKDOWN", accent: GoogleBlue, height: 5cm)[
      Safe, but the human becomes the bottleneck.
    ]
  ][
    #googley-card(title: "YOLO", accent: GoogleRed, height: 5cm)[
      Fast, but one bad command can destroy the workspace.
    ]
  ][
    #googley-card(title: "REVERSIBLE", accent: GoogleYellow, height: 5cm)[
      Agents get freedom inside a workspace that can roll back instantly.
    ]
  ]
  #diagram[
    #align(center)[
      #text(fill: GoogleGray)[Target: controlled blast radius, not constant approval.]
    ]
  ]
]

#googley-slide(title: "Safe-to-Destruct Workspaces")[
  #grid(columns: (0.95fr, 1.05fr), gutter: 0.45cm)[
    #googley-card(title: "ZFS SNAPSHOTS", accent: GoogleGreen, height: 5cm)[
      - Copy-on-write workspace
      - Near-instant rollback
    ]
    #v(0.05em)
    #googley-card(title: "CHROOT", accent: GoogleBlue, height: 5cm)[
      - Filesystem boundary
      - Commit or rollback stays explicit
    ]
  ][
    #block(
      width: 100%,
      height: 10cm,
      fill: white,
      radius: 0.35em,
      inset: 0cm,
      stroke: (paint: rgb("#dadce0"), thickness: 0.9pt),
    )[
      #align(center + horizon)[
        #image("deck-assets/safe-to-destruct-relatable-panel.png", width: 100%, height: 10cm, fit: "contain")
      ]
    ]
  ]
]

#googley-slide(title: "Agent Teams Are a DAG")[
  #grid(columns: (1fr, 1fr), gutter: 0.45cm)[
    #googley-card(title: "PHASES", accent: GoogleRed, height: 6cm)[
      - Plan → phase → synthesize
      - Dependencies stay explicit
      - Handoffs are serialized state
    ]
  ][
    #googley-card(title: "PARALLELISM", accent: GoogleYellow, height: 6cm)[
      - Concurrent tasks
      - Bounded context
      - Side effects stay bounded
      - Reuse good work
    ]
  ]
  #diagram[
    #align(center)[
      #node[plan] #h(0.3em) #arrow #h(0.3em)
      #node[phase 1 agents] #h(0.3em) #arrow #h(0.3em)
      #node[synthesis] #h(0.3em) #arrow #h(0.3em)
      #node[phase 2 agents] #h(0.3em) #arrow #h(0.3em)
      #node[final]
    ]
  ]
]

#googley-slide(title: "Example")[
  #grid(columns: (0.78fr, 1.22fr), gutter: 0.45cm)[
    #googley-card(title: "SOFTWARE TEAM", accent: GoogleBlue, height: 10cm)[
      #grid(columns: (1fr, 1fr), gutter: 0.2cm)[
        #agent-tile("lead", [plan + tradeoffs], GoogleBlue)
      ][
        #agent-tile("backend", [API + data], GoogleRed)
      ][
        #agent-tile("frontend", [UI + state], GoogleYellow)
      ][
        #agent-tile("qa", [tests + security], GoogleGreen)
      ]
      #v(0.35em)
      #text(size: 12.3pt, fill: GoogleGray)[Named workers get separate context, isolated execution, visible output, and auditable handoffs.]
      #v(0.22em)
      #text(size: 12.3pt, fill: GoogleGray)[Inspired by Gastown's persistent identities, mailboxes, and handoffs.]
    ]
  ][
    #block(width: 100%, height: 10cm, fill: white, radius: 0.35em, inset: 0.42em, stroke: (paint: rgb("#dadce0"), thickness: 0.9pt))[
      #grid(columns: (0.8fr, auto, 0.9fr, auto, 0.95fr), gutter: 0.13cm, align: horizon)[
        #process-tile("1 request", [feature / fix], GoogleBlue)
      ][
        #arrow
      ][
        #process-tile("2 planner", [phased JSON], GoogleRed)
      ][
        #arrow
      ][
        #process-tile("3 review", [human accepts plan], GoogleYellow)
      ]
      #v(0.26em)
      #grid(columns: (0.82fr, auto, 1.32fr), gutter: 0.15cm, align: horizon)[
        #process-tile("4 fan out", [parallel tasks], GoogleGreen)
      ][
        #arrow
      ][
        #grid(columns: (1fr, 1fr), gutter: 0.12cm)[
          #agent-tile("backend", [snapshot + tools], GoogleRed)
        ][
          #agent-tile("frontend", [snapshot + tools], GoogleYellow)
        ][
          #agent-tile("qa", [snapshot + tools], GoogleGreen)
        ][
          #agent-tile("lead", [constraints], GoogleBlue)
        ]
      ]
      #v(0.26em)
      #grid(columns: (1fr, auto, 1fr, auto, 1fr), gutter: 0.13cm, align: horizon)[
        #process-tile("5 mailbox", [named handoffs], GoogleGreen)
      ][
        #arrow
      ][
        #process-tile("6 synthesize", [phase summary], GoogleBlue)
      ][
        #arrow
      ][
        #process-tile("7 continue", [next phase or retry], GoogleRed)
      ]
      #v(0.26em)
      #align(center)[
        #node[final deliverable] #h(0.35em)
        #text(size: 13pt, fill: GoogleGray)[rollback is available at each workspace boundary]
      ]
    ]
  ]
  #cite[#link("https://github.com/gastownhall/gastown")[Gastown] (Gastownhall, GitHub) [21]]
]

#googley-slide(title: "Orchestrator + Mailbox Make a Team")[
  #grid(columns: (1fr, 1fr), gutter: 0.45cm)[
    #googley-card(title: "LEADER / ORCHESTRATOR", accent: GoogleBlue, height: 6cm)[
      - Plans phases and roles
      - Fans work out to agents
      - Synthesizes and gates progress
    ]
  ][
    #googley-card(title: "INTER-AGENT MAIL", accent: GoogleGreen, height: 6cm)[
      - Named handoffs between workers
      - Visible in prompt context
      - Auditable coordination, not hidden state
    ]
  ]
  #diagram[
    #align(center)[
      #node[leader] #h(0.35em) #arrow #h(0.35em)
      #node[phase agents] #h(0.35em) #arrow #h(0.35em)
      #box(inset: (x: 0.65em, y: 0.35em), radius: 0.25em, fill: white, stroke: (paint: GoogleGreen, thickness: 1pt))[
        #text(size: 13pt, weight: 700, fill: GoogleGreen)[MAILBOX]
      ]
      #h(0.45em) #arrow #h(0.45em)
      #node[synthesis + next phase]
    ]
  ]
]

#googley-slide(title: "Synthesis Has Influence Tiers")[
  #grid(columns: (1fr, 1fr, 1fr), gutter: 0.35cm)[
    #googley-card(title: "PRIMARY", accent: GoogleRed, height: 4.5cm)[
      Drives the narrative and owns final coherence.
    ]
  ][
    #googley-card(title: "SUPPORTING", accent: GoogleYellow, height: 4.5cm)[
      Shapes major sections, constraints, and tradeoffs.
    ]
  ][
    #googley-card(title: "CONTRIBUTING", accent: GoogleGreen, height: 4.5cm)[
      Adds evidence, edge cases, and checks.
    ]
  ]
  #diagram[
    #align(center)[
      #node[tiered outputs] #h(0.45em) #arrow #h(0.45em)
      #node([attributed or unified synthesis], width: 6.2cm) #h(0.45em) #arrow #h(0.45em)
      #node[one deliverable]
    ]
  ]
  #cite[#link("https://aclanthology.org/2023.acl-long.792/")[LLM-Blender] (Jiang et al., ACL 2023) [11]; #link("https://openreview.net/forum?id=h0ZfDIrj7T")[Mixture-of-Agents] (Wang et al., ICLR 2025) [12]]
]

#googley-slide(title: "Iteration and Harness Abstraction")[
  #grid(columns: (1fr, 1fr), gutter: 0.45cm)[
    #googley-card(title: "FOLLOW-UP LOOP", accent: GoogleBlue, height: 6cm)[
      - Deliverable → replan → rerun
      - Recursion mechanism for iteration
      - Fresh agents, fresh context
      - Retry only failed work
    ]
  ][
    #googley-card(title: "FOUR LAYERS", accent: GoogleRed, height: 6cm)[
      - TUI
      - Orchestrator
      - Agent manager
      - Harnesses
    ]
  ]
]

// #section-slide(
//   [Example Results],
//   [Concrete multi-file builds, not longer chat.],
//   accent: GoogleBlue,
// )

#googley-slide(title: "Example Projects")[
  #grid(columns: (1fr, 1fr, 1fr), gutter: 0.35cm)[
    #googley-card(title: "TERMNES", accent: GoogleYellow, height: 8.0cm)[
      #project-thumb("termnes", GoogleYellow, [CPU | PPU | mapper | frame])
      #v(0.16em)
      #set text(size: 11.2pt)
      Output: NES emulator\
      CPU, PPU, mappers, renderer
      #v(0.16em)
      #text(size: 10.4pt, fill: GoogleGray)[Input: NES docs + one test ROM]
      #v(0.2em)
      #text(size: 10.7pt, fill: GoogleGray)[#link("https://github.com/cynthia/termnes")[github.com/cynthia/termnes]]
    ]
  ][
    #googley-card(title: "AT3RS", accent: GoogleGreen, height: 8.0cm)[
      #project-thumb("at3rs", GoogleGreen, [bitstream → bands → PCM])
      #v(0.16em)
      #set text(size: 11.2pt)
      Output: ATRAC3 codec\
      niche signal processing
      #v(0.16em)
      #text(size: 10.4pt, fill: GoogleGray)[Input: paper + ref codec via Wine + WAVs]
      #v(0.2em)
      #text(size: 10.7pt, fill: GoogleGray)[#link("https://github.com/cynthia/at3rs")[github.com/cynthia/at3rs]]
    ]
  ][
    #googley-card(title: "SLOPPNG", accent: GoogleBlue, height: 8.0cm)[
      #project-thumb("sloppng", GoogleBlue, [IHDR | IDAT | CRC | CLI])
      #v(0.16em)
      #set text(size: 11.2pt)
      Output: PNG tooling\
      parser, validation, CLI
      #v(0.16em)
      #text(size: 10.4pt, fill: GoogleGray)[Input: W3C PNG specification]
      #v(0.2em)
      #text(size: 10.7pt, fill: GoogleGray)[#link("https://github.com/cynthia/sloppng")[github.com/cynthia/sloppng]]
    ]
  ]
  #diagram[
    #align(center)[
      #text(size: 13.2pt, fill: GoogleGray)[All three reached working implementations in one overnight run.]
    ]
  ]
]

#googley-slide(title: "What the Results Demonstrate")[
  #grid(columns: (1fr, 1fr, 1fr), gutter: 0.35cm)[
    #googley-card(title: "DECOMPOSITION", accent: GoogleRed, height: 5.2cm)[
      Plan → phases → executable work
    ]
  ][
    #googley-card(title: "SPECIALIZATION", accent: GoogleYellow, height: 5.2cm)[
      Experts own formats, rendering, QA
    ]
  ][
    #googley-card(title: "VERIFICATION", accent: GoogleGreen, height: 5.2cm)[
      Review passes catch integration bugs
    ]
  ]
  #v(0.4em)
  #diagram[
    #grid(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.25cm)[
      #impact-tile("Parallel", [separate workers keep context small], accent: GoogleBlue)
    ][
      #impact-tile("Synthesis", [best fragments become one design], accent: GoogleRed)
    ][
      #impact-tile("Integration", [the output becomes a coherent codebase], accent: GoogleYellow)
    ][
      #impact-tile("Verification", [review catches cross-file bugs], accent: GoogleGreen)
    ]
  ]
]

#googley-slide(title: "Why Not Open Source?")[
  #grid(columns: (1fr, 1fr, 1fr), gutter: 0.35cm)[
    #googley-card(title: "OPINIONATED", accent: GoogleBlue, height: 6.2cm)[
      - One workflow
      - Orthodox UI
      - ZFS assumptions
    ]
  ][
    #googley-card(title: "BESPOKE ERA", accent: GoogleRed, height: 6.2cm)[
      - Harnesses age quickly
      - Local loops beat frameworks
      - Adapt before polish
    ]
  ][
    #googley-card(title: "TAKEAWAYS", accent: GoogleGreen, height: 6.2cm)[
      - Design principles
      - Fit your own workflow
      - Build your own loop
    ]
  ]
  #v(0.45em)
  #diagram[
    #align(center)[
      #text(size: 14pt, fill: GoogleGray)[The portable part is the mindset: cheap failure, visible work, explicit synthesis.]
    ]
  ]
]

#slide[
  #set page(
    header: none,
    footer: none,
    margin: (top: 1.5cm, bottom: 1.5cm, x: 2cm),
    background: [
      #rect(width: 100%, height: 100%, fill: GoogleDark)
      #place(bottom, rect(width: 100%, height: 0.3cm, fill: google-gradient))
    ],
  )
  #set align(center + horizon)
  #block(width: 100%)[
    #text(size: 64pt, weight: 700, fill: white)[Questions?]
    #v(0.4cm)
    #text(size: 22pt, fill: rgb("#dadce0"))[Harnesses & Multi-Agent Orchestration]
  ]
]

#googley-slide(title: "References")[
  #set par(leading: 0.15em)
  #grid(columns: (1fr, 1fr), gutter: 0.48cm)[
    #refline[[1]][Ashish Vaswani et al., #link("https://proceedings.neurips.cc/paper/7181-attention-is-all-you-need")[Attention Is All You Need]. NeurIPS 2017.]
    #refline[[2]][Jason Wei et al., #link("https://proceedings.neurips.cc/paper/2022/hash/9d5609613524ecf4f15af0f7b31abca4-Abstract-Conference.html")[Chain-of-Thought Prompting Elicits Reasoning in Large Language Models]. NeurIPS 2022.]
    #refline[[3]][Xuezhi Wang et al., #link("https://openreview.net/forum?id=1PL1NIMMrw")[Self-Consistency Improves Chain of Thought Reasoning in Language Models]. ICLR 2023.]
    #refline[[4]][Denny Zhou et al., #link("https://openreview.net/forum?id=WZH7099tgfM")[Least-to-Most Prompting Enables Complex Reasoning in Large Language Models]. ICLR 2023.]
    #refline[[5]][Shunyu Yao et al., #link("https://openreview.net/forum?id=WE_vluYUL-X")[ReAct: Synergizing Reasoning and Acting in Language Models]. ICLR 2023.]
    #refline[[6]][Shunyu Yao et al., #link("https://openreview.net/forum?id=5Xc1ecxO1h")[Tree of Thoughts: Deliberate Problem Solving with Large Language Models]. NeurIPS 2023.]
    #refline[[7]][Yushi Bai et al., #link("https://aclanthology.org/2024.acl-long.172/")[LongBench: A Bilingual, Multitask Benchmark for Long Context Understanding]. ACL 2024.]
    #refline[[8]][Xiao Liu et al., #link("https://openreview.net/forum?id=zAdUB0aCTQ")[AgentBench: Evaluating LLMs as Agents]. ICLR 2024.]
    #refline[[9]][Shuyan Zhou et al., #link("https://openreview.net/forum?id=oKn9c6ytLx")[WebArena: A Realistic Web Environment for Building Autonomous Agents]. ICLR 2024.]
    #refline[[10]][Junyou Li et al., #link("https://openreview.net/forum?id=bgzUSZ8aeg")[More Agents Is All You Need]. TMLR 2024.]
    #refline[[11]][Dongfu Jiang et al., #link("https://aclanthology.org/2023.acl-long.792/")[LLM-Blender: Ensembling Large Language Models with Pairwise Ranking and Generative Fusion]. ACL 2023.]
  ][
    #refline[[12]][Junlin Wang et al., #link("https://openreview.net/forum?id=h0ZfDIrj7T")[Mixture-of-Agents Enhances Large Language Model Capabilities]. ICLR 2025.]
    #refline[[13]][Philippe Laban et al., #link("https://openreview.net/forum?id=VKGTGGcwl6")[LLMs Get Lost In Multi-Turn Conversation]. ICLR 2026.]
    #refline[[14]][Nelson F. Liu et al., #link("https://aclanthology.org/2024.tacl-1.9/")[Lost in the Middle: How Language Models Use Long Contexts]. TACL 2024.]
    #refline[[15]][Sakana AI, #link("https://sakana.ai/fugu/")[Fugu]. Product page.]
    #refline[[16]][Takuya Akiba et al., #link("https://arxiv.org/abs/2403.13187")[Evolutionary Optimization of Model Merging Recipes]. arXiv 2024.]
    #refline[[17]][Chris Lu et al., #link("https://arxiv.org/abs/2408.06292")[The AI Scientist: Towards Fully Automated Open-Ended Scientific Discovery]. arXiv 2024.]
    #refline[[18]][Google, #link("https://blog.google/products-and-platforms/products/gemini/google-gemini-deep-research/")[Gemini Deep Research]. Product blog.]
    #refline[[19]][OpenRouter, #link("https://openrouter.ai/docs/guides/routing/routers/fusion-router")[Fusion Router]. Documentation.]
    #refline[[20]][Timo Schick et al., #link("https://arxiv.org/abs/2302.04761")[Toolformer: Language Models Can Teach Themselves to Use Tools]. arXiv 2023.]
    #refline[[21]][Gastownhall, #link("https://github.com/gastownhall/gastown")[Gastown: multi-agent workspace manager]. GitHub repository.]
    #refline[[22]][Jared Kaplan et al., #link("https://arxiv.org/abs/2001.08361")[Scaling Laws for Neural Language Models]. arXiv 2020.]
    #refline[[23]][Jordan Hoffmann et al., #link("https://arxiv.org/abs/2203.15556")[Training Compute-Optimal Large Language Models]. arXiv 2022.]
  ]
]
