#import "googley-theme.typ": *

#show: googley-theme.with(
  short-author: "Sangwhan Moon",
  short-title: "Harnesses & Multi-Agent Orchestration",
  short-date: "2026"
)

#set par(leading: 0.34em)
#set list(spacing: 0.24em)

#let cite(body) = [
  #v(0.1em)
  #text(size: 10pt, fill: GoogleGray)[#body]
]

#let node(label, accent: GoogleBlue, width: auto) = box(
  width: width,
  inset: (x: 0.45em, y: 0.25em),
  radius: 0.28em,
  fill: white,
  stroke: (paint: accent, thickness: 1.2pt),
)[#text(size: 13pt, weight: 600, fill: GoogleDark)[#label]]

#let arrow = text(size: 14pt, fill: GoogleGray)[->]

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
  #text(size: 11.2pt, fill: GoogleDark)[#strong[#n] #body]
  #v(0.12em)
]

#title-slide(
  title: [Harnesses and Multi-Agent Orchestration],
  subtitle: [
    From token prediction to coordinated, rollback-safe agent teams
  ],
  author: [Sangwhan Moon],
  date: [June 22, 2026]
)

#section-slide(
  [Harnesses 101],
  [LLMs become useful agents only after a control loop gives them tools, state, policy, and consequences.],
  accent: GoogleBlue,
)

#googley-slide(title: "What Is an LLM?")[
  #grid(columns: (1fr, 1fr), gutter: 0.45cm)[
    #googley-card(title: "NEXT TOKEN", accent: GoogleRed)[
      - A model predicts the next token from the tokens already seen.
      - It appends that token and predicts again.
      - Long answers are many small probability decisions chained together.
    ]
  ][
    #googley-card(title: "AUTOREGRESSIVE LOOP", accent: GoogleYellow)[
      #align(center)[
        #node[The] #h(0.15em) #node[cat] #h(0.15em) #node[sat] #h(0.15em) #node[on] #h(0.15em) #node[the] #h(0.15em) #node[mat]
        #v(0.4em)
        #text(fill: GoogleGray, size: 16pt)[distribution over the next token]
        #v(0.2em)
        #text(fill: GoogleBlue, size: 17pt)[mat: 0.42] #h(0.6em)
        #text(fill: GoogleRed, size: 17pt)[rug: 0.21] #h(0.6em)
        #text(fill: GoogleGreen, size: 17pt)[floor: 0.14]
      ]
    ]
  ]
]

#googley-slide(title: "The Transformer Makes It Work")[
  #googley-card(title: "SELF-ATTENTION", accent: GoogleGreen)[
    - Each prediction attends across the available context.
    - In causal LLMs, earlier tokens shape the next-token distribution.
    - Repeated attention and feed-forward blocks build useful representations.
  ]
  #v(0.35em)
  #googley-card(title: "THE COST", accent: GoogleBlue)[
    - Attention cost grows with pairs of tokens.
    - Bigger context windows still have real compute and reliability costs.
    - The attention matrix still scales as n x n.
  ]
  #cite[References: [1]]
]

#googley-slide(title: "Tokens, Context, and Sampling")[
  #grid(columns: (1fr, 1fr, 1fr), gutter: 0.35cm)[
    #googley-card(title: "TOKENS", accent: GoogleRed)[
      - Models read tokens, not characters.
      - Code, prose, logs, and tool output all spend the same budget.
    ]
  ][
    #googley-card(title: "CONTEXT WINDOW", accent: GoogleYellow)[
      - Prompt, history, tool output, and response share the window.
      - More room is not the same as better control.
    ]
  ][
    #googley-card(title: "SAMPLING", accent: GoogleGreen)[
      - Temperature changes how broadly the model samples.
      - Top-k and top-p trim candidate tokens before sampling.
    ]
  ]
  #v(0.55em)
  #diagram[
    #align(center)[
      #text(size: 14pt, fill: GoogleBlue)[low temperature: narrow] #h(1.0cm)
      #text(size: 14pt, fill: GoogleGreen)[high temperature: exploratory] #h(1.0cm)
      #text(size: 14pt, fill: GoogleGray)[same prompt, different useful attempts]
    ]
  ]
  #cite[References: [1]]
]

