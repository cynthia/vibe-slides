# Master Outline: Harnesses and Multi-Agent Orchestration

Target length: 30 slides.

Style constraints:
- Use Google Sans, tight leading, tight card spacing, and the existing `googley-card` component.
- Rotate card accents in this order: `GoogleBlue`, `GoogleRed`, `GoogleYellow`, `GoogleGreen`.
- Keep bullets direct and engineering-focused.
- Avoid `Topic: Explanation` phrasing inside visible slide content.
- Put footnote citations in a small bottom strip on content slides.
- Use section dividers between major sections.

## Section 1: Harnesses 101

### Slide 1 — Harnesses 101

Cards:
- `WHY THIS MATTERS` — `GoogleBlue`

Content:
- LLMs do not become coding agents by themselves.
- A harness turns token prediction into a controlled execution loop.
- The loop gives the model tools, memory, policy, and consequences.

Diagram:
- Full-slide section divider.
- Use a simple pipeline: `Model -> Harness -> Tools -> Workspace`.

Footnotes:
- None.

### Slide 2 — What Is an LLM?

Cards:
- `NEXT TOKEN` — `GoogleRed`
- `AUTOREGRESSIVE LOOP` — `GoogleYellow`

Content:
- A model predicts the next token from the tokens already seen.
- It appends that token and predicts again.
- Long answers are many small probability decisions chained together.

Diagram:
- Token strip from the `kodex` deck: `The | cat | sat | on | the | mat | predicted`.
- Show probability arrows from prior tokens to the next token.

Footnotes:
- None.

### Slide 3 — The Transformer Makes It Work

Cards:
- `SELF-ATTENTION` — `GoogleGreen`
- `THE COST` — `GoogleBlue`

Content:
- Every token can read from every other token.
- The model learns which previous tokens matter for each prediction.
- Attention cost grows quadratically with sequence length.
- Bigger context windows still have real compute and reliability costs.

Diagram:
- Transformer stack: embeddings, repeated self-attention and feed-forward blocks.
- Add a small `n x n` attention grid beside `O(n^2)`.

Footnotes:
- [Vaswani17]

### Slide 4 — Tokens, Context, and Sampling

Cards:
- `TOKENS` — `GoogleRed`
- `CONTEXT WINDOW` — `GoogleYellow`
- `SAMPLING` — `GoogleGreen`

Content:
- Models read tokens, not characters.
- Prompt, history, tool output, and model response all share one budget.
- Temperature changes how aggressively the model samples.
- Top-k and top-p trim the candidate token set before sampling.
- Same prompt can produce different useful attempts.

Diagram:
- Left: tokenization example from `kodex`.
- Right: probability distribution with low-temperature and high-temperature curves.

Footnotes:
- [Vaswani17]

### Slide 5 — How Models Are Built

Cards:
- `PRE-TRAINING` — `GoogleBlue`
- `MID-TRAINING` — `GoogleRed`
- `POST-TRAINING` — `GoogleYellow`
- `DEPLOYMENT` — `GoogleGreen`

Content:
- Pre-training teaches broad next-token competence.
- Mid-training sharpens domains, code, math, and long-context behavior.
- SFT teaches the model to follow instructions and conversation formats.
- Preference optimization pushes behavior toward useful assistant responses.
- Deployment wraps the model with policy, tools, and product constraints.

Diagram:
- Horizontal timeline adapted from the `kodex` deck.

Footnotes:
- None.

### Slide 6 — Base Model to Agent

Cards:
- `WHAT GETS ADDED` — `GoogleBlue`
- `WHY IT CHANGES BEHAVIOR` — `GoogleRed`

Content:
- SFT teaches instruction following.
- Tool schemas teach the model how to ask for external actions.
- The system prompt gives role, scope, and rules.
- The harness runs the loop and decides what actually happens.

Diagram:
- Stack diagram: base model, SFT, tool use, system prompt, harness.

Footnotes:
- None.

### Slide 7 — What the Harness Owns

Cards:
- `CONTROL LOOP` — `GoogleYellow`
- `SECURITY BOUNDARY` — `GoogleGreen`

Content:
- The harness manages message history.
- It sends tool schemas to the model.
- It executes tool calls and appends tool results.
- It stops, retries, asks for approval, or blocks unsafe actions.
- The model can request an action; the harness decides whether it runs.

Diagram:
- Loop: `messages -> LLM -> tool call -> executor -> result -> messages`.
- Put the harness boundary around history, tool schemas, executor, and policy.

Footnotes:
- None.

### Slide 8 — SFT Teaches Tool Use

