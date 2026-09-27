# 발표 대본: Harnesses and Multi-Agent Orchestration

## Slide 1: Harnesses 101
코딩 에이전트를 처음 보면 모델 자체가 갑자기 엔지니어가 된 것처럼 보이기 쉽습니다. 하지만 실제로 달라진 것은 모델 주변의 control loop입니다. 모델이 무엇을 볼 수 있는지, 어떤 도구를 쓸 수 있는지, 무엇을 기억하고 무엇을 막을지가 하네스에서 결정됩니다. 이 섹션에서 가장 중요한 흐름은 모델, 하네스, 도구, 워크스페이스입니다. 토큰 예측이 실제 부작용을 가진 행동으로 바뀌는 지점이 바로 하네스입니다.

## Slide 2: What Is an LLM?
LLM의 기본 동작은 단순합니다. 이미 본 토큰들을 바탕으로 다음 토큰을 예측하고, 그 토큰을 붙인 뒤 다시 다음 토큰을 예측합니다. 긴 답변, 셸 명령, 잘못된 환각도 모두 이런 작은 확률적 선택이 이어진 결과입니다. 그래서 이 슬라이드의 토큰 예시는 일부러 단순하게 만들었습니다. 우리가 지능처럼 느끼는 출력도 결국 많은 로컬 확률 판단이 누적된 것입니다.

## Slide 3: The Transformer Makes It Work
Transformer가 중요했던 이유는 각 예측이 사용 가능한 컨텍스트 전체에서 필요한 부분을 찾을 수 있게 했기 때문입니다. causal LLM에서는 지금 생성할 토큰을 위해 앞선 토큰 중 무엇이 중요한지 학습합니다. 이 구조 덕분에 코드 완성, 번역, 긴 설명이 크게 좋아졌습니다. 하지만 비용도 있습니다. self-attention은 토큰 위치 쌍을 비교하므로 컨텍스트 길이가 늘면 비용이 대략 제곱으로 커집니다. "컨텍스트 윈도우만 키우면 된다"는 말은 엔지니어에게 더 큰 비용과 새로운 신뢰성 문제를 뜻합니다.

## Slide 4: Tokens, Context, and Sampling
모델은 사람이 읽는 문자 단위가 아니라 토큰 단위로 입력을 봅니다. 코드, 문서, 로그, 도구 출력, 이전 대화, 그리고 최종 답변이 모두 같은 컨텍스트 예산을 씁니다. 샘플링 설정도 중요합니다. temperature는 모델이 얼마나 넓게 후보를 탐색할지 바꾸고, top-k와 top-p는 샘플링 전에 후보 토큰을 줄입니다. 같은 프롬프트라도 이 설정에 따라 보수적인 답과 탐색적인 답이 나올 수 있습니다.

## Slide 5: How Models Are Built
이 슬라이드는 모델의 능력을 단계별로 나눠 보기 위한 것입니다. pre-training은 대규모 데이터에서 넓은 next-token 능력을 만듭니다. mid-training이나 domain adaptation은 코드, 수학, long-context 같은 특정 능력을 더 날카롭게 만듭니다. post-training은 우리가 제품에서 보는 행동을 가르칩니다. 지시를 따르고, 도구를 정해진 형식으로 호출하고, 위험한 행동을 피하는 방식입니다. 실제 사용자 앞에 있는 모델은 순수한 연구 산물이 아니라 여러 훈련 단계와 배포 제약이 합쳐진 시스템입니다.

## Slide 6: Base Model to Agent
base model이 agent처럼 보이려면 몇 가지가 추가됩니다. instruction following, tool-call schema, 역할과 정책을 담은 system prompt, 그리고 실제 실행을 통제하는 harness가 필요합니다. 모델은 명령 실행을 요청할 수 있지만, 그 명령이 어디서 실행되고 어떤 결과가 돌아오는지는 하네스가 결정합니다. 그래서 같은 계열의 모델을 써도 제품마다 완전히 다르게 느껴질 수 있습니다. agent behavior는 모델 능력만이 아니라 시스템 설계의 결과입니다.