#googley-slide(title: "How Models Are Built")[
  #grid(columns: (1fr, 1fr), gutter: 0.42cm)[
    #googley-card(title: "PRE-TRAINING", accent: GoogleBlue, height: 2.75cm)[
      Broad next-token competence from large-scale data.
    ]
    #v(0.35em)
    #googley-card(title: "MID-TRAINING", accent: GoogleRed, height: 2.75cm)[
      Sharper behavior for domains, code, math, and long-context use.
    ]
  ][
    #googley-card(title: "POST-TRAINING", accent: GoogleYellow, height: 2.75cm)[
      SFT and preference optimization teach instruction-following behavior.
    ]
    #v(0.35em)
    #googley-card(title: "DEPLOYMENT", accent: GoogleGreen, height: 2.75cm)[
      Product systems wrap the model with policy, tools, and constraints.
    ]
  ]
]

#googley-slide(title: "Base Model to Agent")[
  #grid(columns: (1fr, 1fr), gutter: 0.45cm)[
    #googley-card(title: "WHAT GETS ADDED", accent: GoogleBlue)[
      - SFT teaches instruction following.
      - Tool schemas teach requests for external actions.
      - The system prompt gives role, scope, and rules.
    ]
  ][
    #googley-card(title: "WHY IT CHANGES BEHAVIOR", accent: GoogleRed)[
      - The harness runs the loop.
      - It decides what actually happens.
      - A tool request becomes a controlled side effect.
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
    #googley-card(title: "CONTROL LOOP", accent: GoogleYellow)[
      - Manages message history.
      - Sends tool schemas to the model.
      - Executes tool calls and appends results.
    ]
  ][
    #googley-card(title: "SECURITY BOUNDARY", accent: GoogleGreen)[
      - Stops, retries, asks for approval, or blocks unsafe actions.
      - The model can request an action.
      - The harness decides whether it runs.
    ]
  ]
  #diagram[
    #align(center)[
      #node[messages] #h(0.35em) #arrow #h(0.35em)
      #node[LLM] #h(0.35em) #arrow #h(0.35em)
      #node[tool call] #h(0.35em) #arrow #h(0.35em)
      #node[executor] #h(0.35em) #arrow #h(0.35em)
      #node[result]
    ]
  ]
]

#googley-slide(title: "SFT Teaches Tool Use")[
  #grid(columns: (1.1fr, 0.9fr), gutter: 0.45cm)[
    #googley-card(title: "TRAINING SAMPLE", accent: GoogleBlue)[
      #text(size: 14pt, font: "DejaVu Sans Mono")[
        user: "Find failing tests."\
        assistant: tool_call(run_tests, \{\})\
        tool: "2 failures in parser_test"\
        assistant: "The parser edge case fails..."
      ]
    ]
  ][
    #googley-card(title: "PATTERN LEARNED", accent: GoogleRed)[
      - When to call a tool.
      - How to structure arguments.
      - How to chain calls.
      - How to ground the final response in results.
    ]
  ]
  #cite[Training transcripts must stay precise because they become the evidence trail the model sees.]
]

#section-slide(
  [Limits of Single Agents],
  [One long session is easy to start, but brittle when planning, execution, and review all compete for the same context.],
  accent: GoogleRed,
)

#googley-slide(title: "Single-Agent Harnesses Hit a Ceiling")[
  #googley-card(title: "THE BOTTLENECK", accent: GoogleYellow)[
    - One context window carries the whole task.
    - One trajectory commits to one set of assumptions.
    - One role sees the task through one lens.
    - Long sessions make early mistakes expensive.
  ]
  #diagram[
    #align(center)[
      #node[one agent] #h(0.55em) #arrow #h(0.55em)
      #node([plan + files + logs + decisions + patches], width: 8.5cm)
    ]
  ]
  #cite[References: [7], [13]]
]

