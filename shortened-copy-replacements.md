# Shortened Copy Replacements

Scope: replacement text for the high-density cards and section dividers in `deck-revision.typ`, using `evening-copy-review.md` plus the visually risky QA pages (`9`, `14`, `18`, `29`, `31`, `32`).

## Section Dividers

### Harnesses 101
```text
Control loops make LLMs usable.
```

### Limits of Single Agents
```text
One session. One window. Growing liability.
```

### finb Design Decisions
```text
Cheap failure. Visible work. Explicit synthesis.
```

### Example Results
```text
Concrete multi-file builds, not longer chat.
```

## Slide 2: What Is an LLM?

### NEXT TOKEN
```text
- Predict next token
- Append and repeat
- Long outputs = chained local bets
```

## Slide 3: The Transformer Makes It Work

### SELF-ATTENTION
```text
- Read across prior tokens
- Weight what matters now
- Stack attention + MLP blocks
```

### THE COST
```text
- Pairwise token comparisons
- Cost grows ~O(n^2)
- Bigger windows: pricier, noisier
```

## Slide 6: Base Model to Agent

### WHAT GETS ADDED
```text
- Instruction tuning
- Tool schemas
- System prompt
```

### WHY IT CHANGES BEHAVIOR
```text
- Request != action
- Harness runs the loop
- Side effects stay controlled
```

## Slide 7: What the Harness Owns

### SECURITY BOUNDARY
```text
- Ask, approve, block
- Model proposes actions
- Harness owns execution
```

## Slide 9: SFT Teaches Tool Use

### PATTERN LEARNED
```text
- When to call tools
- How to pass arguments
- How to chain steps
- How to answer from results
```

### Footer line
```text
Training traces teach the evidence pattern.
```

## Slide 10: Single-Agent Harnesses Hit a Ceiling

### THE BOTTLENECK
```text
- One window
- One trajectory
- One lens
- Early mistakes compound
```

## Slide 11: One Context Window Is Not a Plan

### CAPACITY IS NOT CONTROL
```text
- More tokens != better focus
- Retrieval, reasoning, instructions compete
```

### FAILURE SHAPE
```text
- Distant facts get buried
- Inspection cost explodes
- Debugging = transcript archaeology
```

## Slide 12: Long Inputs Degrade Attention in Practice

### NEEDLE TESTS
```text
- Position-sensitive failures
- Longer windows still have cliffs
```

### REAL TASKS
```text
- LongBench spans QA, summary, code
- Compression helps, risk remains
```

## Slide 14: Long Agent Chains Accumulate Errors

### CHAIN RISK
```text
- New state every step
- Bad assumptions stick
- Early drift steers the run
```

### MULTI-TURN RISK
```text
- Reliability drops across turns
- Often interaction failure, not capability failure
```

### Diagram labels
```text
step 1 -> small drift -> more drift -> wrong branch
```

## Slide 15: Decomposition Is the Escape Hatch

### WHAT WORKS
```text
- Split the task
- Match role + context
- Pass forward only what matters
```

### WHY MODELS ARE GOOD AT IT
```text
- Strong at structure
- Good with intermediates
- L2M / ToT hint at the pattern
```

## Slide 17: Multi-Agents and Ensemble Inspiration

### CORE CLAIM
```text
- Test-time ensemble
- Roles + tools + memory boundaries
- Diversity first, synthesis later
```

## Slide 18: Classical Ensemble Ideas Map Cleanly

### BAGGING
```text
Parallel samples, then aggregate.
```

### BOOSTING
```text
Stage work, then correct errors.
```

### MIXTURE OF EXPERTS
```text
Route by specialty, then fuse outputs.
```

## Slide 20: Specialization Beats One Generalist

### ROLE FIT
```text
- Different roles, different strengths
- Keep diversity to the merge
- Assign by failure mode
```

### FUSION
```text
- Rank candidates
- Fuse best fragments
- Late merge beats early collapse
```

## Slide 22: Small Contexts Can Beat One Long Context

### WHY IT WORKS
```text
- Smaller prompts, fewer distractions
- Narrower checklists
- Disagreements surface early
```

### WHERE IT FAILS
```text
- Weak synthesis = more text
- Orchestration decides reliability
```

## Slide 24: Safe-to-Destruct Workspaces

### ZFS SNAPSHOTS
```text
- Copy-on-write workspace
- Near-instant rollback
- Reversible destruction
```

### CHROOT
```text
- Filesystem boundary
- No VM required
- Commit or rollback stays explicit
```

## Slide 25: Agent Teams Are a DAG

### PHASES
```text
- Plan -> phase -> synthesize
- Dependencies stay explicit
```

### PARALLELISM
```text
- Concurrent tasks
- Bounded context
- Reuse good work
```

## Slide 26: Mailbox Turns Agents Into a Team

### DELIVERY
```text
- Mail arrives next phase
- Visible in prompt context
- Influence stays auditable
```

## Slide 29: Iteration and Harness Abstraction

### FOLLOW-UP LOOP
```text
- Deliverable -> replan -> rerun
- Fresh agents, fresh context
- Retry only failed work
```

### FOUR LAYERS
```text
- TUI
- Orchestrator
- Agent manager
- Harnesses
```

## Slide 31: Example Projects

### TERMNES
```text
NES emulator:
CPU, PPU, mappers, renderer
```

### AT3RS
```text
ATRAC3 codec:
niche domain, real signal processing
```

### SLOPPNG
```text
PNG tooling:
binary parsing, validation, CLI
```

### Caption
```text
Multi-file builds with tests and integration points.
```

## Slide 32: What the Results Demonstrate

### DECOMPOSITION
```text
Plan -> phases -> executable work
```

### SPECIALIZATION
```text
Experts own formats, rendering, QA
```

### VERIFICATION
```text
Review passes catch integration bugs
```
