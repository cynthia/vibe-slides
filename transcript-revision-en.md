# Revision Transcript: Harnesses and Multi-Agent Orchestration

## Slide 1: Harnesses and Multi-Agent Orchestration
Tonight I want to walk a single path: from a language model, to an LLM inside a harness, to a single agent, and then to agentic teams. The model predicts tokens, but the harness turns those predictions into behavior with real consequences. Once we accept that, multi-agent systems become less mysterious. They are coordinated control loops with boundaries, tools, rollback, and synthesis.

## Slide 2: What Is a Language Model?
This slide is about language models in general, not just modern LLMs. The basic object is a probability distribution over the next word or token. At time t, the model estimates P_t of the next token given the prefix so far: w_1 through w_(t-1). More formally, that prefix is an element of V^(t-1), the Cartesian product of the vocabulary with itself t-1 times. In an RNN-style regime, that whole prefix is compressed through a recurrent hidden state. The state h_t is updated from the previous state and the current input, and the next-token distribution is produced from that state. That is powerful, but it creates an obvious bottleneck: everything the model remembers has to survive this sequential compression.

## Slide 3: From RNNs to Transformers
The transformer changed the scaling regime. Instead of forcing the prefix through one recurrent state, self-attention lets token positions look directly at other token positions. That delta matters for two reasons. First, long-range dependencies no longer have to be carried only through a compressed hidden state. Second, training can be parallelized across positions much more naturally than recurrent training. RNNs did not disappear because recurrence is useless; they stopped being the dominant LLM substrate because recurrence makes large-scale training and long-range state much harder to scale. Kaplan-style scaling laws and the later Hoffmann or Chinchilla compute-optimal work matter here because they show why scale became an engineering lever once the architecture could actually exploit data, parameters, and compute.

## Slide 4: How Models Are Built
This slide separates the training and production layers. Pre-training gives broad next-token competence from large-scale data. Mid-training is optional, but increasingly common: additional adaptation for code, math, long-context behavior, or a domain. Post-training teaches instruction-following behavior through supervised examples and preference optimization. Production then wraps the model with policy, tools, monitoring, product constraints, and the harness. By the time we use an assistant, we are using a trained model inside a production system.

## Slide 5: Base Model to Agent
So how does a base model become something that looks agentic? We add instruction tuning, tool schemas, a system prompt, and then a harness. The important distinction is that a model can ask for an action, but it does not execute the action by itself. The harness decides whether a command runs, where it runs, and what result gets appended back into the conversation. That is why two products using similar models can behave very differently.

## Slide 6: What the Harness Owns
The harness owns the operational loop. It manages message history, exposes tools, executes tool calls, and appends results. It is also the security boundary: the model proposes actions, but the harness can ask, approve, block, retry, or sandbox them. It is also a reliability boundary, because tool results, errors, and policy decisions all become the evidence the model sees next. Kodex is a small example of this basic harness pattern.

## Slide 7: Multi-Turn Tool Use
Tool use is not one call and done. Real agent sessions are multi-turn interactions: the model asks to run tests, reads the result, asks to inspect a file, sees another result, and only then proposes a change. ReAct is one research reference point for interleaving reasoning and action; Toolformer is another reference point for models learning to use external tools. In deployed systems, the key systems fact is that every tool result becomes next-turn state. That is useful because it grounds the model, but it also means mistakes and noisy outputs can compound.

## Slide 8: Single-Agent Harnesses Hit a Ceiling
This is where the one-agent pattern starts to crack. Up to this point the story is additive: model plus harness plus tools gives us an agent. The next question is what happens when that single agent has to carry too much. One agent has one context window, one trajectory, and one lens on the task. The image is the joke version of the problem: one context carrying the plan, files, logs, decisions, and patches all at once. If it makes an early bad assumption, that assumption can become part of the working memory for the rest of the run. Bigger models help, but one long trajectory is still one long trajectory.

## Slide 9: Context Is Capacity, Not Control
This is the point I was trying to make with the old phrase "one context window is not a plan." A context window is capacity: it can hold instructions, files, logs, tool output, previous messages, and previous mistakes. A plan is control structure: ordering, dependencies, state boundaries, and explicit handoffs. A giant prompt can contain the right evidence and still not force the model to use it in the right order. Capacity helps, but organization is what turns capacity into a reliable workflow.

## Slide 10: Long Inputs Degrade Attention in Practice
Benchmarks back up that intuition. Needle-style tests show that retrieval can be sensitive to where information appears in a long context. LongBench shows that long-context difficulty is broader than toy retrieval: it affects question answering, summarization, few-shot tasks, and code. There is an architectural caveat: sparse, linear, and other efficient attention patterns can change the scaling behavior. But changing the attention pattern does not automatically give the system a plan, a dependency graph, or a clean state model. Fitting something in the prompt is not proof that the model used it well.