#googley-slide(title: "One Context Window Is Not a Plan")[
  #grid(columns: (1fr, 1fr), gutter: 0.45cm)[
    #googley-card(title: "CAPACITY IS NOT CONTROL", accent: GoogleGreen)[
      - More tokens let the model see more material.
      - They do not force the model to use the right material.
      - Retrieval, reasoning, and instruction tracking still compete.
    ]
  ][
    #googley-card(title: "FAILURE SHAPE", accent: GoogleBlue)[
      - Important facts get buried far apart.
      - The session becomes harder to inspect as it grows.
      - Debugging means reading the whole transcript.
    ]
  ]
  #cite[References: [7]]
]

#googley-slide(title: "Long Inputs Degrade Attention in Practice")[
  #grid(columns: (1fr, 1fr), gutter: 0.45cm)[
    #googley-card(title: "NEEDLE TESTS", accent: GoogleRed)[
      - Synthetic needles expose position-sensitive failures.
      - Longer context helps, but reliability still has cliffs.
    ]
  ][
    #googley-card(title: "REAL TASKS", accent: GoogleYellow)[
      - LongBench covers QA, summarization, few-shot, synthetic, and code tasks.
      - Context compression helps weaker models, but does not remove the core risk.
    ]
  ]
  #cite[References: [7]]
]

#googley-slide(title: "Long Agent Chains Accumulate Errors")[
  #grid(columns: (1fr, 1fr), gutter: 0.45cm)[
    #googley-card(title: "CHAIN RISK", accent: GoogleGreen)[
      - Tool calls introduce new state after every step.
      - Bad assumptions can become permanent context.
      - One early mistake can steer the whole trajectory.
    ]
  ][
    #googley-card(title: "MULTI-TURN RISK", accent: GoogleBlue)[
      - Multi-turn conversations can be less reliable than single-turn instructions.
      - The failure is often unreliability, not raw lack of ability.
    ]
  ]
  #diagram[
    #align(center)[
      #node[step 1] #h(0.35em) #arrow #h(0.35em)
      #node[step 2 + small error] #h(0.35em) #arrow #h(0.35em)
      #node[step 3 + larger error] #h(0.35em) #arrow #h(0.35em)
      #node([wrong branch], accent: GoogleRed)
    ]
  ]
  #cite[References: [5], [13]]
]

#googley-slide(title: "Decomposition Is the Escape Hatch")[
  #grid(columns: (1fr, 1fr), gutter: 0.45cm)[
    #googley-card(title: "WHAT WORKS", accent: GoogleRed)[
      - Break the task into smaller subproblems.
      - Solve each subproblem with the right context and role.
      - Feed results forward only when useful.
    ]
  ][
    #googley-card(title: "WHY MODELS ARE GOOD AT IT", accent: GoogleYellow)[
      - Frontier models are strong at task structure and intermediate reasoning.
      - Least-to-most prompting and Tree of Thoughts point at the same shape.
    ]
  ]
  #diagram[
    #align(center)[
      #node[large task] #h(0.45em) #arrow #h(0.45em)
      #node[A] #h(0.2em) #node[B] #h(0.2em) #node[C] #h(0.45em)
      #arrow #h(0.45em) #node[synthesis]
    ]
  ]
  #cite[References: [2], [4], [6], [8], [9]]
]

#section-slide(
  [Multi-Agent Ensembles],
  [Agent teams adapt ensemble ideas to engineering work: diversity, role fit, critique, and structured synthesis.],
  accent: GoogleGreen,
)

#googley-slide(title: "Multi-Agents and Ensemble Inspiration")[
  #googley-card(title: "CORE CLAIM", accent: GoogleGreen)[
    - Agent teams are test-time ensembles with tools, roles, and memory boundaries.
    - Diversity matters when the task has many plausible paths.
    - Synthesis matters because raw voting is not enough for engineering work.
  ]
  #diagram[
    #align(center)[
      #node[fan out] #h(0.55em) #arrow #h(0.55em)
      #node[independent work] #h(0.55em) #arrow #h(0.55em)
      #node[critique] #h(0.55em) #arrow #h(0.55em)
      #node[synthesis]
    ]
  ]
  #cite[References: [3], [10], [11], [12]]
]