Cards:
- `TRAINING SAMPLE` — `GoogleBlue`
- `PATTERN LEARNED` — `GoogleRed`

Content:
- The training data includes user turns, assistant tool calls, tool results, and final answers.
- The model learns when to call a tool.
- It learns structured arguments, chained calls, and result-grounded responses.
- This is why the harness must keep the transcript precise.

Diagram:
- Compact JSON conversation excerpt adapted from `kodex`.
- Keep it readable; use no more than four turns.

Footnotes:
- None.

## Section 2: Limitations of Single-Agent Harnesses

### Slide 9 — Single-Agent Harnesses Hit a Ceiling

Cards:
- `THE BOTTLENECK` — `GoogleYellow`

Content:
- One context window carries the whole task.
- One trajectory commits to one set of assumptions.
- One role sees the task through one lens.
- Long sessions make early mistakes expensive.

Diagram:
- Section divider with one agent holding a large task graph.

Footnotes:
- [LongBench], [LostConversation]

### Slide 10 — One Context Window Is Not a Plan

Cards:
- `CAPACITY IS NOT CONTROL` — `GoogleGreen`
- `FAILURE SHAPE` — `GoogleBlue`

Content:
- More tokens let the model see more material.
- They do not force the model to use the right material.
- Retrieval, reasoning, and instruction tracking still compete inside one stream.
- The session becomes harder to inspect as it grows.

Diagram:
- Large context window filled with prompt, files, logs, tool output, and prior decisions.
- Highlight a few important facts buried far apart.

Footnotes:
- [LongBench]

### Slide 11 — Long Inputs Degrade Attention in Practice

Cards:
- `NEEDLE TESTS` — `GoogleRed`
- `REAL TASKS` — `GoogleYellow`

Content:
- Synthetic needles expose position-sensitive failures.
- LongBench shows broader weakness across QA, summarization, few-shot, synthetic, and code tasks.
- Longer context helps, but it does not remove reliability cliffs.
- Context compression helps weaker models, but still trails stronger long-context systems.

Diagram:
- Heatmap of retrieval reliability across positions in a long document.
- Keep it schematic; if the slide makes the positional long-context claim explicit, cite `Lost in the Middle` inline because it is a valid TACL source.

Footnotes:
- [LongBench]

### Slide 12 — Long Agent Chains Accumulate Errors

Cards:
- `CHAIN RISK` — `GoogleGreen`
- `MULTI-TURN RISK` — `GoogleBlue`

Content:
- Tool calls introduce new state after every step.
- Bad assumptions can become permanent context.
- Multi-turn conversations can become less reliable than single-turn instructions.
- The failure is often unreliability, not raw lack of ability.

Diagram:
- Agent chain with small error bars growing after each tool call.
- Add a branch where the agent commits early to the wrong interpretation.

Footnotes:
- [ReAct], [LostConversation]

### Slide 13 — Decomposition Is the Escape Hatch

Cards:
- `WHAT WORKS` — `GoogleRed`
- `WHY MODELS ARE GOOD AT IT` — `GoogleYellow`

Content:
- Break the task into smaller subproblems.
- Solve each subproblem with the right context and role.
- Feed results forward only when they are useful.
- Frontier models are strong at proposing task structure, plans, and intermediate reasoning.
- Least-to-most prompting and Tree of Thoughts both point at the same shape.

Diagram:
- Big task split into a DAG of smaller tasks, then recombined.

Footnotes:
- [CoT], [LeastToMost], [TreeOfThoughts], [AgentBench], [WebArena]

## Section 3: Multi-Agents and Ensemble Inspiration

### Slide 14 — Multi-Agents and Ensemble Inspiration

Cards:
- `CORE CLAIM` — `GoogleGreen`

Content:
- Agent teams are test-time ensembles with tools, roles, and memory boundaries.
- Diversity matters when the task has many plausible paths.
- Synthesis matters because raw voting is not enough for engineering work.

Diagram:
- Section divider with `fan out -> independent work -> synthesis`.

Footnotes:
- [SelfConsistency], [MoreAgents], [MoA], [LLMBlender]

### Slide 15 — Classical Ensemble Ideas Map Cleanly

Cards:
- `BAGGING` — `GoogleBlue`
- `BOOSTING` — `GoogleRed`
- `MIXTURE OF EXPERTS` — `GoogleYellow`

Content:
- Bagging becomes repeated samples, parallel agents, and vote-style aggregation.
- Boosting becomes staged correction, review passes, and focused follow-up work.
- Mixture of experts becomes role specialization, routing, and fusion.
- The analogy is useful when it drives concrete system design.