## Slide 11: Long Agent Chains Accumulate Errors
Agents add another problem: state keeps changing. Every tool call can inject new observations, artifacts, or misunderstandings into the transcript. Once a bad assumption becomes written state, later turns often rationalize around it instead of correcting it. This is why multi-turn reliability can drop even when the model is capable in a cleaner single-turn setting. The failure is often the interaction pattern, not raw capability.

## Slide 12: Decomposition Is the Escape Hatch
The response is decomposition. Split the task, give each part the context it actually needs, and only pass forward what matters. The theoretical intuition is divide-and-conquer: reduce interference inside each subproblem, then pay the complexity cost at synthesis time. Least-to-most prompting and Tree of Thoughts both hint at this pattern: branch where independence helps, then merge where synthesis is required. This is the bridge from single-agent limits to agent teams: decomposition is useful only if the harness can run, isolate, and synthesize the parts.

## Slide 13: Multi-Agents and Ensemble Inspiration
The main claim is that multi-agent systems are a kind of test-time ensemble with tools, roles, and memory boundaries. Each trajectory depends on the model, role, context, and tool surface. Ensembles help when the workers are not all wrong in the same way. The tiny failure formula is deliberately idealized: if each worker fails with probability p and failures are independent, everyone failing shrinks like p to the k. Real agents are correlated, so the design question is how to create useful diversity through role separation, context boundaries, and synthesis.

## Slide 14: Voting Beats One Guess When Errors Differ
Now we turn the ensemble intuition into design pressure. Self-consistency made a simple point that matters: if you sample multiple reasoning paths and their errors differ, selecting the most consistent answer can beat taking the first guess. Multi-agent work extends that intuition to instantiated workers. The key condition is error diversity. If every worker is wrong in the same way, you have parallelized a mistake. When the task admits different solution paths, parallel attempts can be valuable.

## Slide 15: Specialization Can Beat One Generalist
Engineering outputs are often partially right, not simply right or wrong. That is where specialization helps. One role can focus on architecture, another on verification, another on security, another on performance. Systems like LLM-Blender and mixture-of-agents preserve multiple candidates long enough to rank, compare, and fuse them. The synthesizer is not just picking a winner. It is assembling the strongest pieces into one coherent result.

## Slide 16: Debate Adds Friction
Straight-line generation is fast, but it commits early. Chain-of-thought exposes intermediate reasoning. Tree of Thoughts searches across branches. ReAct interleaves reasoning with evidence gathering. Multi-agent collaboration externalizes some of that deliberation across workers. The friction is intentional. It creates opportunities to catch a bad direction before it hardens into a finished answer with confident formatting.

## Slide 17: Small Contexts Can Help
Several smaller contexts can beat one huge context when the split preserves the signal and removes distractors. That condition matters. If decomposition throws away the important evidence, the system gets worse. But when each worker sees the material it actually needs, the signal-to-noise ratio improves and disagreements become visible instead of being blended into one monologue. The warning is important: weak synthesis just creates more text. Orchestration quality matters more than agent count.

## Slide 18: Recent Industry Trends
Now that the theory is on the table, this slide places the idea next to current industry signals. It is not proof of this architecture, but it is useful evidence about where the field is moving. Sakana Fugu presents multi-agent coordination behind a model API. Gemini Deep Research shows the same pressure in a consumer research workflow: make a plan, browse, refine, and return a cited report. OpenRouter Fusion is the model-routing version: run a panel of models, have a judge surface consensus, contradictions, and gaps, then let the outer model write the final answer. These are different products, but they point in the same direction: composed systems are becoming normal. I am using them as backdrop, not as the claim.

## Slide 19: Where This Differs
This is the narrowing slide. The industry examples show model composition, research workflows, and answer synthesis. This harness is aimed at a different unit of work: executable change. It runs workers in disposable workspaces, gives them visible handoffs, and forces synthesis to be explicit. That narrower scope is why the rest of the design focuses on process reliability rather than raw model capability.

## Slide 20: Design Around Failure
The design posture for finb starts with failure. The previous slides explain why teams can help, but executable agent work also multiplies the number of things that can go wrong. Full lockdown is safe, but the human becomes the bottleneck. Full YOLO mode is fast until one bad command destroys the workspace. The middle path is reversible freedom: give agents room to act inside an environment that can roll back instantly. The target is controlled blast radius, not constant approval and not blind trust.

## Slide 21: Safe-to-Destruct Workspaces
The concrete mechanism is safe-to-destruct workspaces. ZFS snapshots provide copy-on-write workspaces and near-instant rollback. Chroot provides a filesystem boundary without making a full VM the center of the architecture. The graphic is the intended mental model: keep a clean original, make a disposable copy, let the agent experiment inside the copy, then either keep the result or throw the copy away. Undo is not an emergency procedure. It is a normal control mechanism that turns mistakes into tries.

