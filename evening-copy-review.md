# Evening Copy Review

Scope: [deck.typ](/mnt/ssd2/finb/harnesses-and-multi-agents/deck.typ) reviewed against [transcript-en.md](/mnt/ssd2/finb/harnesses-and-multi-agents/transcript-en.md).

Selection rule:
- Flag section subtitles that read like spoken sentences.
- Flag cards that use full explanatory bullets where the transcript already carries the explanation.
- Prioritize cards with the highest visible word counts or the weakest "scan in 2 seconds" behavior.

Notes:
- The references slides are dense by design and were not treated as live-content problems.
- The goal here is not to simplify the ideas, but to move explanation back into speech and keep the slide surface conceptual.

## Recommended Rewrites

### Section Divider — Harnesses 101
Why it feels wordy: The subtitle explains the whole section before the talk starts.

Replace with:
```text
Control loops make LLMs usable.
```

### Slide 2 — `NEXT TOKEN`
Why it feels wordy: Three full sentences repeat what the speaker can say in one breath.

Replace with:
```text
- Predict next token
- Append and repeat
- Long outputs = chained local bets
```

### Slide 3 — `SELF-ATTENTION`
Why it feels wordy: The card is explanatory rather than terminological.

Replace with:
```text
- Read across prior tokens
- Weight what matters now
- Stack attention + MLP blocks
```

### Slide 3 — `THE COST`
Why it feels wordy: The current bullets spend too much text to say "pairwise scaling is expensive."

Replace with:
```text
- Pairwise token comparisons
- Cost grows ~O(n^2)
- Bigger windows: pricier, noisier
```

### Slide 6 — `WHAT GETS ADDED`
Why it feels wordy: This is really a component list, not a prose explanation.

Replace with:
```text
- Instruction tuning
- Tool schemas
- System prompt
```

### Slide 6 — `WHY IT CHANGES BEHAVIOR`
Why it feels wordy: The memorable idea is the boundary between request and execution.

Replace with:
```text
- Request != action
- Harness runs the loop
- Side effects stay controlled
```

### Slide 7 — `SECURITY BOUNDARY`
Why it feels wordy: The current bullets explain the same idea twice.

Replace with:
```text
- Ask, approve, block
- Model proposes actions
- Harness owns execution
```

### Section Divider — Limits of Single Agents
Why it feels wordy: The subtitle is a full argument, not a divider cue.

Replace with:
```text
One session. One window. Growing liability.
```

### Slide 9 — `THE BOTTLENECK`
Why it feels wordy: Four full clauses can become a chant instead.

Replace with:
```text
- One window
- One trajectory
- One lens
- Early mistakes compound
```

### Slide 10 — `CAPACITY IS NOT CONTROL`
Why it feels wordy: The existing copy explains a distinction the title already names.

Replace with:
```text
- More tokens != better focus
- Retrieval, reasoning, instructions compete
```

### Slide 10 — `FAILURE SHAPE`
Why it feels wordy: This wants stronger labels and a better closing phrase.

Replace with:
```text
- Distant facts get buried
- Inspection cost explodes
- Debugging = transcript archaeology
```

### Slide 12 — `CHAIN RISK`
Why it feels wordy: The core pattern is "state drift compounds."

Replace with:
```text
- New state every step
- Bad assumptions stick
- Early drift steers the run
```

### Slide 12 — `MULTI-TURN RISK`
Why it feels wordy: The current text is accurate but not especially memorable.

Replace with:
```text
- Reliability drops across turns
- Often interaction failure, not capability failure
```

### Slide 13 — `WHAT WORKS`
Why it feels wordy: This is a method card and should read like one.

Replace with:
```text
- Split the task
- Match role + context
- Pass forward only what matters
```

### Slide 13 — `WHY MODELS ARE GOOD AT IT`
Why it feels wordy: The current card mixes a claim with examples; evening talks benefit from cues.

Replace with:
```text
- Strong at structure
- Good with intermediates
- L2M / ToT hint at the pattern
```