Diagram:
- Three-column mapping table from ensemble term to LLM team pattern.

Footnotes:
- [SelfConsistency], [MoreAgents], [MoA], [LLMBlender]

### Slide 16 — Voting Beats One Guess When Errors Differ

Cards:
- `SAMPLE DIVERSITY` — `GoogleGreen`
- `AGENT FOREST` — `GoogleBlue`

Content:
- Self-consistency samples multiple reasoning paths and selects the most consistent answer.
- More Agents Is All You Need scales the same intuition to multiple instantiated agents.
- The gain depends on task difficulty and error diversity.
- Parallel attempts are cheap when orchestration is automated.

Diagram:
- Multiple reasoning paths converge to candidate answers; majority or consistency selector picks one.

Footnotes:
- [SelfConsistency], [MoreAgents]

### Slide 17 — Specialization Beats One Generalist

Cards:
- `ROLE FIT` — `GoogleRed`
- `FUSION` — `GoogleYellow`

Content:
- Different models and roles are best on different examples.
- LLM-Blender ranks candidate outputs, then fuses the strongest pieces.
- Mixture-of-Agents layers multiple model outputs into later synthesis stages.
- The system should preserve diversity until the final merge.

Diagram:
- Layered agents feeding a ranker or synthesizer.
- Show role labels such as `architect`, `qa`, `security`, `performance`.

Footnotes:
- [LLMBlender], [MoA]

### Slide 18 — Debate and Collaboration Add Friction on Purpose

Cards:
- `DELIBERATION` — `GoogleGreen`
- `GROUNDING` — `GoogleBlue`

Content:
- Chain-of-thought makes intermediate reasoning available to the model.
- ReAct interleaves reasoning and action so the agent can gather evidence.
- Tree of Thoughts searches multiple candidate paths before committing.
- Multi-agent collaboration externalizes that deliberation across workers.

Diagram:
- Compare a single straight-line trace with a branching search tree and an agent team.

Footnotes:
- [CoT], [ReAct], [TreeOfThoughts]

### Slide 19 — Small Contexts Can Beat One Long Context

Cards:
- `WHY IT WORKS` — `GoogleRed`
- `WHERE IT FAILS` — `GoogleYellow`

Content:
- Each agent gets a smaller prompt with fewer distractions.
- Each role can carry a narrower checklist.
- Parallel agents expose disagreements early.
- Synthesis must be structured, or the team just creates more text.
- The orchestration layer is where reliability is won or lost.

Diagram:
- Left: one huge context with all material.
- Right: shards routed to agents, then synthesized through tiers.

Footnotes:
- [LongBench], [MoreAgents], [MoA], [LLMBlender]

## Section 4: finb Design Decisions

### Slide 20 — finb Design Decisions

Cards:
- `DESIGN POSTURE` — `GoogleGreen`

Content:
- Assume agents will break things.
- Make damage cheap.
- Make work inspectable.
- Make synthesis explicit.
- Keep the harness replaceable.

Diagram:
- Section divider with four blocks: isolation, DAG, mailbox, synthesis.

Footnotes:
- None.

### Slide 21 — Design Around Failure

Cards:
- `LOCKDOWN` — `GoogleBlue`
- `YOLO` — `GoogleRed`
- `REVERSIBLE` — `GoogleYellow`

Content:
- Lockdown is safe, but the human becomes the bottleneck.
- YOLO is fast, but one bad command can destroy the workspace.
- Reversible gives agents freedom inside a workspace that can roll back instantly.
- The right target is controlled blast radius, not constant approval.

Diagram:
- Three-lane comparison adapted from `finb-intro`.

Footnotes:
- None.

### Slide 22 — Safe-to-Destruct Workspaces

Cards:
- `ZFS SNAPSHOTS` — `GoogleGreen`
- `CHROOT` — `GoogleBlue`

Content:
- Each agent runs in a copy-on-write snapshot.
- Rollback is near-instant.
- Chroot keeps the agent inside its assigned filesystem.
- No containers or VMs are required for the core isolation model.
- Agents can move fast because destruction is reversible.

Diagram:
- Workspace -> snapshot clone -> chroot -> agent run -> commit or rollback.

Footnotes:
- None.

### Slide 23 — Agent Teams Are a DAG

Cards:
- `PHASES` — `GoogleRed`
- `PARALLELISM` — `GoogleYellow`

Content:
- The planner emits a phased execution graph.
- Tasks inside a phase run concurrently.
- Later phases receive synthesized context from earlier phases.
- Dependencies stay explicit instead of hiding inside one chat history.