## Slide 7: What the Harness Owns
하네스는 운영 관점에서 핵심 loop를 소유합니다. 메시지 히스토리를 관리하고, 사용 가능한 도구 schema를 모델에 제공하고, tool call을 실행한 뒤 결과를 다시 컨텍스트에 붙입니다. 또한 언제 멈추고, 재시도하고, 승인을 요청하고, 위험한 행동을 막을지도 결정합니다. 모델은 생성적이지만 정책이 실제로 강제되는 곳은 하네스입니다. 이 경계가 약하면 모델의 제안이 곧바로 위험한 side effect가 됩니다.

## Slide 8: SFT Teaches Tool Use
도구 사용은 모델이 JSON schema를 처음 본 순간 마법처럼 생기는 능력이 아닙니다. supervised fine-tuning에서는 사용자가 요청하고, assistant가 구조화된 tool call을 내고, 도구가 결과를 반환하고, assistant가 그 결과에 근거해 답하는 transcript를 반복해서 보여줍니다. 모델은 형식뿐 아니라 리듬을 배웁니다. 언제 도구를 부르고, 어떻게 인자를 만들고, 언제 추측을 멈춰야 하는지입니다. 그래서 transcript 품질은 중요합니다. 하네스가 모호하거나 지저분한 도구 결과를 붙이면 추론 시점에도 모델에게 나쁜 증거를 주는 셈입니다.

## Slide 9: Single-Agent Harnesses Hit a Ceiling
이제 single-agent 패턴의 한계를 볼 수 있습니다. 한 에이전트는 하나의 컨텍스트 윈도우, 하나의 추론 궤적, 하나의 역할로 전체 일을 끌고 갑니다. 초기에 잘못된 가정을 하면 그 가정은 사라지지 않고 세션의 working memory가 됩니다. 이후 단계는 그 가정을 고치기보다 합리화하는 쪽으로 흐를 수 있습니다. 더 큰 모델은 도움이 되지만, 하나의 긴 trajectory라는 구조적 한계는 그대로 남습니다.

## Slide 10: One Context Window Is Not a Plan
큰 컨텍스트 윈도우가 모든 문제를 해결한다고 말하기 쉽습니다. 하지만 capacity는 control이 아닙니다. 올바른 파일, 잘못된 파일, 세 개의 로그, tool schema, 이전의 나쁜 계획이 모두 같은 프롬프트에 들어갈 수 있습니다. 모델이 올바른 정보에 올바른 순서로 주의를 기울이도록 강제하는 것은 별개의 문제입니다. "다 넣고 기대한다"는 전략은 디버깅과 신뢰성을 빠르게 나쁘게 만듭니다.

## Slide 11: Long Inputs Degrade Attention in Practice
벤치마크도 이 직관을 뒷받침합니다. needle-style 테스트는 긴 컨텍스트 안에 숨겨진 특정 사실을 모델이 찾아낼 수 있는지 봅니다. 성능은 그 정보가 어디에 놓였는지에 민감할 수 있습니다. LongBench 같은 더 넓은 벤치마크는 이 문제가 toy retrieval에만 그치지 않고 QA, 요약, few-shot, synthetic task, code task에도 이어진다는 점을 보여줍니다. 입력이 프롬프트에 들어갔다고 해서 모델이 그것을 잘 사용했다는 뜻은 아닙니다.

## Slide 12: Long Agent Chains Accumulate Errors
tool-using agent에는 긴 컨텍스트 문제에 더해 상태 변화 문제가 있습니다. tool call이 실행될 때마다 새로운 관찰, 새 파일, 새 오해가 transcript에 들어옵니다. 잘못된 가정이 기록에 들어가면 이후 단계가 그것을 중심으로 움직일 수 있습니다. multi-turn degradation 연구는 이 지점을 잘 보여줍니다. 깨끗한 single-turn 설정에서는 할 수 있는 모델도 긴 대화에서는 신뢰성이 떨어질 수 있습니다. 문제는 능력 부족이 아니라 interaction pattern이 run을 서서히 오염시키는 경우가 많습니다.