#googley-slide(title: "Classical Ensemble Ideas Map Cleanly")[
  #grid(columns: (1fr, 1fr, 1fr), gutter: 0.35cm)[
    #googley-card(title: "BAGGING", accent: GoogleBlue, height: 4.55cm)[
      Repeated samples, parallel agents, and vote-style aggregation.
    ]
  ][
    #googley-card(title: "BOOSTING", accent: GoogleRed, height: 4.55cm)[
      Staged correction, review passes, and focused follow-up work.
    ]
  ][
    #googley-card(title: "MIXTURE OF EXPERTS", accent: GoogleYellow, height: 4.55cm)[
      Role specialization, routing, and fusion across complementary outputs.
    ]
  ]
  #cite[References: [3], [10], [11], [12]]
]

#googley-slide(title: "Voting Beats One Guess When Errors Differ")[
  #grid(columns: (1fr, 1fr), gutter: 0.45cm)[
    #googley-card(title: "SAMPLE DIVERSITY", accent: GoogleGreen)[
      - Self-consistency samples multiple reasoning paths.
      - It selects the answer that is most consistent across paths.
      - Gains depend on task difficulty and error diversity.
    ]
  ][
    #googley-card(title: "AGENT FOREST", accent: GoogleBlue)[
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
  #cite[References: [3], [10]]
]

#googley-slide(title: "Specialization Beats One Generalist")[
  #grid(columns: (1fr, 1fr), gutter: 0.45cm)[
    #googley-card(title: "ROLE FIT", accent: GoogleRed)[
      - Different models and roles are best on different examples.
      - Preserve diversity until the final merge.
      - Assign roles by failure mode, not personality.
    ]
  ][
    #googley-card(title: "FUSION", accent: GoogleYellow)[
      - LLM-Blender ranks candidate outputs, then fuses strong pieces.
      - Mixture-of-Agents layers multiple model outputs into later synthesis stages.
    ]
  ]
  #diagram[
    #align(center)[
      #node[architect] #h(0.2em) #node[qa] #h(0.2em) #node[security] #h(0.2em) #node[performance]
      #h(0.55em) #arrow #h(0.55em) #node[synthesizer]
    ]
  ]
  #cite[References: [11], [12]]
]

#googley-slide(title: "Debate Adds Friction")[
  #grid(columns: (1fr, 1fr), gutter: 0.45cm)[
    #googley-card(title: "DELIBERATION", accent: GoogleGreen)[
      - Chain-of-thought makes intermediate reasoning available to the model.
      - Tree of Thoughts searches multiple candidate paths before committing.
    ]
  ][
    #googley-card(title: "GROUNDING", accent: GoogleBlue)[
      - ReAct interleaves reasoning and action so the agent can gather evidence.
      - Collaboration externalizes deliberation across workers.
    ]
  ]
  #cite[References: [2], [5], [6]]
]

#googley-slide(title: "Small Contexts Can Beat One Long Context")[
  #grid(columns: (1fr, 1fr), gutter: 0.45cm)[
    #googley-card(title: "WHY IT WORKS", accent: GoogleRed)[
      - Each agent gets a smaller prompt with fewer distractions.
      - Each role can carry a narrower checklist.
      - Parallel agents expose disagreements early.
    ]
  ][
    #googley-card(title: "WHERE IT FAILS", accent: GoogleYellow)[
      - Synthesis must be structured.
      - Otherwise the team just creates more text.
      - The orchestration layer is where reliability is won or lost.
    ]
  ]
  #cite[References: [7], [10], [11], [12]]
]

#section-slide(
  [finb Design Decisions],
  [The system assumes agents will fail, so it makes damage cheap, work inspectable, and synthesis explicit.],
  accent: GoogleYellow,
)