Diagram:
- DAG: `Plan -> Phase 1 agents -> Synthesis -> Phase 2 agents -> Final synthesis`.

Footnotes:
- None.

### Slide 24 — Mailbox Turns Agents Into a Team

Cards:
- `MESSAGES` — `GoogleGreen`
- `DELIVERY` — `GoogleBlue`

Content:
- Agents send mail to named teammates.
- Messages are delivered between phases.
- Recipients see the mail in their next prompt.
- Coordination stays auditable and does not rely on shared hidden state.

Diagram:
- Two phases with `lead`, `backend`, `qa`, and a mailbox between them.

Footnotes:
- None.

### Slide 25 — Synthesis Has Influence Tiers

Cards:
- `PRIMARY` — `GoogleRed`
- `SUPPORTING` — `GoogleYellow`
- `CONTRIBUTING` — `GoogleGreen`

Content:
- The primary agent drives the narrative.
- Supporting agents shape major sections and constraints.
- Contributing agents add evidence, edge cases, and checks.
- At most one primary agent prevents final-answer drift.
- Attributed and unified synthesis both remain available.

Diagram:
- Funnel from tiered outputs into one deliverable.

Footnotes:
- [LLMBlender], [MoA]

### Slide 26 — Iteration Keeps the Team Moving

Cards:
- `FOLLOW-UP LOOP` — `GoogleBlue`
- `RECOVERY` — `GoogleRed`

Content:
- A follow-up prompt feeds the previous deliverable back into planning.
- Fresh agents run with fresh context.
- Session history stays available for inspection.
- Failed agents can be retried without re-running successful work.
- Checkpoints make long team runs recoverable.

Diagram:
- Loop: `Deliverable -> Follow-up -> Plan -> Execute -> Synthesize -> Deliverable`.

Footnotes:
- None.

### Slide 27 — Harness-Agnostic Architecture

Cards:
- `FOUR LAYERS` — `GoogleYellow`
- `HARNESS INTERFACE` — `GoogleGreen`

Content:
- The TUI handles interactive control and session visibility.
- The orchestrator owns planning, mailbox, context, and synthesis.
- The agent manager owns process lifecycle and output capture.
- The harness layer maps commands and streams for Claude Code, Gemini CLI, and future tools.
- finb should orchestrate harnesses, not replace them.

Diagram:
- Four-layer stack adapted from `finb-intro`: `TUI -> Orchestrator -> Agent Manager -> Harness`.
- Add harness boxes under the bottom layer.

Footnotes:
- None.

## Section 5: Example Results

### Slide 28 — Example Results

Cards:
- `TERMNES` — `GoogleBlue`
- `AT3RS` — `GoogleRed`
- `SLOPPNG` — `GoogleYellow`

Content:
- `termnes` built a terminal NES emulator in Rust with CPU, PPU, mappers, renderer, input, and targeted APU support.
- `at3rs` built an ATRAC3 audio codec in Rust from a specialized technical domain.
- `sloppng` built a PNG tool in Rust with binary parsing, validation, and CLI workflows.
- These are not toy chat completions; they are multi-file systems with tests and integration points.

Diagram:
- Three product tiles with one small architecture thumbnail each.
- Use terminal screenshot styling for `termnes`, waveform blocks for `at3rs`, and PNG chunk blocks for `sloppng`.

Footnotes:
- Internal finb run reports.

### Slide 29 — What the Results Demonstrate

Cards:
- `DECOMPOSITION` — `GoogleGreen`
- `SPECIALIZATION` — `GoogleBlue`
- `VERIFICATION` — `GoogleRed`

Content:
- Planning agents can split a hard build into phases that real implementers can execute.
- Specialist agents can own CPU emulation, binary formats, rendering, QA, and integration independently.
- Synthesis turns parallel work into one coherent codebase.
- Iteration fixes integration bugs that single-pass generation leaves behind.
- The system value is not more text; it is coordinated execution under rollback.

Diagram:
- Matrix with rows for `termnes`, `at3rs`, `sloppng` and columns for decomposition, specialization, verification, iteration.

Footnotes:
- Internal finb run reports.

## Section 6: References

### Slide 30 — References

Cards:
- `REFERENCES` — `GoogleYellow`

Content:
- Use compact two-column text.
- Put the citation key first.
- Keep all entries in the same format.
- Include primary-source venue or archive.

Diagram:
- None.

Footnotes:
- None.