## Slide 13: Decomposition Is the Escape Hatch
대응은 decomposition입니다. 한 번에 풀기에는 큰 문제를 작은 subproblem으로 나누고, 각 subproblem에 필요한 컨텍스트와 역할만 줍니다. 그리고 필요한 결과만 다음 단계로 넘깁니다. Least-to-most prompting과 Tree of Thoughts는 이 방향을 일찍 보여준 예입니다. 핵심 모양은 DAG입니다. 독립성이 도움이 되는 곳에서는 branch하고, 통합이 필요한 곳에서는 merge합니다. 이렇게 보면 하나의 거대한 agent loop는 지능이라기보다 모든 기술 부채를 하나의 채팅 transcript에 밀어 넣는 방식처럼 보입니다.

## Slide 14: Multi-Agents and Ensemble Inspiration
이제 이 발표의 중심 주장으로 옵니다. multi-agent system은 도구, 역할, 메모리 경계를 가진 test-time ensemble로 볼 수 있습니다. 목표는 더 많은 chatter를 만드는 것이 아닙니다. 충분히 다양한 시도를 보존하고, 그 결과를 명시적으로 synthesis하는 것입니다. fan-out과 merge 그림은 단순하지만 패턴은 강력합니다. 어려운 부분은 orchestration을 연극처럼 보이게 만드는 것이 아니라 규율 있게 만드는 것입니다.

## Slide 15: Classical Ensemble Ideas Map Cleanly
classical ML의 ensemble 언어를 빌리면 설계가 더 명확해집니다. bagging은 반복 샘플이나 병렬 agent, vote-style aggregation과 잘 맞습니다. boosting은 이전 단계의 약점을 다음 단계가 보완하는 staged correction으로 볼 수 있습니다. mixture-of-experts는 specialization과 routing입니다. architecture 질문은 한 역할에, verification은 다른 역할에, synthesis는 결과를 합칠 수 있는 역할에 보냅니다. 비유 자체가 목적은 아니지만, 실제 설계 결정을 이끌 때는 "agent를 더 붙인다"보다 훨씬 좋은 어휘를 줍니다.

## Slide 16: Voting Beats One Guess When Errors Differ
self-consistency의 요지는 단순합니다. 여러 reasoning path를 샘플링했을 때 오류가 서로 다르면, 첫 번째 답을 쓰는 것보다 가장 일관된 답을 고르는 것이 나을 수 있습니다. multi-agent 접근은 이 생각을 여러 worker로 확장합니다. 중요한 조건은 errors differ입니다. 모든 worker가 같은 방식으로 틀리면 병렬화된 실수일 뿐입니다. 하지만 서로 다른 solution path가 가능한 문제에서는 자동화된 병렬 시도가 꽤 저렴하게 정확도를 올릴 수 있습니다.

## Slide 17: Specialization Beats One Generalist
engineering work에서는 voting만으로 충분하지 않습니다. 결과가 완전히 맞거나 틀린 것이 아니라 부분적으로 맞는 경우가 많기 때문입니다. 그래서 specialization이 중요합니다. 어떤 모델이나 역할은 architecture에 강하고, 어떤 역할은 구현 세부사항이나 QA에 강하며, 또 다른 역할은 candidate를 ranking하고 fusion하는 데 강할 수 있습니다. LLM-Blender와 mixture-of-agents가 흥미로운 이유는 여러 후보를 너무 빨리 버리지 않고 비교와 병합까지 보존하기 때문입니다.