## Slide 22: Agent Teams Are a DAG
Once isolation is handled, the next design choice is execution structure. Agent teams are modeled as a DAG: plan, run a phase, synthesize, then run the next phase. This borrows the distributed-systems habit of making state explicit: handoffs are serialized, dependencies are visible, and side effects stay bounded. Within a phase, tasks can run concurrently. Between phases, dependencies stay explicit.

## Slide 23: Example
Here is the concrete execution shape. A user asks for a feature or fix, the planner emits a phased JSON plan, and the human can review it before execution. The harness then fans out tasks to named agents. Each worker gets bounded context, its own workspace, and the tools it is allowed to use. Agents can leave named handoffs through the mailbox. The harness synthesizes the phase output, delivers the useful state into the next phase, and can retry failed work without rerunning everything. Gastown is an inspiration here: persistent worker identity, mailboxes, and explicit handoffs are treated as first-class coordination primitives rather than informal chat.

## Slide 24: Orchestrator + Mailbox Make a Team
The mailbox alone is not the team. The team comes from combining a leader or orchestrator with explicit inter-agent communication. The orchestrator owns the plan, assigns roles, fans work out, synthesizes results, and decides what moves to the next phase. The mailbox lets agents leave named handoffs for one another, and those handoffs arrive as visible prompt context. That combination gives you direction plus peer communication. There is no shared hidden state that everyone somehow knows; coordination is written down, delivered by the harness, and auditable.

## Slide 25: Synthesis Has Influence Tiers
Synthesis needs structure, not just summarization. A primary agent owns final coherence. Supporting agents shape major sections, constraints, and tradeoffs. Contributing agents add evidence, edge cases, and checks. This avoids the final answer becoming a committee document while still preserving useful input from the broader team. Depending on the task, synthesis can be unified or attributed.

## Slide 26: Iteration and Harness Abstraction
Iteration keeps the team useful after the first pass. A deliverable can feed back into planning, fresh agents can start with fresh context, and only failed work needs to be retried. In practice, that follow-up loop behaves like a recursion mechanism for iteration: take the current artifact, turn it into the next problem statement, and run another bounded phase. The architecture also stays harness-agnostic: the TUI handles interaction, the orchestrator handles planning and synthesis, the agent manager handles lifecycle, and the harness layer maps onto concrete tools. That separation keeps the system portable.

## Slide 27: Example Projects
These examples are where the system became more than an interesting control surface. termnes produced a terminal NES emulator with CPU, PPU, mapper, renderer, and input boundaries. Its input was NES technical documentation plus one test ROM. at3rs tackled ATRAC3, a niche signal-processing domain. Its input was an ATRAC academic paper, a proprietary reference codec binary running as a PE on Linux through Wine, and test WAVs. sloppng built PNG tooling with binary parsing, validation, and a CLI from the W3C PNG specification. These are not toy sorting functions. They are multi-file builds with real integration points, and all three reached working implementations in one overnight run.

## Slide 28: What the Results Demonstrate
The results demonstrate coordinated execution, not magic. Planning breaks work into phases. Specialists own bounded pieces. Synthesis turns parallel work into one design. Integration makes it a coherent codebase. Verification catches cross-file bugs. The important artifact is not more generated prose. It is a workflow where parallel agents can produce inspectable work under rollback.

## Slide 29: Why Not Open Source?
Before questions, I want to answer the obvious practical question: why not release finb as an open source project? The honest answer is that finb is personal infrastructure. It is tuned for my workflow, my taste in interfaces, and my tolerance for niche systems choices. The UI takes inspiration from orthodox file managers, which is not exactly a mass-market design center. The execution model assumes things like ZFS snapshots, and that alone filters out most reasonable people. Turning that into a polished general-purpose product would either sand off the parts that make it useful to me, or ask everyone else to inherit my local preferences.

There is also a broader point. Agent tooling is moving too fast for me to pretend that one harness abstraction should win. Model APIs, context limits, permission models, CLIs, and product surfaces keep changing. A tool that feels novel today may be ordinary or obsolete in a few months. In that environment, the strongest move is often not to wait for a universal framework. It is to build or adapt a small toolchain that matches your own work, and keep it malleable.

So the thing I want to share is not a package. It is the set of design ideas: make failure cheap, bound the context, make work visible, preserve handoffs, and synthesize explicitly. If those ideas help you build a better loop for yourself or your team, then this talk did its job. I am not trying to turn finb into an open source identity project. I am trying to show the shape of a system that made me more productive.

## Slide 30: Questions?
That is the talk. The short version is: models predict tokens, harnesses turn predictions into controlled behavior, and multi-agent orchestration gives us a way to split work without dumping everything into one fragile context window. The useful systems are the ones that make failure cheap, work visible, and synthesis explicit.

## Slide 31: References
This final slide collects the base model architecture, reasoning and tool-use papers, long-context evidence, agent benchmarks, ensemble and mixture-of-agents work, shipping systems used for comparison, and Gastown as an explicit inspiration. I am putting it at the end so it stays available for follow-up without interrupting the closing argument.