Reference block:
- [Vaswani17] Ashish Vaswani, Noam Shazeer, Niki Parmar, Jakob Uszkoreit, Llion Jones, Aidan N. Gomez, Łukasz Kaiser, and Illia Polosukhin. 2017. “Attention Is All You Need.” NeurIPS 2017.
- [CoT] Jason Wei, Xuezhi Wang, Dale Schuurmans, Maarten Bosma, Brian Ichter, Fei Xia, Ed H. Chi, Quoc V. Le, and Denny Zhou. 2022. “Chain-of-Thought Prompting Elicits Reasoning in Large Language Models.” NeurIPS 2022.
- [SelfConsistency] Xuezhi Wang, Jason Wei, Dale Schuurmans, Quoc V. Le, Ed H. Chi, Sharan Narang, Aakanksha Chowdhery, and Denny Zhou. 2023. “Self-Consistency Improves Chain of Thought Reasoning in Language Models.” ICLR.
- [LeastToMost] Denny Zhou, Nathanael Schärli, Le Hou, Jason Wei, Nathan Scales, Xuezhi Wang, Dale Schuurmans, Claire Cui, Olivier Bousquet, Quoc V. Le, and Ed H. Chi. 2023. “Least-to-Most Prompting Enables Complex Reasoning in Large Language Models.” ICLR.
- [ReAct] Shunyu Yao, Jeffrey Zhao, Dian Yu, Nan Du, Izhak Shafran, Karthik R. Narasimhan, and Yuan Cao. 2023. “ReAct: Synergizing Reasoning and Acting in Language Models.” ICLR.
- [TreeOfThoughts] Shunyu Yao, Dian Yu, Jeffrey Zhao, Izhak Shafran, Thomas L. Griffiths, Yuan Cao, and Karthik R. Narasimhan. 2023. “Tree of Thoughts: Deliberate Problem Solving with Large Language Models.” NeurIPS 2023.
- [LongBench] Yushi Bai, Xin Lv, Jiajie Zhang, Hongchang Lyu, Jiankai Tang, Zhidian Huang, Zhengxiao Du, Xiao Liu, Aohan Zeng, Lei Hou, Yuxiao Dong, Jie Tang, and Juanzi Li. 2024. “LongBench: A Bilingual, Multitask Benchmark for Long Context Understanding.” ACL.
- [AgentBench] Xiao Liu, Hao Yu, Hanchen Zhang, Yifan Xu, Xuanyu Lei, Hanyu Lai, Yu Gu, Hangliang Ding, Kaiwen Men, Kejuan Yang, Shudan Zhang, Xiang Deng, Aohan Zeng, Zhengxiao Du, Chenhui Zhang, Sheng Shen, Tianjun Zhang, Yu Su, Huan Sun, Minlie Huang, Yuxiao Dong, and Jie Tang. 2024. “AgentBench: Evaluating LLMs as Agents.” ICLR.
- [WebArena] Shuyan Zhou, Frank F. Xu, Hao Zhu, Xuhui Zhou, Robert Lo, Abishek Sridhar, Xianyi Cheng, Tianyue Ou, Yonatan Bisk, Daniel Fried, Uri Alon, and Graham Neubig. 2024. “WebArena: A Realistic Web Environment for Building Autonomous Agents.” ICLR.
- [MoreAgents] Junyou Li, Qin Zhang, Yangbin Yu, Qiang Fu, and Deheng Ye. 2024. “More Agents Is All You Need.” Transactions on Machine Learning Research.
- [LLMBlender] Dongfu Jiang, Xiang Ren, and Bill Yuchen Lin. 2023. “LLM-Blender: Ensembling Large Language Models with Pairwise Ranking and Generative Fusion.” ACL.
- [MoA] Junlin Wang, Jue Wang, Ben Athiwaratkun, Ce Zhang, and James Zou. 2025. “Mixture-of-Agents Enhances Large Language Model Capabilities.” ICLR.
- [LostConversation] Philippe Laban, Hiroaki Hayashi, Yingbo Zhou, and Jennifer Neville. 2026. “LLMs Get Lost In Multi-Turn Conversation.” ICLR.

## Source Notes

- Section 1 adapts core content from `kodex/slides/slides.pdf`.
- Section 4 adapts design content from `slides/finb-intro.pdf` and `slides/finb-lightning.pdf`.
- Example result details use the finb run reports in the repository plus the user-provided result names.
- `Lost in the Middle: How Language Models Use Long Contexts` should be treated as in-scope if the deck cites long-context position bias: it is a 2024 TACL journal paper, not an out-of-scope preprint.