## Slide 18: Debate and Collaboration Add Friction on Purpose
agent 연구에서 branching, critique, externalized reasoning이 반복해서 등장하는 이유가 있습니다. 직선적인 generation은 빠르지만 너무 일찍 commit합니다. ReAct는 evidence gathering을 추가하고, Tree of Thoughts는 여러 후보 경로를 탐색합니다. multi-agent collaboration은 이런 deliberation의 일부를 별도 worker의 명시적 산출물로 바꿉니다. 이 friction은 낭비가 아닙니다. 잘못된 방향이 자신감 있는 최종 답으로 굳기 전에 잡을 기회를 만드는 장치입니다.

## Slide 19: Small Contexts Can Beat One Long Context
여러 작은 컨텍스트가 하나의 긴 컨텍스트보다 나을 수 있는 이유는 세 가지입니다. 첫째, 각 agent는 덜 지저분한 prompt와 더 좁은 checklist를 봅니다. 둘째, 서로 다른 가정이 한 monologue에 섞이지 않고 disagreement로 드러납니다. 셋째, synthesis 단계가 무엇을 공유 narrative에 남길지 결정하도록 강제합니다. 단, synthesis가 허술하면 팀은 더 많은 텍스트와 더 많은 혼란만 만듭니다. agent 수보다 orchestration 품질이 더 중요합니다.

## Slide 20: finb Design Decisions
여기서부터는 이 아이디어를 finb에 어떻게 반영했는지입니다. 저는 꽤 비관적인 가정에서 출발했습니다. agent는 무언가를 깨뜨리고, 스스로에게 그럴듯한 이야기를 만들고, 가끔 컨텍스트를 낭비하는 새로운 방법을 찾습니다. 그래서 설계 원칙은 단순했습니다. damage를 싸게 만들고, work를 inspectable하게 만들고, synthesis를 explicit하게 만들고, 한 vendor나 한 harness에 시스템을 묶지 않는 것입니다.

## Slide 21: Design Around Failure
이 슬라이드는 시스템 설계의 tradeoff입니다. full lockdown은 안전하지만 사람의 승인이 병목이 됩니다. YOLO mode는 빠르지만 잘못된 명령 하나가 워크스페이스를 망칠 수 있습니다. 제가 원한 것은 중간 경로입니다. agent에게 움직일 공간을 주되, blast radius를 되돌릴 수 있게 만드는 것입니다. 목표는 실패를 없앤다고 가정하는 것이 아니라 controlled failure를 설계하는 것입니다.

## Slide 22: Safe-to-Destruct Workspaces
구체적인 메커니즘은 safe-to-destruct workspace입니다. 각 agent는 copy-on-write ZFS snapshot에서 실행되고, rollback은 매우 싸기 때문에 파괴를 재난이 아니라 일상적인 control mechanism으로 다룰 수 있습니다. chroot는 agent를 자신에게 배정된 filesystem 안에 묶습니다. container나 full VM을 architecture의 중심에 두지 않아도 됩니다. 질문은 "agent를 믿을 수 있는가"가 아니라 "믿으면 안 됐을 때 즉시 복구할 수 있는가"가 됩니다.

## Slide 23: Agent Teams Are a DAG
isolation 다음의 설계 선택은 실행 구조였습니다. finb는 team run을 여러 이름이 들어간 하나의 거대한 대화가 아니라 phased DAG로 봅니다. 같은 phase 안의 작업은 병렬로 실행할 수 있고, phase 사이에서는 중요한 결과를 synthesis해서 다음 단계로 넘깁니다. dependency가 명시적으로 남기 때문에 나중에 어떤 결정이 왜 나왔는지 추적하기 쉽습니다. hidden state는 편하지만 디버깅할 때는 설명이 되지 않습니다.

## Slide 24: Mailbox Turns Agents Into a Team
mailbox는 agent들을 병렬 stranger가 아니라 team처럼 보이게 만든 coordination primitive입니다. agent는 named teammate에게 mail을 보낼 수 있고, 그 mail은 다음 phase에서 visible prompt context로 전달됩니다. 그래서 coordination은 explicit하고 attributable하며 audit 가능합니다. "agent들이 어쩐지 알고 있었다"는 설명이 아니라 누가 누구에게 어떤 영향을 줬는지 transcript에 남습니다.