#googley-slide(title: "Design Around Failure")[
  #grid(columns: (1fr, 1fr, 1fr), gutter: 0.35cm)[
    #googley-card(title: "LOCKDOWN", accent: GoogleBlue, height: 4.4cm)[
      Safe, but the human becomes the bottleneck.
    ]
  ][
    #googley-card(title: "YOLO", accent: GoogleRed, height: 4.4cm)[
      Fast, but one bad command can destroy the workspace.
    ]
  ][
    #googley-card(title: "REVERSIBLE", accent: GoogleYellow, height: 4.4cm)[
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
  #grid(columns: (1fr, 1fr), gutter: 0.45cm)[
    #googley-card(title: "ZFS SNAPSHOTS", accent: GoogleGreen)[
      - Each agent runs in a copy-on-write snapshot.
      - Rollback is near-instant.
      - Agents can move fast because destruction is reversible.
    ]
  ][
    #googley-card(title: "CHROOT", accent: GoogleBlue)[
      - Chroot keeps the agent inside its assigned filesystem.
      - No containers or VMs are required for the core isolation model.
      - Commit or rollback stays explicit.
    ]
  ]
  #diagram[
    #align(center)[
      #node[workspace] #h(0.35em) #arrow #h(0.35em)
      #node[snapshot clone] #h(0.35em) #arrow #h(0.35em)
      #node[chroot] #h(0.35em) #arrow #h(0.35em)
      #node[agent run] #h(0.35em) #arrow #h(0.35em)
      #node[commit / rollback]
    ]
  ]
]

#googley-slide(title: "Agent Teams Are a DAG")[
  #grid(columns: (1fr, 1fr), gutter: 0.45cm)[
    #googley-card(title: "PHASES", accent: GoogleRed)[
      - The planner emits a phased execution graph.
      - Later phases receive synthesized context from earlier phases.
      - Dependencies stay explicit.
    ]
  ][
    #googley-card(title: "PARALLELISM", accent: GoogleYellow)[
      - Tasks inside a phase run concurrently.
      - Fresh agents get bounded context.
      - Successful work can be reused without rerunning everything.
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

#googley-slide(title: "Mailbox Turns Agents Into a Team")[
  #grid(columns: (1fr, 1fr), gutter: 0.45cm)[
    #googley-card(title: "MESSAGES", accent: GoogleGreen)[
      - Agents send mail to named teammates.
      - Coordination stays auditable.
      - No shared hidden state is required.
    ]
  ][
    #googley-card(title: "DELIVERY", accent: GoogleBlue)[
      - Messages are delivered between phases.
      - Recipients see the mail in their next prompt.
      - The transcript shows who influenced whom.
    ]
  ]
  #diagram[
    #align(center)[
      #node[lead] #h(0.2em) #node[ml] #h(0.2em) #node[data] #h(0.2em) #node[qa]
      #h(0.45em) #arrow #h(0.45em) #node[mailbox] #h(0.45em) #arrow #h(0.45em)
      #node[next phase]
    ]
  ]
]

#googley-slide(title: "Synthesis Has Influence Tiers")[
  #grid(columns: (1fr, 1fr, 1fr), gutter: 0.35cm)[
    #googley-card(title: "PRIMARY", accent: GoogleRed, height: 3.65cm)[
      Drives the narrative and owns final coherence.
    ]
  ][
    #googley-card(title: "SUPPORTING", accent: GoogleYellow, height: 3.65cm)[
      Shapes major sections, constraints, and tradeoffs.
    ]
  ][
    #googley-card(title: "CONTRIBUTING", accent: GoogleGreen, height: 3.65cm)[
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
  #cite[References: [11], [12]]
]

#googley-slide(title: "Iteration and Harness Abstraction")[
  #grid(columns: (1fr, 1fr), gutter: 0.45cm)[
    #googley-card(title: "FOLLOW-UP LOOP", accent: GoogleBlue)[
      - Feed the previous deliverable back into planning.
      - Fresh agents run with fresh context.
      - Failed agents can be retried without rerunning successful work.
    ]
  ][
    #googley-card(title: "FOUR LAYERS", accent: GoogleRed)[
      - TUI: interactive control and session visibility.
      - Orchestrator: planning, mailbox, context, synthesis.
      - Agent manager: lifecycle and output capture.
      - Harness: Claude Code, Gemini CLI, and future tools.
    ]
  ]
]

#section-slide(
  [Example Results],
  [finb is aimed at concrete multi-file engineering work, not just longer chat completions.],
  accent: GoogleBlue,
)