### Slide 14 — `CORE CLAIM`
Why it feels wordy: This is the thesis slide and should land as a slogan.

Replace with:
```text
- Test-time ensemble
- Roles + tools + memory boundaries
- Diversity first, synthesis later
```

### Slide 17 — `ROLE FIT`
Why it feels wordy: The main idea is assignment by failure mode.

Replace with:
```text
- Different roles, different strengths
- Keep diversity to the merge
- Assign by failure mode
```

### Slide 17 — `FUSION`
Why it feels wordy: The examples are useful, but the visible copy should emphasize the operation.

Replace with:
```text
- Rank candidates
- Fuse best fragments
- Late merge beats early collapse
```

### Slide 19 — `WHY IT WORKS`
Why it feels wordy: The current text is fine for a paper talk, but a bit dense for evening pacing.

Replace with:
```text
- Smaller prompts, fewer distractions
- Narrower checklists
- Disagreements surface early
```

### Slide 19 — `WHERE IT FAILS`
Why it feels wordy: The important point is that synthesis quality dominates.

Replace with:
```text
- Weak synthesis = more text
- Orchestration decides reliability
```

### Section Divider — finb Design Decisions
Why it feels wordy: The subtitle is explanatory; the section wants a sharper posture statement.

Replace with:
```text
Cheap failure. Visible work. Explicit synthesis.
```

### Slide 22 — `ZFS SNAPSHOTS`
Why it feels wordy: This is infrastructure; the slide should read as mechanisms, not explanation.

Replace with:
```text
- Copy-on-write workspace
- Near-instant rollback
- Reversible destruction
```

### Slide 22 — `CHROOT`
Why it feels wordy: The current copy spends too many words defending the design.

Replace with:
```text
- Filesystem boundary
- No VM required
- Commit or rollback stays explicit
```

### Slide 23 — `PHASES`
Why it feels wordy: This is really a process shape card.

Replace with:
```text
- Plan -> phase -> synthesize
- Dependencies stay explicit
```

### Slide 23 — `PARALLELISM`
Why it feels wordy: The existing bullets can be reduced to execution cues.

Replace with:
```text
- Concurrent tasks
- Bounded context
- Reuse good work
```

### Slide 24 — `DELIVERY`
Why it feels wordy: The current bullets are correct, but not punchy.

Replace with:
```text
- Mail arrives next phase
- Visible in prompt context
- Influence stays auditable
```

### Slide 26 — `FOLLOW-UP LOOP`
Why it feels wordy: The card is doing sequence explanation instead of naming the loop.

Replace with:
```text
- Deliverable -> replan -> rerun
- Fresh agents, fresh context
- Retry only failed work
```

### Slide 26 — `FOUR LAYERS`
Why it feels wordy: The audience mostly needs the layer names on the slide.

Replace with:
```text
- TUI
- Orchestrator
- Agent manager
- Harnesses
```

### Section Divider — Example Results
Why it feels wordy: The subtitle is strong, but still reads like speaker notes.

Replace with:
```text
Concrete multi-file builds, not longer chat.
```

### Slide 28 — `TERMNES`
Why it feels wordy: The card reads like a mini project summary.

Replace with:
```text
NES emulator:
CPU, PPU, mappers, renderer
```

### Slide 28 — `AT3RS`
Why it feels wordy: The memorable part is the niche technical domain.

Replace with:
```text
ATRAC3 codec:
niche domain, real signal processing
```

### Slide 28 — `SLOPPNG`
Why it feels wordy: The current sentence can be converted into stronger labels.

Replace with:
```text
PNG tooling:
binary parsing, validation, CLI
```

## Net Effect

If these edits are applied, the live deck becomes better at:
- Fast visual scanning.
- Letting the speaker own the explanation.
- Turning cards into memorable anchors instead of compressed paragraphs.

The transcript already carries enough explanatory depth to support these reductions without losing the technical message.