## Slide 25: Synthesis Has Influence Tiers
초기 run에서 배운 점은 synthesis가 단순 summarization이면 부족하다는 것입니다. finb는 influence tier를 둡니다. primary agent가 최종 narrative와 coherence를 책임지고, supporting agent가 major section과 constraint를 shaping하며, contributing agent가 evidence, edge case, check를 제공합니다. primary를 하나 두는 이유는 최종 산출물이 committee document처럼 흐려지는 것을 막기 위해서입니다. 동시에 disagreement나 provenance가 중요할 때는 attributed synthesis도 사용할 수 있습니다.

## Slide 26: Iteration Keeps the Team Moving
좋은 결과는 첫 번째 pass가 아니라 두 번째 pass에서 나오는 경우가 많습니다. finb는 iteration을 first-class loop로 다룹니다. 현재 deliverable을 다시 planning에 넣고, fresh agent를 fresh context로 실행하며, 실패한 부분만 재시도합니다. 긴 run에서 한 worker가 실패했다고 모든 작업을 처음부터 replay하면 안 됩니다. checkpoint와 re-entry point는 데모와 실제로 쓸 수 있는 시스템을 가르는 차이입니다.

## Slide 27: Harness-Agnostic Architecture
마지막 설계 포인트는 harness-agnostic architecture입니다. finb는 underlying harness를 대체하려는 것이 아니라 orchestrate하려는 시스템입니다. TUI는 interaction과 visibility를 맡고, orchestrator는 planning, mailbox, context, synthesis를 맡습니다. agent manager는 process lifecycle과 output capture를 처리하고, harness layer는 Claude Code, Gemini CLI, 앞으로 나올 도구들에 매핑됩니다. 이 분리는 portability를 주고 orchestration logic을 특정 provider의 product assumption에 묶이지 않게 합니다.

## Slide 28: Example Results
이 예제들은 시스템이 단순한 control surface를 넘어 실제로 쓸모 있을 수 있다고 느끼게 한 지점입니다. `termnes`는 Rust로 terminal NES emulator를 만들었고 CPU, PPU, renderer, input, mapper 같은 subsystem 경계를 다뤘습니다. `at3rs`는 ATRAC3 audio codec이라는 꽤 특수한 도메인을 다뤘습니다. `sloppng`는 PNG binary parsing, validation, CLI workflow를 가진 도구를 만들었습니다. 이들은 "정렬 함수 하나 만들어줘" 수준이 아니라 multi-file, integration-heavy build입니다.

## Slide 29: What the Results Demonstrate
이 결과가 보여주는 것은 마법이 아닙니다. 그래서 더 흥미롭습니다. planning agent는 어려운 project를 specialist가 독립적으로 공격할 수 있는 phase로 나눕니다. verification과 review pass는 single linear generation이 놓치는 integration bug를 잡습니다. synthesis는 병렬 노력을 하나의 coherent codebase로 바꿉니다. 실제 product는 더 많은 generated prose가 아니라 rollback 아래에서 조율된 execution입니다.

## Slide 30: References
참고문헌을 하나씩 읽지는 않겠습니다. 대신 지적 흐름만 짚겠습니다. Transformer는 base architecture를 줬고, chain-of-thought와 ReAct는 visible reasoning과 action의 연결을 보여줬습니다. Tree of Thoughts와 self-consistency는 branching search의 가치를 보여줬고, LongBench는 long context의 현실적인 한계를 보여줬습니다. 최근 ensemble-style 연구들은 synthesis와 specialization의 방향을 제시합니다. 이 발표의 핵심은 더 좋은 agent behavior가 더 좋은 모델뿐 아니라 더 좋은 orchestration에서 나온다는 점입니다.