#googley-slide(title: "Example Projects")[
  #grid(columns: (1fr, 1fr, 1fr), gutter: 0.35cm)[
    #googley-card(title: "TERMNES", accent: GoogleYellow, height: 5.2cm)[
      Terminal NES emulator in Rust: CPU, PPU, mappers, renderer, input, and targeted APU support.
    ]
  ][
    #googley-card(title: "AT3RS", accent: GoogleGreen, height: 5.2cm)[
      ATRAC3 audio codec in Rust from a specialized technical domain.
    ]
  ][
    #googley-card(title: "SLOPPNG", accent: GoogleBlue, height: 5.2cm)[
      PNG tooling in Rust with binary parsing, validation, and CLI workflows.
    ]
  ]
  #diagram[
    #align(center)[
      #text(fill: GoogleGray)[These are multi-file systems with tests, integration points, and domain-specific constraints.]
    ]
  ]
]

#googley-slide(title: "What the Results Demonstrate")[
  #grid(columns: (1fr, 1fr, 1fr), gutter: 0.35cm)[
    #googley-card(title: "DECOMPOSITION", accent: GoogleRed, height: 5.2cm)[
      Planning agents split hard builds into executable phases.
    ]
  ][
    #googley-card(title: "SPECIALIZATION", accent: GoogleYellow, height: 5.2cm)[
      Specialists own emulation, binary formats, rendering, QA, and integration.
    ]
  ][
    #googley-card(title: "VERIFICATION", accent: GoogleGreen, height: 5.2cm)[
      Review passes catch integration bugs single-pass generation leaves behind.
    ]
  ]
  #v(0.4em)
  #diagram[
    #align(center)[
      #node[parallel work] #h(0.45em) #arrow #h(0.45em)
      #node[synthesis] #h(0.45em) #arrow #h(0.45em)
      #node[coherent codebase] #h(0.45em) #arrow #h(0.45em)
      #node[verification]
    ]
  ]
]

#googley-slide(title: "References")[
  #googley-card(title: "REFERENCES", accent: GoogleBlue)[
    #set text(size: 8.7pt)
    #set par(leading: 0.14em)
    #grid(columns: (1fr, 1fr), gutter: 0.35cm)[
      #refline[[1]][Ashish Vaswani et al., Attention Is All You Need. NeurIPS 2017.]
      #refline[[2]][Jason Wei et al., Chain-of-Thought Prompting Elicits Reasoning in Large Language Models. NeurIPS 2022.]
      #refline[[3]][Xuezhi Wang et al., Self-Consistency Improves Chain of Thought Reasoning in Language Models. ICLR 2023.]
      #refline[[4]][Denny Zhou et al., Least-to-Most Prompting Enables Complex Reasoning in Large Language Models. ICLR 2023.]
      #refline[[5]][Shunyu Yao et al., ReAct: Synergizing Reasoning and Acting in Language Models. ICLR 2023.]
      #refline[[6]][Shunyu Yao et al., Tree of Thoughts: Deliberate Problem Solving with Large Language Models. NeurIPS 2023.]
    ]
  ]
]

#googley-slide(title: "References")[
  #googley-card(title: "REFERENCES", accent: GoogleGreen)[
    #set text(size: 8.7pt)
    #set par(leading: 0.16em)
    #grid(columns: (1fr, 1fr), gutter: 0.35cm)[
      #refline[[7]][Yushi Bai et al., LongBench: A Bilingual, Multitask Benchmark for Long Context Understanding. ACL 2024.]
      #refline[[8]][Xiao Liu et al., AgentBench: Evaluating LLMs as Agents. ICLR 2024.]
      #refline[[9]][Shuyan Zhou et al., WebArena: A Realistic Web Environment for Building Autonomous Agents. ICLR 2024.]
      #refline[[10]][Junyou Li et al., More Agents Is All You Need. TMLR 2024.]
    ][
      #refline[[11]][Dongfu Jiang et al., LLM-Blender: Ensembling Large Language Models with Pairwise Ranking and Generative Fusion. ACL 2023.]
      #refline[[12]][Junlin Wang et al., Mixture-of-Agents Enhances Large Language Model Capabilities. ICLR 2025.]
      #refline[[13]][Philippe Laban et al., LLMs Get Lost In Multi-Turn Conversation. ICLR 2026.]
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
